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

import { Uri } from "vscode";
import { LocalFilesystemResourceService } from "../../services/LocalFilesystemResourceService";
import * as vscode from "vscode";

describe("LocalFilesystemResourceService test", () => {
  let folderContent: Record<string, string[]> = {};
  let findFilesSpy: jest.SpyInstance;

  beforeEach(() => {
    findFilesSpy = jest
      .spyOn(vscode.workspace, "findFiles")
      .mockImplementation((pattern: vscode.GlobPattern) => {
        if (pattern instanceof Object && "baseUri" in pattern) {
          const files = folderContent[pattern.baseUri.path] ?? [];
          return Promise.resolve(files.map(vscode.Uri.file));
        }
        return Promise.resolve([]);
      });
  });
  afterEach(() => {
    jest.restoreAllMocks();
  });

  describe("listDirectory", () => {
    describe("returns array of names of resources stored in local directory", () => {
      beforeAll(() => {
        folderContent = {
          "/test/path": [
            "/test/path/COPYBOOK.CPY",
            "/test/path/subfolder/SUBCOPY.CPY",
          ],
          "/different/path": ["/different/path/COPYBK2"],
        };
      });

      it("return resources", async () => {
        const service = new LocalFilesystemResourceService();
        const results = await service.listDirectory(Uri.file("/test/path"), [
          ".CPY",
          "",
        ]);

        expect(results).toEqual([
          {
            filename: "COPYBOOK",
            uri: vscode.Uri.file("/test/path/COPYBOOK.CPY"),
          },
          {
            filename: "SUBCOPY",
            uri: vscode.Uri.file("/test/path/subfolder/SUBCOPY.CPY"),
          },
        ]);
      });
    });

    describe("files are filtered by extensions", () => {
      beforeAll(() => {
        folderContent = {
          "/test/path": [
            "/test/path/COPYBOOK.CPY",
            "/test/path/subfolder/SUBCOPY.CPY",
            "/test/path/UNWANTED.json",
          ],
          "/different/path": ["/different/path/COPYBK2"],
        };
      });

      it("doesn't return resources with wrong extension", async () => {
        const service = new LocalFilesystemResourceService();
        const results = await service.listDirectory(Uri.file("/test/path"), [
          ".CPY",
          "",
        ]);

        expect(results).toEqual(expect.not.arrayContaining(["UNWANTED"]));
      });
    });

    describe("content of the resource directory is cached", () => {
      beforeAll(() => {
        folderContent = {
          "/test/path": ["/test/path/COPYBOOK.CPY"],
        };
      });

      it("calls findFiles just once for same path", async () => {
        const service = new LocalFilesystemResourceService();

        const resultsFirstCall = await service.listDirectory(
          Uri.file("/test/path"),
          [".CPY", ""],
        );

        expect(findFilesSpy).toHaveBeenCalledTimes(1);

        const resultsSecondCall = await service.listDirectory(
          Uri.file("/test/path"),
          [".CPY", ""],
        );

        expect(findFilesSpy).toHaveBeenCalledTimes(1);
        expect(resultsFirstCall).toEqual(resultsSecondCall);
      });
    });

    describe("when content of the directory changes, cache is invalidated", () => {
      let onCreateCallback: () => void;
      const fileWatcherMock = {
        onDidCreate: (callback: () => void) => {
          onCreateCallback = callback;
        },
        onDidDelete: jest.fn(),
        onDidChange: jest.fn(),
        dispose: jest.fn(),
      } as unknown as vscode.FileSystemWatcher;
      beforeAll(() => {
        folderContent = {
          "/test/path": ["/test/path/COPYBOOK.CPY"],
        };

        jest
          .spyOn(vscode.workspace, "createFileSystemWatcher")
          .mockReturnValue(fileWatcherMock);
      });

      it("calls findFiles again after the directory content changed", async () => {
        const service = new LocalFilesystemResourceService();

        const resultsFirstCall = await service.listDirectory(
          Uri.file("/test/path"),
          [".CPY", ""],
        );
        expect(findFilesSpy).toHaveBeenCalledTimes(1);

        folderContent["/test/path"].push("/test/path/NEWCOPY.CPY");
        onCreateCallback();

        const resultsSecondCall = await service.listDirectory(
          Uri.file("/test/path"),
          [".CPY", ""],
        );

        expect(findFilesSpy).toHaveBeenCalledTimes(2);
        expect(resultsFirstCall).not.toEqual(resultsSecondCall);
      });
    });
  });

  describe("searchDirectory", () => {
    beforeAll(() => {
      folderContent = {
        "/test/path": [
          "/test/path/COPYBOOK.CPY",
          "/test/path/subfolder/SUBCOPY.CPY",
          "/test/path/NOEXT",
        ],
        "/different/path": ["/different/path/COPYBK2"],
      };
    });

    it("calls findFile with correct search pattern", async () => {
      const testUri = Uri.file("/test/path");
      const service = new LocalFilesystemResourceService();
      const result = await service.searchDirectory(testUri, "COPYBOOK", [
        ".CPY",
        ".cpy",
        ".CPB",
        ".cpb",
      ]);

      expect(result).toEqual(Uri.file("/test/path/COPYBOOK.CPY"));

      expect(findFilesSpy).toHaveBeenCalledWith({
        baseUri: Uri.from(testUri),
        pattern: "*",
      });
    });

    it("extensions don't need to start with .", async () => {
      const testUri = Uri.file("/test/path");
      const service = new LocalFilesystemResourceService();
      const result = await service.searchDirectory(testUri, "COPYBOOK", [
        "CPY",
        ".cpy",
        "CPB",
        ".cpb",
      ]);

      expect(result).toEqual(Uri.file("/test/path/COPYBOOK.CPY"));

      expect(findFilesSpy).toHaveBeenCalledWith({
        baseUri: Uri.from(testUri),
        pattern: "*",
      });
    });

    it("searches files with empty extension", async () => {
      const testUri = Uri.file("/test/path");
      const service = new LocalFilesystemResourceService();

      const result = await service.searchDirectory(testUri, "COPYBOOK", [
        ".CPY",
        ".cpy",
        "",
      ]);

      expect(result).toEqual(Uri.file("/test/path/COPYBOOK.CPY"));

      expect(findFilesSpy).toHaveBeenCalledWith({
        baseUri: Uri.from(testUri),
        pattern: "*",
      });
    });

    it("searches files with no extensions", async () => {
      const testUri = Uri.file("/test/path");
      const service = new LocalFilesystemResourceService();
      const result = await service.searchDirectory(testUri, "NOEXT", [""]);

      expect(result).toEqual(Uri.file("/test/path/NOEXT"));

      expect(findFilesSpy).toHaveBeenCalledWith({
        baseUri: Uri.from(testUri),
        pattern: "*",
      });
    });
  });
});
