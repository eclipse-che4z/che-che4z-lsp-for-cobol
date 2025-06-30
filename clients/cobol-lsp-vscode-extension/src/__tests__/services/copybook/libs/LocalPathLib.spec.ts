import LocalPathLib, {
  localCopybooks,
} from "../../../../services/copybookLibs/LocalPathLib";
import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import {
  findFilesResult,
  getConfigurationResult,
} from "../../../../__mocks__/vscode";
import { DEFAULT_DIALECT } from "../../../../constants";

describe("Local copybook library", () => {
  beforeEach(async () => {
    await initializeExternalAPIs(
      vscode.Uri.file("/storage"),
      vscode.window.createOutputChannel("test"),
    );
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

    describe("Path variables are evaluated during resolution", () => {
      findFilesResult["/workspace/copybooks"] = [
        vscode.Uri.file("/workspace/ABCPROG/copybooks/ABCCOPY.cpy"),
      ];
      it("replace variable a value", async () => {
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
