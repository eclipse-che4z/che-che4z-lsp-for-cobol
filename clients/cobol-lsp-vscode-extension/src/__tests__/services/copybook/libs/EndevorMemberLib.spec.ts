import { EndevorMemberLib } from "../../../../services/copybookLibs/EndevorMemberLib";
import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import * as E4ECopybookService from "../../../../services/copybook/E4ECopybookService";
import { E4E } from "../../../../type/e4eApi";

describe("Endevor Member Lib", () => {
  let e4eMock: E4E;
  const dataset = "ENDEVOR.DATASET.COPYBOOK";

  beforeEach(async () => {
    e4eMock = {
      isEndevorElement: jest.fn().mockResolvedValue(true),
      getProfileInfo: jest.fn().mockResolvedValue({
        profile: "profile",
        instance: "instance",
      }),
      listElements: jest.fn().mockResolvedValue([]),
      getElement: jest.fn(),
      listMembers: jest
        .fn()
        .mockResolvedValue(["COPYBOOK", "ANOTHER", "CaSeTeSt"]),
      getMember: jest.fn().mockResolvedValue([]),
      getConfiguration: jest.fn().mockResolvedValue({
        pgms: [{ pgroup: "pgroup" }],
        pgroups: [
          {
            name: "pgroup",
            libs: [{ dataset }],
          },
        ],
      }),
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
      const lib = new EndevorMemberLib({
        dataset,
        profile: "profile",
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri("COPYBOOK", document);
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
        ),
      );
    });

    it("reads profile configuration from opened document", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri("COPYBOOK", document);
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
        ),
      );
    });

    it("copybook resolution is case insensitive", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri("CASEtest", document);
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/CaSeTeSt",
        ),
      );
    });

    it("returns undefined if copybook is not present in the dataset", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri("NOTFOUND", document);
      expect(result).toBeUndefined();
    });

    describe("profile not configured", () => {
      beforeEach(() => {
        e4eMock.getProfileInfo = jest.fn().mockResolvedValue(undefined);
      });

      it("returns undefined if profile is not configured", async () => {
        const lib = new EndevorMemberLib({
          dataset,
          profile: "invalid",
        });
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri("COPYBOOK", document);
        expect(result).toBeUndefined();
      });
    });
  });

  describe("listCopybooks", () => {
    it("return list of members from endevor api", async () => {
      const lib = new EndevorMemberLib({ dataset });
      const document = vscode.Uri.file("/program.cbl");
      const copybooks = await lib.listCopybooks(document);
      expect(copybooks).toEqual(["COPYBOOK", "ANOTHER", "CaSeTeSt"]);
    });
  });
});
