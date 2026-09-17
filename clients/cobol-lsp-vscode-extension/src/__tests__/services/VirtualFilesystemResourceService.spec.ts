/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import { FileType, Uri } from "vscode";
import { readDirectoryResult } from "../../__mocks__/vscode";
import { VirtualFilesystemResourceService } from "../../services/VirtualFilesystemResourceService";
import * as vscode from "vscode";

describe("VirtualFilesystemResourceService test", () => {
  let readDirectorySpy: jest.SpyInstance;

  beforeEach(() => {
    Object.keys(readDirectoryResult).forEach(
      (key) => delete readDirectoryResult[key],
    );
    readDirectorySpy = jest.spyOn(vscode.workspace.fs, "readDirectory");
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  describe("listDirectory", () => {
    it("returns files from the provider directory", async () => {
      readDirectoryResult["/test/path"] = [
        ["COPYBOOK.CPY", FileType.File],
        ["subdir", FileType.Directory],
      ];

      const service = new VirtualFilesystemResourceService();
      const results = await service.listDirectory(
        Uri.parse("zowe-uss:/test/path"),
        [".CPY", ""],
      );

      expect(results).toEqual([
        {
          filename: "COPYBOOK",
          uri: Uri.parse("zowe-uss:/test/path/COPYBOOK.CPY"),
        },
      ]);
    });

    it("doesn't return resources with wrong extension", async () => {
      readDirectoryResult["/test/path"] = [
        ["COPYBOOK.CPY", FileType.File],
        ["UNWANTED.json", FileType.File],
      ];

      const service = new VirtualFilesystemResourceService();
      const results = await service.listDirectory(
        Uri.parse("zowe-uss:/test/path"),
        [".CPY", ""],
      );

      expect(results.map((r) => r.filename)).toEqual(["COPYBOOK"]);
    });

    it("calls readDirectory just once for the same path", async () => {
      readDirectoryResult["/test/path"] = [["COPYBOOK.CPY", FileType.File]];

      const service = new VirtualFilesystemResourceService();
      const localPath = Uri.parse("zowe-uss:/test/path");

      const resultsFirstCall = await service.listDirectory(localPath, [
        ".CPY",
        "",
      ]);
      expect(readDirectorySpy).toHaveBeenCalledTimes(1);

      const resultsSecondCall = await service.listDirectory(localPath, [
        ".CPY",
        "",
      ]);
      expect(readDirectorySpy).toHaveBeenCalledTimes(1);
      expect(resultsFirstCall).toEqual(resultsSecondCall);
    });

    it("calls readDirectory again after the directory content changed", async () => {
      let onCreateCallback: () => void = () => undefined;
      const fileWatcherMock = {
        onDidCreate: (callback: () => void) => {
          onCreateCallback = callback;
        },
        onDidDelete: jest.fn(),
        dispose: jest.fn(),
      } as unknown as vscode.FileSystemWatcher;
      jest
        .spyOn(vscode.workspace, "createFileSystemWatcher")
        .mockReturnValue(fileWatcherMock);

      readDirectoryResult["/test/path"] = [["COPYBOOK.CPY", FileType.File]];

      const service = new VirtualFilesystemResourceService();
      const localPath = Uri.parse("zowe-uss:/test/path");

      const resultsFirstCall = await service.listDirectory(localPath, [
        ".CPY",
        "",
      ]);
      expect(readDirectorySpy).toHaveBeenCalledTimes(1);

      readDirectoryResult["/test/path"] = [
        ["COPYBOOK.CPY", FileType.File],
        ["NEWCOPY.CPY", FileType.File],
      ];
      onCreateCallback();

      const resultsSecondCall = await service.listDirectory(localPath, [
        ".CPY",
        "",
      ]);

      expect(readDirectorySpy).toHaveBeenCalledTimes(2);
      expect(resultsFirstCall).not.toEqual(resultsSecondCall);
    });
  });

  describe("searchDirectory", () => {
    it("finds a file matching the requested name, case-insensitively", async () => {
      readDirectoryResult["/test/path"] = [
        ["COPYBOOK.CPY", FileType.File],
        ["NOEXT", FileType.File],
      ];

      const service = new VirtualFilesystemResourceService();
      const result = await service.searchDirectory(
        Uri.parse("zowe-uss:/test/path"),
        "copybook",
        [".CPY", ".cpy"],
      );

      expect(result).toEqual(Uri.parse("zowe-uss:/test/path/COPYBOOK.CPY"));
    });

    it("returns undefined when nothing matches", async () => {
      readDirectoryResult["/test/path"] = [["COPYBOOK.CPY", FileType.File]];

      const service = new VirtualFilesystemResourceService();
      const result = await service.searchDirectory(
        Uri.parse("zowe-uss:/test/path"),
        "MISSING",
        [".CPY"],
      );

      expect(result).toBeUndefined();
    });
  });
});
