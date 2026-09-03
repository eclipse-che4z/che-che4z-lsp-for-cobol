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

import * as vscode from "vscode";
import { CopybookBinaryDownloader } from "../../../../services/copybook/downloader/CopybookBinaryDownloader";
import {
  createZoweExplorerMock,
  getContentMock,
} from "../../../../__mocks__/getZoweExplorerMock.utility";

function setWorkspaceTrusted(trusted: boolean) {
  // `isTrusted` is declared read-only in the vscode typings; go through
  // defineProperty to override the mock's value in individual tests.
  Object.defineProperty(vscode.workspace, "isTrusted", {
    value: trusted,
    configurable: true,
  });
}

describe("CopybookBinaryDownloader", () => {
  const storagePath = vscode.Uri.file("/storage");

  beforeEach(() => {
    jest.clearAllMocks();
    setWorkspaceTrusted(true);
    (vscode.window.showWarningMessage as jest.Mock).mockResolvedValue("Allow");
  });

  describe("getTarFileUri", () => {
    it("resolves a plain relative path under the storage tar folder", () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      expect(downloader.getTarFileUri("MY.DSN/member")?.path).toBe(
        "/storage/tar/MY.DSN/member",
      );
    });

    it("allows '..' segments that still resolve inside the storage folder", () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      expect(downloader.getTarFileUri("foo/../bar")?.path).toBe(
        "/storage/tar/bar",
      );
    });

    it("rejects a path that traverses outside the storage folder", () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      expect(
        downloader.getTarFileUri("../../../../.vscode/settings.json"),
      ).toBeUndefined();
    });
  });

  describe("downloadFile trust and consent gate", () => {
    it("refuses to download when the workspace is not trusted, without prompting or contacting the mainframe", async () => {
      setWorkspaceTrusted(false);
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      const result = await downloader.downloadFile(
        "MY.DSN.UNTRUSTED",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(false);
      expect(vscode.window.showWarningMessage).not.toHaveBeenCalled();
      expect(getContentMock).not.toHaveBeenCalled();
    });

    it("prompts for explicit consent before the first credentialed download and proceeds when allowed", async () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      const result = await downloader.downloadFile(
        "MY.DSN.ALLOW",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(true);
      expect(vscode.window.showWarningMessage).toHaveBeenCalledTimes(1);
      expect(getContentMock).toHaveBeenCalledTimes(1);
    });

    it("denies the download when the user does not explicitly allow it", async () => {
      (vscode.window.showWarningMessage as jest.Mock).mockResolvedValue(
        undefined,
      );
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      const result = await downloader.downloadFile(
        "MY.DSN.DENY",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(false);
      expect(getContentMock).not.toHaveBeenCalled();
    });

    it("does not re-prompt for a profile/path/type already approved this session", async () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      await downloader.downloadFile("MY.DSN.DEDUPE", "zeProfile", "DSN");
      await downloader.downloadFile("MY.DSN.DEDUPE", "zeProfile", "DSN");

      expect(vscode.window.showWarningMessage).toHaveBeenCalledTimes(1);
      expect(getContentMock).toHaveBeenCalledTimes(2);
    });

    it("still refuses to write outside the storage folder even if the user approves the download", async () => {
      const downloader = new CopybookBinaryDownloader(
        storagePath,
        createZoweExplorerMock(),
      );

      const result = await downloader.downloadFile(
        "../../../../outside/settings.json",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(false);
      expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    });
  });
});
