import {
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
import { createZoweExplorerMock } from "../../../../__mocks__/getZoweExplorerMock.utility";
import { ProfileUtils } from "../../../../services/util/ProfileUtils";
import { ZoweExplorerDownloader } from "../../../../services/copybook/downloader/ZoweExplorerDownloader";

describe("Dataset copybook lib", () => {
  let zoweExplorerApiMock: IApiRegisterClient;

  beforeEach(async () => {
    zoweExplorerApiMock = createZoweExplorerMock();
    Utils.getZoweExplorerAPI = jest
      .fn()
      .mockResolvedValue({ api: zoweExplorerApiMock });
    await initializeExternalAPIs(
      vscode.Uri.file("/storage"),
      vscode.window.createOutputChannel("test"),
    );
    jest
      .spyOn(ProfileUtils, "getAvailableProfiles")
      .mockReturnValue(["profile"]);
  });

  describe("resolveCopybookUri", () => {
    beforeEach(() => {
      readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"] = ["COPYBOOK"];
      readDirectoryResult["/profile/DOESNT.EXIST.DATASET"] = new FileNotFound();
    });

    describe("copybook exists in dataset", () => {
      it("copybook uri is resolved", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
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
        );
        expect(result).toBeUndefined();
      });
    });

    describe("dataset doesnt exists", () => {
      it("throws File not found error", async () => {
        const lib = new DatasetLib("DOESNT.EXIST.DATASET", "profile");
        await expect(
          lib.resolveCopybookUri("COPYBOOK", vscode.Uri.file("/program.cbl")),
        ).rejects.toEqual(new FileNotFound());
      });
    });

    describe("invalid configuration check", () => {
      it("resolves to undefined if configuration check fails - i.e. profile is not configured", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "invalid-profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
        );
        expect(result).toBeUndefined();
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
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "profile");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
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
          await expect(
            lib.resolveCopybookUri("COPYBOOK", vscode.Uri.file("/program.cbl")),
          ).rejects.toEqual(new FileNotFound());
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
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
        );
        expect(result).toBeUndefined();
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(3);

        // after reenabling the lib, the requests are sent again.
        externalApis.dsnService?.reenableFailedRequests();

        await expect(
          lib.resolveCopybookUri("COPYBOOK", vscode.Uri.file("/program.cbl")),
        ).rejects.toEqual(new FileNotFound());

        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(4);
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
        const result = await lib.listCopybooks(vscode.Uri.file("/program.cbl"));
        expect(result).toEqual(
          readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"],
        );
      });
    });

    describe("dataset doesn't exists", () => {
      it("throws File not found error", async () => {
        const lib = new DatasetLib("DOESNT.EXIST.DATASET", "profile");
        await expect(
          lib.resolveCopybookUri("COPYBOOK", vscode.Uri.file("/program.cbl")),
        ).rejects.toEqual(new FileNotFound());
      });
    });

    describe("invalid configuration check", () => {
      it("resolves to empty array if configuration check fails - i.e. profile is not configured", async () => {
        const lib = new DatasetLib("DATASET.WITH.COPYBOOK", "invalid-profile");
        const result = await lib.listCopybooks(vscode.Uri.file("/program.cbl"));
        expect(result).toEqual([]);
      });
    });
  });
});
