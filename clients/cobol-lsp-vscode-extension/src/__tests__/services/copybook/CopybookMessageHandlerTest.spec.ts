import { readFileResult } from "../../../__mocks__/vscode";
import {
  readFileContent,
  resolveCopybookURI,
} from "../../../services/copybook/CopybookMessageHandler";
import * as vscode from "vscode";
import * as ProcessorGroups from "../../../services/ProcessorGroups";
import { DEFAULT_DIALECT } from "../../../constants";
import CopybookLib from "../../../services/copybookLibs/CopybookLib";
import { outputChannel } from "../../../services/util/OutputChannel";

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

    it("returns undefined for nonexisting files", async () => {
      const uri = vscode.Uri.file("/workspace/nonexisting");
      const result = await readFileContent(uri.toString());
      expect(result).toBeUndefined();
      expect(outputChannel.error).toHaveBeenCalledWith(
        expect.stringContaining("file/content message handler error"),
      );
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
    const downloadSpyA = jest
      .fn()
      .mockResolvedValue(vscode.Uri.file("/endevor/cache/A/EEE"));
    const endevorCopybooksA = {
      EEE: downloadSpyA,
    };

    const downloadSpyB = jest
      .fn()
      .mockResolvedValue(vscode.Uri.file("/endevor/cache/B/EEE"));
    const endevorCopybooksB = {
      EEE: downloadSpyB,
    };

    describe("resolving copybook name to URI", () => {
      beforeEach(() => {
        jest
          .spyOn(ProcessorGroups, "loadProcessorGroupCopybooksLibs")
          .mockResolvedValue([
            new MockLib(remoteCopybooks),
            new MockLib(localCopybooks),
            new MockLib(endevorCopybooksA),
            new MockLib(endevorCopybooksB),
          ]);
      });

      it("respects order of processor groups - first resolved result is returned", async () => {
        const document = "/program.cob";
        const result = await resolveCopybookURI(
          document,
          "AAA",
          DEFAULT_DIALECT,
        );
        expect(result).toEqual("zowe-ds:/zosmf/COBOL.COPYBOOK/AAA");
      });

      it("copybook might be resoled into a function that downloads copybook to local cache", async () => {
        const document = "/program.cob";
        const result = await resolveCopybookURI(
          document,
          "EEE",
          DEFAULT_DIALECT,
        );
        expect(result).toEqual("file:///endevor/cache/A/EEE");

        // only the first resolved copybook is downloaded
        expect(downloadSpyA).toHaveBeenCalledTimes(1);
        expect(downloadSpyB).not.toHaveBeenCalled();
      });
    });

    describe("error handling", () => {
      beforeEach(() => {
        jest
          .spyOn(ProcessorGroups, "loadProcessorGroupCopybooksLibs")
          .mockResolvedValue([new ErrorLib(), new MockLib(remoteCopybooks)]);
      });
      it("resolves copybook from other libraries even if one library errors", async () => {
        const document = "/program.cob";
        const resultAAA = await resolveCopybookURI(
          document,
          "AAA",
          DEFAULT_DIALECT,
        );
        expect(resultAAA).toEqual("zowe-ds:/zosmf/COBOL.COPYBOOK/AAA");
      });

      it("returns undefined if copybook is not resolved", async () => {
        const document = "/program.cob";
        const resultAAA = await resolveCopybookURI(
          document,
          "NotFound",
          DEFAULT_DIALECT,
        );
        expect(resultAAA).toBeUndefined();
      });
    });
  });
});

export class MockLib implements CopybookLib {
  constructor(
    private directory: {
      [key: string]: vscode.Uri | (() => Promise<vscode.Uri>);
    },
  ) {}

  resolveCopybookUri(
    copybookName: string,
    _documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<vscode.Uri | (() => Promise<vscode.Uri | undefined>) | undefined> {
    return Promise.resolve(this.directory[copybookName]);
  }

  listCopybooks(
    _documentUri: vscode.Uri,
    _dialect: string,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    return Promise.resolve(Object.keys(this.directory));
  }
}

export class ErrorLib implements CopybookLib {
  resolveCopybookUri(
    _copybookName: string,
    _documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<vscode.Uri | (() => Promise<vscode.Uri | undefined>) | undefined> {
    return Promise.reject(new Error("Resolve error"));
  }
  listCopybooks(
    _documentUri: vscode.Uri,
    _dialect: string,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    return Promise.reject(new Error("List error"));
  }
}
