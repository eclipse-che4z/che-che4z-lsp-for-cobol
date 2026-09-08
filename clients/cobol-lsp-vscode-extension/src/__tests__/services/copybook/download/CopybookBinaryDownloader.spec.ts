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

describe("CopybookBinaryDownloader tar path containment", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("getTarFileUri", () => {
    it("resolves a plain remote path under the tar cache root", () => {
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      expect(downloader.getTarFileUri("MY.DSN.LIB")?.fsPath).toBe(
        vscode.Uri.file("/storage/tar/MY.DSN.LIB").fsPath,
      );
    });

    it("resolves internal '..' segments that stay within the root", () => {
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      expect(downloader.getTarFileUri("SAM/../SIMPLE.tar")?.fsPath).toBe(
        vscode.Uri.file("/storage/tar/SIMPLE.tar").fsPath,
      );
    });

    it("rejects a remote path that traverses out of the tar cache root", () => {
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      expect(
        downloader.getTarFileUri("../../../../etc/passwd"),
      ).toBeUndefined();
    });

    it("rejects an absolute remote path", () => {
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        createZoweExplorerMock(),
      );

      expect(downloader.getTarFileUri("/etc/passwd")).toBeUndefined();
    });
  });

  describe("downloadFile", () => {
    it("never fetches or writes when the remote path attempts traversal", async () => {
      const explorerAPI = createZoweExplorerMock();
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        explorerAPI,
      );

      const result = await downloader.downloadFile(
        "../../../../etc/passwd",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(false);
      expect(getContentMock).not.toHaveBeenCalled();
      expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    });
  });
});
