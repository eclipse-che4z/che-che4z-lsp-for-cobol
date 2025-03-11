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
        if (pattern instanceof Object && "base" in pattern) {
          const files = folderContent[pattern.base] ?? [];
          return Promise.resolve(files.map(vscode.Uri.file));
        }
        return Promise.resolve([]);
      });
  });
  afterEach(() => {
    jest.restoreAllMocks();
  });

  describe("returns array of names of resources stored in local directory", () => {
    beforeAll(() => {
      folderContent = {
        "file:///test/path": [
          "/test/path/COPYBOOK.CPY",
          "/test/path/subfolder/SUBCOPY.CPY",
        ],
        "file:///different/path": ["/different/path/COPYBK2"],
      };
    });

    it("return resources", async () => {
      const service = new LocalFilesystemResourceService();
      const results = await service.listDirectory(Uri.file("/test/path"), [
        ".CPY",
        "",
      ]);

      expect(results).toEqual(expect.arrayContaining(["COPYBOOK", "SUBCOPY"]));
    });
  });

  describe("files are filtered by extensions", () => {
    beforeAll(() => {
      folderContent = {
        "file:///test/path": [
          "/test/path/COPYBOOK.CPY",
          "/test/path/subfolder/SUBCOPY.CPY",
          "/test/path/UNWANTED.json",
        ],
        "file:///different/path": ["/different/path/COPYBK2"],
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
        "file:///test/path": ["/test/path/COPYBOOK.CPY"],
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
      dispose: jest.fn(),
    } as unknown as vscode.FileSystemWatcher;
    beforeAll(() => {
      folderContent = {
        "file:///test/path": ["/test/path/COPYBOOK.CPY"],
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

      folderContent["file:///test/path"].push("/test/path/NEWCOPY.CPY");
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
