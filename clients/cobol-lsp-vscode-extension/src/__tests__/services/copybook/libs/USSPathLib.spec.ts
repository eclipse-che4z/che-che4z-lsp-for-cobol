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
  readDirectoryResult,
} from "../../../../__mocks__/vscode";
import * as vscode from "vscode";
import {
  externalApis,
  initializeExternalAPIs,
} from "../../../../services/ExternalAPIsService";
import { Utils } from "../../../../services/util/Utils";
import { createZoweExplorerMock } from "../../../../__mocks__/getZoweExplorerMock.utility";
import { ProfileUtils } from "../../../../services/util/ProfileUtils";
import { UssPathLib } from "../../../../services/copybookLibs/UssPathLib";
import { DEFAULT_DIALECT } from "../../../../constants";
import * as DiagnosticsService from "../../../../services/DiagnosticsService";

describe("USS copybook lib", () => {
  let zoweExplorerApiMock: IApiRegisterClient;

  beforeEach(async () => {
    zoweExplorerApiMock = createZoweExplorerMock();
    jest
      .spyOn(Utils, "getZoweExplorerAPI")
      .mockResolvedValue({ api: zoweExplorerApiMock });
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
    jest
      .spyOn(ProfileUtils, "getAvailableProfiles")
      .mockReturnValue(["profile"]);
    getConfigurationResult["copybook-extensions"] = [".CPY", ".cpy", ""];
  });

  describe("resolveCopybookUri", () => {
    beforeEach(() => {
      readDirectoryResult["/profile/remote/uss/copybooks"] = [
        ["COPYBOOK.CPY", vscode.FileType.File],
        ["CaSEsEnSiTiVe.CpY", vscode.FileType.File],
        ["BADEXT.txt", vscode.FileType.File],
        ["directory", vscode.FileType.Directory],
      ];
      readDirectoryResult["/profile/remote/uss/ABCPROG/copybooks"] = [
        ["COPYBOOK.CPY", vscode.FileType.File],
      ];
      readDirectoryResult["/profile/remote/uss/not-exists"] =
        new FileNotFound();
    });

    describe("copybook exists in uss location", () => {
      it("copybook uri is resolved", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.parse(
            "zowe-uss:/profile/remote/uss/copybooks/COPYBOOK.CPY",
          ),
        );
      });

      it("resolving is case insensitive", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "cAseSensitive",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.parse(
            "zowe-uss:/profile/remote/uss/copybooks/CaSEsEnSiTiVe.CpY",
          ),
        );
      });
    });

    describe("Path variables are evaluated during resolution", () => {
      it("replace variable a value", async () => {
        const lib = new UssPathLib(
          "/remote/uss/${fileBasenameNoExtension}/copybooks",
          "profile",
        );
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/ABCPROG.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(
          vscode.Uri.parse(
            "zowe-uss:/profile/remote/uss/ABCPROG/copybooks/COPYBOOK.CPY",
          ),
        );
      });
    });

    describe("copybook not present in the uss directory", () => {
      it("resolves to undefined", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "NONEXIST",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("copybook can be to file, not directory", () => {
      it("resolves to undefined", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "directory",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("file extension has to match configuration", () => {
      it("resolves to undefined", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "BADEXT",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("uss directory doesn't exists", () => {
      it("throws File Not Found error", async () => {
        const lib = new UssPathLib("/remote/uss/not-exists", "profile");
        await expect(
          lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          ),
        ).rejects.toEqual(new FileNotFound());
      });
    });

    describe("invalid configuration check", () => {
      it("resolves to undefined if configuration check fails - i.e. profile is not configured", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "invalid-profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("ZE not installed", () => {
      let showDiagnosticsSpy: jest.SpyInstance;
      let clearDiagnosticsSpy: jest.SpyInstance;

      beforeEach(async () => {
        jest.spyOn(Utils, "getZoweExplorerAPI").mockResolvedValue(undefined);
        await initializeExternalAPIs(vscode.Uri.file("/storage"));
        showDiagnosticsSpy = jest.spyOn(DiagnosticsService, "showDiagnostics");
        clearDiagnosticsSpy = jest.spyOn(
          DiagnosticsService,
          "clearDiagnostics",
        );
      });

      it("resolves to undefined if configuration check fails - ZE not installed", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
        expect(showDiagnosticsSpy).toHaveBeenCalledWith(
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
        externalApis.explorerAppeared(zoweExplorerApiMock);
        const resultAfter = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(clearDiagnosticsSpy).toHaveBeenCalled();
        expect(resultAfter).toEqual(
          vscode.Uri.parse(
            "zowe-uss:/profile/remote/uss/copybooks/COPYBOOK.CPY",
          ),
        );
      });
    });
  });

  describe("listCopybooks", () => {
    beforeEach(() => {
      readDirectoryResult["/profile/remote/uss/copybooks"] = [
        ["COPYBOOK.CPY", vscode.FileType.File],
        ["CaSEsEnSiTiVe.CpY", vscode.FileType.File],
        ["directory", vscode.FileType.Directory],
      ];
      readDirectoryResult["/profile/remote/uss/not-exists"] =
        new FileNotFound();
    });

    describe("list copybook from dataset", () => {
      it("returns array of names of copybooks present in the dataset", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "profile");
        const result = await lib.listCopybooks(
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual(["COPYBOOK", "CaSEsEnSiTiVe"]);
      });
    });

    describe("dataset doesn't exists", () => {
      it("throws File Not Found error", async () => {
        const lib = new UssPathLib("/remote/uss/not-exists", "profile");
        await expect(
          lib.resolveCopybookUri(
            "COPYBOOK",
            vscode.Uri.file("/program.cbl"),
            DEFAULT_DIALECT,
          ),
        ).rejects.toEqual(new FileNotFound());
      });
    });

    describe("invalid configuration check", () => {
      it("resolves to empty array if configuration check fails - i.e. profile is not configured", async () => {
        const lib = new UssPathLib("/remote/uss/copybooks", "invalid-profile");
        const result = await lib.listCopybooks(
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(result).toEqual([]);
      });
    });
  });
});
