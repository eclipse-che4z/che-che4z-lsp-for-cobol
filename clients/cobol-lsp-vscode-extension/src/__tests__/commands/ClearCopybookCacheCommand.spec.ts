/*
 * Copyright (c) 2022 Broadcom.
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

import { clearCache } from "../../commands/ClearCopybookCacheCommand";
import * as vscode from "vscode";

beforeEach(() => {
  jest.clearAllMocks();
});

afterAll(() => {
  jest.clearAllMocks();
});

describe("Tests downloaded copybook cache clear", () => {
  it("verify that the clearCache tries to delete cache directories", async () => {
    await clearCache(vscode.Uri.file("/storagePath"));
    expect(vscode.workspace.fs.readDirectory).toHaveBeenNthCalledWith(1, {
      path: "/storagePath/zowe/copybooks",
    });
    expect(vscode.workspace.fs.readDirectory).toHaveBeenNthCalledWith(2, {
      path: "/storagePath/e4e/copybooks",
    });
    expect(vscode.workspace.fs.delete).toHaveBeenNthCalledWith(
      1,
      { path: "/storagePath/zowe/copybooks/fileName" },
      { recursive: true, useTrash: false },
    );
    expect(vscode.workspace.fs.delete).toHaveBeenNthCalledWith(
      2,
      { path: "/storagePath/e4e/copybooks/fileName" },
      { recursive: true, useTrash: false },
    );
  });

  describe("Cache clear errors", () => {
    beforeAll(() => {
      jest
        .spyOn(vscode.workspace.fs, "readDirectory")
        .mockImplementation(() => {
          throw vscode.FileSystemError.FileNotFound();
        });
    });

    it("doesn't fail if cache folder doesn't exist", async () => {
      await clearCache(vscode.Uri.file("/storagePath"));
    });
  });
});
