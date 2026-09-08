import * as vscode from "vscode";
import { TarCopybookLib } from "../../../../services/copybookLibs/TarCopybookLib";
import {
  ExternalAPIsService,
  initializeExternalAPIs,
} from "../../../../services/ExternalAPIsService";
import { DEFAULT_DIALECT } from "../../../../constants";
import {
  createZoweExplorerMock,
  getContentMock,
} from "../../../../__mocks__/getZoweExplorerMock.utility";
import { SettingsService } from "../../../../services/Settings";
import { getTarCached, TarContent } from "../../../../services/util/TarUtil";
import { CopybookBinaryDownloader } from "../../../../services/copybook/downloader/CopybookBinaryDownloader";

const emitter_mock: vscode.EventEmitter<vscode.FileChangeEvent[]> = {
  dispose: jest.fn().mockResolvedValue({}),
  event: jest.fn().mockResolvedValue({}),
  fire: jest.fn().mockResolvedValue({}),
};
const tarCache = getTarCached(emitter_mock);
const fileContent: TarContent = {
  fileName: "/APPLDICT/EMPRPT/RECORD/DEPARTMENT.CPY",
  fileData: {
    fileContent: ["content"],
    fileMetadata: {
      ctime: 0,
      mtime: 0,
      size: 0,
      type: vscode.FileType.File,
    },
  },
};
const tarContent: TarContent[] = [fileContent];
tarCache.execute = jest.fn().mockResolvedValue(tarContent);

describe("Tar copybook lib tests", () => {
  let extApis: ExternalAPIsService;

  beforeEach(async () => {
    jest.clearAllMocks();
    extApis = await initializeExternalAPIs(
      vscode.Uri.file("/storage"),
      undefined,
      tarCache,
    );
  });

  describe("resolveCopybookUri", () => {
    SettingsService.getCopybookExtension = jest
      .fn()
      .mockReturnValue([".CPY", ".COPY"]);
    const dsnTarLib = new TarCopybookLib(
      "DSN",
      "path/for/tar",
      "APPLDICT/EMPRPT/**",
      tarCache,
      "zeProfile",
    );
    it("copybook exists in tar", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      const result = await dsnTarLib.resolveCopybookUri(
        "DEPARTMENT",
        vscode.Uri.file("/program.cbl"),
        DEFAULT_DIALECT,
      );
      expect(result).toBeTruthy();
      const expectedValue = vscode.Uri.from({
        scheme: "cobol-ls-tar",
        authority: "",
        path: "/storage/tar/path/for/tar/::/APPLDICT/EMPRPT/RECORD/DEPARTMENT.CPY",
      });
      expect(result instanceof vscode.Uri).toBeTruthy();
      expect((result as vscode.Uri).fsPath).toBe(expectedValue.fsPath);
    });
    it("copybook not present in the tar", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      expect(
        await dsnTarLib.resolveCopybookUri(
          "DEPARTMENT1",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        ),
      ).toBeFalsy();
    });
    it("local tar doesnt exists", async () => {
      const localTarLib = new TarCopybookLib(
        "local",
        "path/for/tar",
        "APPLDICT/EMPRPT/**",
        getTarCached(emitter_mock),
        "zeProfile",
      );
      expect(
        await localTarLib.resolveCopybookUri(
          "DEPARTMENT",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        ),
      ).toBeFalsy();
    });

    it("remote tar doesnt exists", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );
      extApis.binaryDownloader.downloadFile = jest.fn();
      extApis.binaryDownloader.isPresentLocally = jest
        .fn()
        .mockReturnValue(false);
      const dsnTarLib = new TarCopybookLib(
        "DSN",
        "path/for/tar",
        "APPLDICT/EMPRPT/**",
        tarCache,
        "zeProfile",
      );
      await dsnTarLib.resolveCopybookUri(
        "DEPARTMENT",
        vscode.Uri.file("/program.cbl"),
        DEFAULT_DIALECT,
      );
      expect(extApis.binaryDownloader.downloadFile).toHaveBeenCalledWith(
        "path/for/tar",
        "zeProfile",
        "DSN",
      );
    });
    it("a tar location that attempts path traversal never downloads or writes outside storage", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );
      extApis.binaryDownloader.isPresentLocally = jest
        .fn()
        .mockReturnValue(false);
      const traversalTarLib = new TarCopybookLib(
        "DSN",
        "../../../../etc/passwd",
        "APPLDICT/EMPRPT/**",
        tarCache,
        "zeProfile",
      );

      const result = await traversalTarLib.resolveCopybookUri(
        "DEPARTMENT",
        vscode.Uri.file("/program.cbl"),
        DEFAULT_DIALECT,
      );

      expect(result).toBeFalsy();
      expect(getContentMock).not.toHaveBeenCalled();
      expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    });
    it("Default folder pattern", () => {
      expect(
        TarCopybookLib.create({
          locationType: "local",
          tarFileLocation: "path/for/tar",
        }),
      ).toHaveProperty("folderPattern", "**");
    });
    it("Search pattern with value", () => {
      expect(
        TarCopybookLib.create({
          locationType: "local",
          tarFileLocation: "path/for/tar",
          folderPattern: "searchingSomething",
        }),
      ).toHaveProperty("folderPattern", "searchingSomething");
    });
    it("variable provided in configuration resolves", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      const result = await new TarCopybookLib(
        "USS",
        "${fileBasenameNoExtension}/path/for/tar",
        "APPLDICT/EMPRPT/**",
        tarCache,
        "zeProfile",
      ).resolveCopybookUri(
        "DEPARTMENT",
        vscode.Uri.file("/program.cbl"),
        DEFAULT_DIALECT,
      );
      expect(result).toBeTruthy();
      const expectedValue = vscode.Uri.from({
        scheme: "cobol-ls-tar",
        authority: "",
        path: "/storage/tar/program/path/for/tar/::/APPLDICT/EMPRPT/RECORD/DEPARTMENT.CPY",
      });
      expect(result instanceof vscode.Uri).toBeTruthy();
      expect((result as vscode.Uri).fsPath).toBe(expectedValue.fsPath);
    });
  });

  describe("listCopybooks", () => {
    it("list copybook from tar", async () => {
      extApis.binaryDownloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );
      vscode.workspace.fs.readDirectory = jest.fn().mockResolvedValue([
        ["APPLDICT/EMPRPT/RECORD/DEPARTMENT.CPY", vscode.FileType.File],
        ["SOME/RANDOM/FILE.CPY", vscode.FileType.File],
      ]);
      const dsnTarLib = new TarCopybookLib(
        "DSN",
        "path/for/tar",
        "APPLDICT/EMPRPT/**",
        tarCache,
        "zeProfile",
      );
      const result = await dsnTarLib.listCopybooks(
        vscode.Uri.file("/program.cbl"),
        DEFAULT_DIALECT,
      );
      expect(result.length).toBe(1);
      expect(result.includes("DEPARTMENT")).toBeTruthy();
    });
    describe("tar doesn't exists", () => {});
  });
});
