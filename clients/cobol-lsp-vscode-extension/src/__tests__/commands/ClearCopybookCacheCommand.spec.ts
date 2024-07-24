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

jest.mock("vscode", () => ({
  Uri: {
    joinPath: (uri: { path: string }, ...segments: string[]) => {
      const result = { ...uri };
      result.path =
        uri.path + (uri.path.endsWith("/") ? "" : "/") + segments.join("/");
      return result;
    },
  },
  window: {
    setStatusBarMessage: jest.fn().mockResolvedValue(true),
    showInformationMessage: jest
      .fn()
      .mockImplementation((message: string) => Promise.resolve(message)),
  },
  workspace: {
    fs: {
      delete: jest.fn().mockReturnValue(true),
      readDirectory: jest.fn().mockResolvedValue([["fileName", 2]]),
    },
  },
}));
beforeEach(() => {
  jest.clearAllMocks();
});

afterAll(() => {
  jest.clearAllMocks();
});

describe("Tests downloaded copybook cache clear", () => {
  it("verify that the clearCache tries to delete cache directories", async () => {
    await clearCache({ path: "/storagePath" } as any as vscode.Uri);
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
});
