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
  diagnosticsCollectionMock,
  FileNotFound,
  readDirectoryResult,
} from "../../../../__mocks__/vscode";
import { DatasetLib } from "../../../../services/copybookLibs/DatasetLib";
import * as vscode from "vscode";
import {
  externalApis,
  initializeExternalAPIs,
} from "../../../../services/ExternalAPIsService";
import { Utils } from "../../../../services/util/Utils";
import { ZoweExplorerDownloader } from "../../../../services/copybook/downloader/ZoweExplorerDownloader";
import { DEFAULT_DIALECT } from "../../../../constants";

describe("Dataset copybook lib", () => {
  beforeEach(async () => {
    jest
      .spyOn(Utils, "getZoweExplorerAPI")
      .mockResolvedValue({ api: {} as IApiRegisterClient });
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
  });

  describe("resolveCopybookUri", () => {
    beforeEach(() => {
      readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"] = ["COPYBOOK"];
      readDirectoryResult["/profile/DATASET.WITH@#$.COPYBOOK"] = ["COPYBOOK"];
      readDirectoryResult["/profile/DOESNT.EXIST.DATASET"] = new FileNotFound();
    });

    describe("copybook exists in dataset", () => {
      it("copybook uri is resolved", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.parse(
            "zowe-ds:/profile/DATASET.WITH.COPYBOOK/COPYBOOK.cpy",
          ),
        );
      });
    });

    describe("copybook not present in the dataset", () => {
      it("resolves to undefined", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
        const result = await lib.resolveCopybookUri(
          "NONEXIST",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("dataset doesnt exists", () => {
      it("resolves to undefined", async () => {
        const lib = new DatasetLib("DOESNT.EXIST.DATASET", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("invalid configuration check", () => {
      describe("Profile not configured", () => {
        let statSpy: jest.SpyInstance;

        beforeEach(() => {
          ZoweExplorerDownloader.profileStore.clear();
          jest.clearAllMocks();
          statSpy = jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockRejectedValue(
              new Error(
                "Zowe Explorer Profiles Cache error: Could not find profile named: invalid-profile.",
              ),
            );
        });

        afterEach(() => {
          statSpy.mockRestore();
        });

        it("resolves to undefined if configuration check fails - profile is not configured", async () => {
          const lib = new DatasetLib(
            "DATASET.WITH.COPYBOOK",
            "invalid-profile",
          );
          const result = await lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          );
          expect(result).toBeUndefined();
          expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
            "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe. Provided invalid profile name: invalid-profile",
            "Unblock and retry",
          );
        });
      });

      describe("ZE not installed", () => {
        beforeEach(async () => {
          jest.spyOn(Utils, "getZoweExplorerAPI").mockResolvedValue(undefined);
          await initializeExternalAPIs(vscode.Uri.file("/storage"));
        });

        it("resolves to undefined if configuration check fails - ZE not installed", async () => {
          const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
          const result = await lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          );
          expect(result).toBeUndefined();
          expect(diagnosticsCollectionMock.set).toHaveBeenCalledWith(
            expect.objectContaining({ path: "/program.cbl" }),
            [
              {
                message: "Zowe Explorer is not installed",
                range: {
                  end: { character: 0, line: 1 },
                  start: { character: 0, line: 0 },
                },
                severity: 1,
              },
            ],
          );

          // diagnostics disappear after ZE installation and copybook can be resolved
          externalApis.explorerAppeared({} as IApiRegisterClient);
          const resultAfter = await lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          );
          expect(diagnosticsCollectionMock.clear).toHaveBeenCalled();
          expect(resultAfter).toEqual(
            vscode.Uri.parse(
              "zowe-ds:/profile/DATASET.WITH.COPYBOOK/COPYBOOK.cpy",
            ),
          );
        });
      });
    });

    describe("unauthorized error from ZE", () => {
      let statSpy: jest.SpyInstance;

      beforeEach(() => {
        ZoweExplorerDownloader.profileStore.clear();
        jest.clearAllMocks();
        statSpy = jest
          .spyOn(vscode.workspace.fs, "stat")
          .mockRejectedValue(
            new Error(
              "Rest API failure with HTTP(S) status 401\nThis operation requires authentication.",
            ),
          );
      });

      afterEach(() => {
        statSpy.mockRestore();
      });

      it("resolves to undefined if invalid credentials are used", async () => {
        const lib = new DatasetLib(
          "DATASET.WITH.COPYBOOK",
          "invalid-credentials",
        );
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
        expect(statSpy).toHaveBeenCalledTimes(2); // credentials check and retry
        expect(vscode.workspace.fs.readDirectory).not.toHaveBeenCalled();
      });
    });

    describe("error limiting", () => {
      it("library is disabled from resolving after 3 failed requests", async () => {
        const lib = new DatasetLib("DOESNT.EXIST.DATASET", "profile");

        for (let attempts = 0; attempts < 3; attempts++) {
          const result = await lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          );
          expect(result).toBeUndefined();
        }
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(3);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          expect.stringContaining(
            `Request to list dataset members profile/DOESNT.EXIST.DATASET keeps failing repeatedly.`,
          ),
          "Keep disabled",
          "Reenable",
        );

        // next request do not call Zowe any more
        let result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(3);

        // after reenabling the lib, the requests are sent again.
        externalApis.dsnService?.reenableFailedRequests();

        result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();

        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(4);
      });
    });

    describe("@#$ in names", () => {
      it("copybook uri is resolved", async () => {
        const lib = new DatasetLib("DATASET.WITH@#$.COPYBOOK", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.parse(
            "zowe-ds:/profile/DATASET.WITH@%23$.COPYBOOK/COPYBOOK.cpy",
          ),
        );
      });
    });
  });

  describe("listCopybooks", () => {
    beforeEach(() => {
      ZoweExplorerDownloader.profileStore.clear();
      readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"] = [
        "COPYA",
        "COPYB",
        "COPYC",
      ];
      readDirectoryResult["DOESNT.EXIST.DATASET"] = new FileNotFound();
    });

    describe("list copybook from dataset", () => {
      it("returns array of names of copybooks present in the dataset", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
        const result = await lib.listCopybooks(
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"],
        );
      });
    });

    describe("dataset doesn't exists", () => {
      it("throws File not found error", async () => {
        const lib = new DatasetLib("DOESNT.EXIST.DATASET", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("invalid configuration check", () => {
      it("resolves to empty array if configuration check fails - i.e. profile is not configured", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "invalid-profile");
        const result = await lib.listCopybooks(
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual([]);
      });
    });
  });
});
