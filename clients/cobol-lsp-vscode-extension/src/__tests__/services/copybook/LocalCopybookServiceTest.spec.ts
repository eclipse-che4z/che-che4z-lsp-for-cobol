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

import { listLocalCopybooks } from "../../../services/copybook/LocalCopybooksService";
import * as vscode from "vscode";
import { DEFAULT_DIALECT, PATHS_LOCAL_KEY } from "../../../constants";

describe("LocalCopybookService tests", () => {
  let configurationValues: Record<string, unknown> = {};
  let folderContent: Record<string, string[]> = {};

  beforeEach(() => {
    jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
      get: (key: string) => configurationValues[key],
    } as unknown as vscode.WorkspaceConfiguration);
    jest
      .spyOn(vscode.workspace, "findFiles")
      .mockImplementation((pattern: vscode.GlobPattern) => {
        if (pattern instanceof Object && "baseUri" in pattern) {
          const files = folderContent[pattern.baseUri.toString()] ?? [];
          return Promise.resolve(files.map(vscode.Uri.file));
        }
        return Promise.resolve([]);
      });
  });
  afterEach(() => {
    jest.restoreAllMocks();
  });

  describe("listLocalCopybooks", () => {
    describe("returns array of names of copybooks stored in local directories", () => {
      beforeAll(() => {
        configurationValues = {
          [PATHS_LOCAL_KEY]: ["/test/path/**", "another/path"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
        folderContent = {
          "file:///test/path": [
            "/test/path/COPYBOOK.CPY",
            "/test/path/subfolder/SUBCOPY.CPY",
          ],
          "file:///workspace/another/path": ["/workspace/another/path/COPYBK2"],
        };
      });

      it("return copybooks", async () => {
        const results = await listLocalCopybooks(
          "file:///PROGRAM.cbl",
          DEFAULT_DIALECT,
        );

        expect(results).toEqual(
          expect.arrayContaining(["COPYBOOK", "SUBCOPY", "COPYBK2"]),
        );
      });
    });
  });
});
