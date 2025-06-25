import {
  FileNotFound,
  readDirectoryResult,
} from "../../../../__mocks__/vscode";
import { DatasetLib } from "../../../../services/copybookLibs/DatasetLib";
import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import { Utils } from "../../../../services/util/Utils";
import { createZoweExplorerMock } from "../../../../__mocks__/getZoweExplorerMock.utility";
import { ProfileUtils } from "../../../../services/util/ProfileUtils";

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
  });

  describe("listCopybooks", () => {
    beforeEach(() => {
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
