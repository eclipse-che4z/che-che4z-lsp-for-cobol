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
  getUSSContentsMock,
} from "../../../../__mocks__/getZoweExplorerMock.utility";

describe("CopybookBinaryDownloader tar path containment", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("downloadFile", () => {
    it("never fetches or writes when the remote path is relative and attempts traversal", async () => {
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

    it("never fetches or writes when the remote path is relative, even without traversal", async () => {
      const explorerAPI = createZoweExplorerMock();
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        explorerAPI,
      );

      const result = await downloader.downloadFile(
        "MY.DSN.LIB",
        "zeProfile",
        "DSN",
      );

      expect(result).toBe(false);
      expect(getContentMock).not.toHaveBeenCalled();
      expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    });

    it("downloads and writes under the tar cache root when the remote path is absolute", async () => {
      const explorerAPI = createZoweExplorerMock();
      const downloader = new CopybookBinaryDownloader(
        vscode.Uri.file("/storage"),
        explorerAPI,
      );

      const result = await downloader.downloadFile(
        "/MY.USS.FILE",
        "zeProfile",
        "USS",
      );

      expect(result).toBe(true);
      expect(getUSSContentsMock).toHaveBeenCalled();
      expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
        expect.objectContaining({
          fsPath: vscode.Uri.file("/storage/tar/MY.USS.FILE").fsPath,
        }),
        expect.anything(),
      );
    });
  });
});
