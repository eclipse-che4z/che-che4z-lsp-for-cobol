import { readFileResult } from "../../../__mocks__/vscode";
import {
  readFileContent,
  resolveCopybookURI,
} from "../../../services/copybook/CopybookMessageHandler";
import * as vscode from "vscode";
import * as ProcessorGroups from "../../../services/ProcessorGroups";
import { MockLib } from "./libs/MockLib.utility";
import { DEFAULT_DIALECT } from "../../../constants";

export type Writable<T> = {
  -readonly [P in keyof T]: T[P];
};

describe("CopybookMessageHandler", () => {
  describe("readFileContent", () => {
    beforeEach(() => {
      readFileResult["/workspace/file"] = "CONTENT";
      readFileResult["/MY.DATASET/HELLO"] = "MAINFRAME-CONTENT";
      readFileResult["/workspace/edited"] = "ORIGINAL";
    });

    it("returns content of the local file", async () => {
      const uri = vscode.Uri.file("/workspace/file");
      const result = await readFileContent(uri.toString());
      expect(result).toEqual("CONTENT");
    });

    it("can read content files from mainframe using Zowe FS Provider", async () => {
      const uri = vscode.Uri.parse("zowe-ds:/MY.DATASET/HELLO");
      const result = await readFileContent(uri.toString());
      expect(result).toEqual("MAINFRAME-CONTENT");
    });

    it("returns text from editor, if file is opened in vscode", async () => {
      const uri = vscode.Uri.file("/workspace/edited");
      const result = await readFileContent(uri.toString());
      expect(result).toEqual("EDITED");
    });
  });

  describe("resolveCopybookURI", () => {
    const remoteCopybooks = {
      AAA: vscode.Uri.parse("zowe-ds:/zosmf/COBOL.COPYBOOK/AAA"),
      ABC: vscode.Uri.parse("zowe-ds:/zosmf/COBOL.COPYBOOK/ABC"),
      BBB: vscode.Uri.parse("zowe-ds:/zosmf/COBOL.COPYBOOK/BBB"),
      CCC: vscode.Uri.parse("zowe-ds:/zosmf/COBOL.COPYBOOK/CCC"),
    };
    const localCopybooks = {
      LOCAL: vscode.Uri.file("/copybooks/LOCAL.cpy"),
      AAA: vscode.Uri.file("/copybooks/AAA.cpy"),
    };

    beforeEach(() => {
      jest
        .spyOn(ProcessorGroups, "loadProcessorGroupCopybooksLibs")
        .mockResolvedValue([
          new MockLib(remoteCopybooks),
          new MockLib(localCopybooks),
        ]);
    });

    it("resolves copybook name to URI", async () => {
      const document = "/program.cob";
      const result = await resolveCopybookURI(document, "AAA", DEFAULT_DIALECT);
      expect(result).toEqual("zowe-ds:/zosmf/COBOL.COPYBOOK/AAA");
    });

    it("respects order of processor groups - first resolved result is returned", async () => {
      const document = "/program.cob";
      const resultAAA = await resolveCopybookURI(
        document,
        "AAA",
        DEFAULT_DIALECT,
      );
      expect(resultAAA).toEqual("zowe-ds:/zosmf/COBOL.COPYBOOK/AAA");
    });
  });
});
