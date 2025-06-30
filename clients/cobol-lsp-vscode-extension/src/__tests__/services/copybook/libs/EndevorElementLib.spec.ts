import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import * as E4ECopybookService from "../../../../services/copybook/E4ECopybookService";
import { E4E } from "../../../../type/e4eApi";
import { EndevorElementLib } from "../../../../services/copybookLibs/EndevorElementLib";
import { DEFAULT_DIALECT } from "../../../../constants";

describe("Endevor Element Lib", () => {
  let e4eMock: E4E;

  beforeEach(async () => {
    e4eMock = {
      isEndevorElement: jest.fn().mockResolvedValue(true),
      getProfileInfo: jest.fn().mockResolvedValue({
        profile: "profile",
        instance: "instance",
      }),
      listElements: jest.fn().mockResolvedValue([
        ["COPYBOOK", "12345"],
        ["ANOTHER", "98765"],
        ["CaSeTeSt", "98765"],
      ]),
      getElement: jest.fn().mockResolvedValue(["Content", "12345"]),
      listMembers: jest.fn().mockResolvedValue([]),
      getMember: jest.fn(),
      getConfiguration: jest.fn(),
      onDidChangeElement: jest.fn(),
    };

    jest
      .spyOn(E4ECopybookService, "getE4EAPI")
      .mockResolvedValue({ api: e4eMock });
    await initializeExternalAPIs(
      vscode.Uri.file("/storage"),
      vscode.window.createOutputChannel("test"),
    );
  });

  describe("resolveCopybookUri", () => {
    it("resolves copybook into function that can be used to download copybook to local cache", async () => {
      const lib = new EndevorElementLib({
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "COPYBOOK",
        document,
        DEFAULT_DIALECT,
      );
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/COPYBOOK",
        ),
      );
    });

    it("copybook resolution is case insensitive", async () => {
      const lib = new EndevorElementLib({
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "CASEtest",
        document,
        DEFAULT_DIALECT,
      );
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/CaSeTeSt",
        ),
      );
    });

    it("returns undefined if copybook is not present in the dataset", async () => {
      const lib = new EndevorElementLib({
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "NOTFOUND",
        document,
        DEFAULT_DIALECT,
      );
      expect(result).toBeUndefined();
    });

    describe("profile not configured", () => {
      beforeEach(() => {
        e4eMock.getProfileInfo = jest.fn().mockResolvedValue(undefined);
      });

      it("returns undefined if profile is not configured", async () => {
        const lib = new EndevorElementLib({
          use_map: false,
          environment: "environment",
          stage: "stage",
          system: "system",
          subsystem: "subsystem",
          type: "type",
          profile: "invalid",
        });
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });
  });

  describe("listCopybooks", () => {
    it("return list of members from endevor api", async () => {
      const lib = new EndevorElementLib({
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
      });
      const document = vscode.Uri.file("/program.cbl");
      const copybooks = await lib.listCopybooks(document, DEFAULT_DIALECT);
      expect(copybooks).toEqual(["COPYBOOK", "ANOTHER", "CaSeTeSt"]);
    });
  });
});
