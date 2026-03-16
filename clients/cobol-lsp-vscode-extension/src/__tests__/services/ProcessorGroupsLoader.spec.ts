/*
 * Copyright (c) 2025 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

import {
  FileNotFound,
  getConfigurationResult,
  getWorkspaceFolderResult,
  readFileResult,
} from "../../__mocks__/vscode";
import { DEFAULT_DIALECT } from "../../constants";
import { DatasetLib } from "../../services/copybookLibs/DatasetLib";
import LocalPathLib from "../../services/copybookLibs/LocalPathLib";
import {
  LibsDefinitions,
  readSettingConfig,
  readWorkspaceConfig,
  readEndevorConfig,
  transformLibs,
} from "../../services/ProcessorGroupsLoader";
import * as vscode from "vscode";
import { outputChannel } from "../../services/util/OutputChannel";
import {
  externalApis,
  initializeExternalAPIs,
} from "../../services/ExternalAPIsService";
import { CopybookDownloaderForE4E } from "../../services/copybook/downloader/CopybookDownloaderForE4E";
import { E4EExternalConfigurationResponse } from "../../type/e4eApi";
import { e4eMock } from "../../__mocks__/getE4EMock.utility";

describe("ProcessorGroupsLoader", () => {
  describe("readSettingConfig", () => {
    describe("local libs have priority over uss and dsn", () => {
      beforeEach(() => {
        getConfigurationResult["paths-local"] = ["copybooks"];
        getConfigurationResult["paths-dsn"] = ["DATASET.WITH.COPYBOOKS"];
        getConfigurationResult["paths-uss"] = ["/user/copybooks"];
      });

      it("generates workspace processor group with local path first", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(new LocalPathLib("copybooks"));
      });
    });

    describe("dsn have priority over uss", () => {
      beforeEach(() => {
        getConfigurationResult["paths-local"] = [];
        getConfigurationResult["paths-dsn"] = ["DATASET.WITH.COPYBOOKS"];
        getConfigurationResult["paths-uss"] = ["/user/copybooks"];
      });

      it("generates workspace processor group with dsn path first", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(
          new DatasetLib("DATASET.WITH.COPYBOOKS"),
        );
      });
    });

    describe("the order of resolution is same as the one provided in user settings", () => {
      beforeAll(() => {
        getConfigurationResult["paths-dsn"] = [
          "FIRST.DATASET",
          "SECOND.DATASET",
        ];
      });
      it("checks the order in generated processor group is same as the one provided in user settings", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(new DatasetLib("FIRST.DATASET"));
        expect(result.libs![1]).toEqual(new DatasetLib("SECOND.DATASET"));
      });
    });
  });

  describe("readWorkspaceConfig", () => {
    const WORKSPACE_PATH = "/tests/processor-groups-loader";
    const WORKSPACE_URI = vscode.Uri.file(WORKSPACE_PATH);

    describe("proc_grps.json file doesn't exist", () => {
      beforeEach(() => {
        getWorkspaceFolderResult.uri = WORKSPACE_URI;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] =
          new FileNotFound();
      });

      it("returns undefined", async () => {
        const result = await readWorkspaceConfig(WORKSPACE_URI);
        expect(result).toBeUndefined();
      });
    });

    describe("proc_grps.json is invalid", () => {
      beforeEach(() => {
        getWorkspaceFolderResult.uri = WORKSPACE_URI;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] = "{}";
      });

      it("returns undefined & error is logged", async () => {
        const result = await readWorkspaceConfig(WORKSPACE_URI);
        expect(result).toBeUndefined();
        expect(outputChannel.error).toHaveBeenCalledWith(
          expect.stringContaining("Could not validate data"),
        );
      });
    });

    describe("pgm_conf.json doesn't exist", () => {
      beforeEach(() => {
        getWorkspaceFolderResult.uri = WORKSPACE_URI;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] =
          `{"pgroups": [{ "name": "b4g group" }]}`;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/pgm_conf.json`] =
          new FileNotFound();
      });

      it("returns just process groups definitions and empty programs", async () => {
        const result = await readWorkspaceConfig(WORKSPACE_URI);
        expect(result).toEqual({
          processorGroups: {
            "b4g group": {
              libs: [],
              name: "b4g group",
              preprocessors: [],
            },
          },
          programs: [],
        });
      });
    });

    describe("pgm_conf.json is invalid", () => {
      beforeEach(() => {
        getWorkspaceFolderResult.uri = WORKSPACE_URI;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] =
          `{"pgroups": [{ "name": "b4g group" }]}`;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/pgm_conf.json`] = "{}";
      });

      it("returns just processor groups definitions and empty programs", async () => {
        const result = await readWorkspaceConfig(WORKSPACE_URI);
        expect(result).toEqual({
          processorGroups: {
            "b4g group": {
              libs: [],
              name: "b4g group",
              preprocessors: [],
            },
          },
          programs: [],
        });
        expect(outputChannel.error).toHaveBeenCalledWith(
          expect.stringContaining("Could not validate data"),
        );
      });
    });
  });

  describe("transformLibs", () => {
    it("keep order of libraries", () => {
      const input: LibsDefinitions = [
        "/local/lib/1",
        { dataset: "remote.lib.1" },
        "/local/lib/2",
        { dataset: "remote.lib.2" },
      ];

      const result = transformLibs(input, [LocalPathLib, DatasetLib], []);

      expect(result).toEqual([
        new LocalPathLib("/local/lib/1"),
        new DatasetLib("remote.lib.1"),
        new LocalPathLib("/local/lib/2"),
        new DatasetLib("remote.lib.2"),
      ]);
    });
  });

  describe("transform pre processors", () => {
    it("test transformed and non-transformed preprocessor", async () => {
      const WORKSPACE_PATH = "/tests/processor-groups-loader";
      const WORKSPACE_URI = vscode.Uri.file(WORKSPACE_PATH);
      const mockConfigResponse: E4EExternalConfigurationResponse = {
        pgroups: [
          {
            name: "DATASET",
            libs: [
              {
                dataset: "MY.DATASET",
              },
            ],
            preprocessor: [
              {
                name: "PREPROC1",
              },
              {
                name: "DSNHPC",
              },
            ],
          },
        ],
        pgms: [{ program: "COBOL/PROGRAM", pgroup: "endevor_pgroup" }],
      };

      await initializeExternalAPIs(vscode.Uri.file("/storage"));
      jest.spyOn(externalApis, "handleAsEndevorElement").mockReturnValue(true);
      const e4eDownloader = new CopybookDownloaderForE4E(
        vscode.Uri.file("/storagePath"),
        e4eMock,
      );
      externalApis.e4eDownloader = e4eDownloader;

      jest
        .spyOn(externalApis.e4eDownloader, "getEndevorProcessorGroupConfig")
        .mockResolvedValue(mockConfigResponse);

      const result = await readEndevorConfig(
        vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
      );
      expect(result).not.toBeUndefined();

      const preprocessors = result?.processorGroups["DATASET"]?.preprocessors;
      expect(preprocessors).not.toBeUndefined();
      expect(preprocessors?.length).toBe(2);
      expect(preprocessors?.[0].name).toBe("PREPROC1");
      expect(preprocessors?.[1].name).toBe("DB2");
    });
  });
});
