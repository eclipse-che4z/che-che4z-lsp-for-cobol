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

import LocalPathLib, {
  localCopybooks,
} from "../../../../services/copybookLibs/LocalPathLib";
import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import {
  findFilesResult,
  getConfigurationResult,
  getWorkspaceFolderResult,
  readFileResult,
} from "../../../../__mocks__/vscode";
import { DEFAULT_DIALECT } from "../../../../constants";
import { loadProcessorGroupCopybooksLibs } from "../../../../services/ProcessorGroups";

describe("Local copybook library", () => {
  beforeEach(async () => {
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
    getConfigurationResult["copybook-extensions"] = [".CPY", ".cpy", ""];
    localCopybooks.clearCache();
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  describe("resolveCopybookUri", () => {
    describe("absolute copybook path", () => {
      beforeEach(() => {
        findFilesResult["/local/absolute/path"] = [
          vscode.Uri.file("/local/absolute/path/COPYBOOK.cpy"),
        ];
        findFilesResult["/local/absolute@#$/path"] = [
          vscode.Uri.file("/local/absolute@#$/path/COPYBOOK.cpy"),
        ];
      });

      it("resolves local copybook uri", async () => {
        const lib = new LocalPathLib("/local/absolute/path");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/local/absolute/path/COPYBOOK.cpy"),
        );
      });

      it("@#$ in names", async () => {
        const lib = new LocalPathLib("/local/absolute@#$/path");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/local/absolute@#$/path/COPYBOOK.cpy"),
        );
      });
    });

    describe("relative copybook path", () => {
      beforeEach(() => {
        findFilesResult["/workspace/copybooks"] = [
          vscode.Uri.file("/workspace/copybooks/COPYBOOK.cpy"),
        ];
        findFilesResult["/other/copybooks"] = [
          vscode.Uri.file("/other/copybooks/COPYBOOK.cpy"),
          vscode.Uri.file("/other/copybooks/OTHER.cpy"),
        ];
      });

      it("resolves copybook uri in workspace folders, first found result is used", async () => {
        const lib = new LocalPathLib("copybooks");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/workspace/copybooks/COPYBOOK.cpy"),
        );

        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/workspace/copybooks"),
          pattern: "*",
        });
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/other/copybooks"),
          pattern: "*",
        });
      });

      it("resolves copybook from second workspace folder if not found in first", async () => {
        const lib = new LocalPathLib("copybooks");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "OTHER",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(vscode.Uri.file("/other/copybooks/OTHER.cpy"));
      });
    });

    describe("Path variables are evaluated during copybook resolution", () => {
      beforeEach(() => {
        findFilesResult["/workspace/copybooks"] = [
          vscode.Uri.file("/workspace/ABCPROG/copybooks/ABCCOPY.cpy"),
        ];
        findFilesResult["/path/to/program/copybooks"] = [
          vscode.Uri.file("/path/to/program/copybooks/ABCCOPY.cpy"),
        ];
        findFilesResult["/other/copybooks"] = [
          vscode.Uri.file("/other/copybooks/ABCCOPY.cpy"),
        ];
        findFilesResult["/program/copybooks"] = [
          vscode.Uri.file("/program/copybooks/ABCCOPY.cpy"),
        ];
      });

      it("replaces ${workspaceFolder} and ${fileBasenameNoExtension} variables with values", async () => {
        const lib = new LocalPathLib(
          "${workspaceFolder}/${fileBasenameNoExtension}/copybooks",
        );
        const document = vscode.Uri.file("/ABCPROG.cbl");
        const result = await lib.resolveCopybookUri(
          "ABCCOPY",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/workspace/ABCPROG/copybooks/ABCCOPY.cpy"),
        );
      });

      it("replaces ${fileDirname} variable with a value", async () => {
        const lib = new LocalPathLib("${fileDirname}/copybooks");
        const document = vscode.Uri.file("/path/to/program/ABCPROG.cbl");
        const result = await lib.resolveCopybookUri(
          "ABCCOPY",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/path/to/program/copybooks/ABCCOPY.cpy"),
        );
      });

      it("replaces ${workspaceFolder:other} variable with a value", async () => {
        const lib = new LocalPathLib("${workspaceFolder:other}/copybooks");
        const document = vscode.Uri.file("/path/to/program/ABCPROG.cbl");
        const result = await lib.resolveCopybookUri(
          "ABCCOPY",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(vscode.Uri.file("/other/copybooks/ABCCOPY.cpy"));
      });

      it("replaces ${fileDirnameBasename} variable with a value", async () => {
        const lib = new LocalPathLib("/${fileDirnameBasename}/copybooks");
        const document = vscode.Uri.file("/path/to/program/ABCPROG.cbl");
        const result = await lib.resolveCopybookUri(
          "ABCCOPY",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.file("/program/copybooks/ABCCOPY.cpy"),
        );
      });
    });

    describe("Glob patterns can be used as local path", () => {
      it("Glob patter is used to search local folders", async () => {
        const lib = new LocalPathLib("src/**/copybooks");
        const document = vscode.Uri.file("/ABCPROG.cbl");
        await lib.resolveCopybookUri("ABCCOPY", document, DEFAULT_DIALECT);
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/workspace/src"),
          pattern: "**/copybooks/*",
        });
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/other/src"),
          pattern: "**/copybooks/*",
        });
      });
    });

    describe("copybook files extension filter configuration is respected", () => {
      const WORKSPACE_PATH = "/tests/local-libs-ext";
      const WORKSPACE_URI = vscode.Uri.file(WORKSPACE_PATH);

      beforeEach(() => {
        getConfigurationResult["copybook-extensions"] = [".cpa"];
        getConfigurationResult["paths-local"] = ["a"];
        getWorkspaceFolderResult.uri = WORKSPACE_URI;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] = `{
          "pgroups": [
            {
              "name": "test",
              "copybook-extensions": ["cpb"],
              "libs": ["b"],
              "preprocessor": [
                {
                  "name": "preproc",
                  "copybook-extensions": ["cpc"],
                  "libs": ["c"]
                }
              ]
            }
          ]
        }`;
        readFileResult[`${WORKSPACE_PATH}/.cobolplugin/pgm_conf.json`] = `{
            "pgms": [
                { "program": "/TEST.cob", "pgroup": "test" }
            ]
          }`;

        const extensions = ["cpa", "cpb", "cpc"];
        const testFile = (path: string, ext: string) =>
          vscode.Uri.file(`${path}/COPY.${ext}`);
        const testFiles = (path: string) =>
          extensions.map((ext) => testFile(path, ext));

        findFilesResult[`${WORKSPACE_PATH}/a`] = testFiles(
          `${WORKSPACE_PATH}/a`,
        );
        findFilesResult[`${WORKSPACE_PATH}/b`] = testFiles(
          `${WORKSPACE_PATH}/b`,
        );
        findFilesResult[`${WORKSPACE_PATH}/c`] = testFiles(
          `${WORKSPACE_PATH}/c`,
        );
      });

      it("uses vscode settings extension configuration", async () => {
        const document = vscode.Uri.file("/NOPG.cob");
        const libs = await loadProcessorGroupCopybooksLibs(
          document,
          DEFAULT_DIALECT,
        );
        const result = await libs[0].resolveCopybookUri(
          "COPY",
          document,
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(vscode.Uri.file(`${WORKSPACE_PATH}/a/COPY.cpa`));
      });

      it("uses processor group extension configuration", async () => {
        const document = vscode.Uri.file("/TEST.cob");
        const libs = await loadProcessorGroupCopybooksLibs(
          document,
          DEFAULT_DIALECT,
        );
        const result = await libs[0].resolveCopybookUri(
          "COPY",
          document,
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(vscode.Uri.file(`${WORKSPACE_PATH}/b/COPY.cpb`));
      });

      it("uses processor group preprocessor extension configuration", async () => {
        const document = vscode.Uri.file("/TEST.cob");
        const libs = await loadProcessorGroupCopybooksLibs(document, "preproc");
        const result = await libs[0].resolveCopybookUri(
          "COPY",
          document,
          "preproc",
        );
        expect(result).toEqual(vscode.Uri.file(`${WORKSPACE_PATH}/c/COPY.cpc`));
      });
    });
  });

  describe("listCopybooks", () => {
    describe("absolute copybook path", () => {
      beforeEach(() => {
        findFilesResult["/local/absolute/path"] = [
          vscode.Uri.file("/local/absolute/path/COPYBOOK.cpy"),
          vscode.Uri.file("/local/absolute/path/SECOND.CPY"),
          vscode.Uri.file("/local/absolute/path/NOEXT"),
          vscode.Uri.file("/local/absolute/path/INVALID.ext"),
        ];
      });

      it("list local copybooks uri", async () => {
        const lib = new LocalPathLib("/local/absolute/path");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.listCopybooks(document, DEFAULT_DIALECT);
        expect(result).toEqual(["COPYBOOK", "SECOND", "NOEXT"]);
      });
    });

    describe("relative copybook path", () => {
      beforeEach(() => {
        findFilesResult["/workspace/copybooks"] = [
          vscode.Uri.file("/workspace/copybooks/COPYBOOK.cpy"),
        ];
        findFilesResult["/other/copybooks"] = [
          vscode.Uri.file("/other/copybooks/COPYBOOK.cpy"),
          vscode.Uri.file("/other/copybooks/OTHER.cpy"),
        ];
        getWorkspaceFolderResult.uri = vscode.Uri.file("/workspace");
      });

      it("resolves copybook uri in all workspace folders", async () => {
        const lib = new LocalPathLib("copybooks");
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.listCopybooks(document, DEFAULT_DIALECT);
        expect(result).toEqual(["COPYBOOK", "COPYBOOK", "OTHER"]); // duplicate COPYBOOK here is ok, it's deduplicated later in the Completion Provider

        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/workspace/copybooks"),
          pattern: "*",
        });
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/other/copybooks"),
          pattern: "*",
        });
      });
    });

    describe("Path variables are evaluated during resolution", () => {
      findFilesResult["/workspace/ABCPROG/copybooks"] = [
        vscode.Uri.file("/workspace/ABCPROG/copybooks/ABCCOPY.cpy"),
      ];
      it("replace variable a value", async () => {
        const lib = new LocalPathLib("${fileBasenameNoExtension}/copybooks");
        const document = vscode.Uri.file("/ABCPROG.cbl");
        const result = await lib.listCopybooks(document, DEFAULT_DIALECT);
        expect(result).toEqual(["ABCCOPY"]);
      });
    });

    describe("Glob patterns can be used as local path", () => {
      it("Glob patter is used to search local folders", async () => {
        const lib = new LocalPathLib("src/**/copybooks");
        const document = vscode.Uri.file("/ABCPROG.cbl");
        await lib.listCopybooks(document, DEFAULT_DIALECT);
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/workspace/src"),
          pattern: "**/copybooks/*",
        });
        expect(vscode.workspace.findFiles).toHaveBeenCalledWith({
          baseUri: vscode.Uri.file("/other/src"),
          pattern: "**/copybooks/*",
        });
      });
    });
  });
});
