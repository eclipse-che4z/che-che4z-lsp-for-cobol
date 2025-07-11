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

import { listLocalSubroutines } from "../../../services/subroutines/LocalSubroutinesService";
import * as vscode from "vscode";
import { SETTINGS_SUBROUTINE_LOCAL_KEY } from "../../../constants";

describe("LocalSubroutinesService tests", () => {
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
          [SETTINGS_SUBROUTINE_LOCAL_KEY]: ["/test/path/**", "/another/path"],
        };
        folderContent = {
          "file:///test/path": [
            "/test/path/SUBRTN.COB",
            "/test/path/subfolder/SUBSUB.CBL",
          ],
          "file:///another/path": ["/another/path/SUBRTN2.COB"],
        };
      });

      it("return copybooks", async () => {
        const results = await listLocalSubroutines();

        expect(results).toEqual(
          expect.arrayContaining(["SUBRTN", "SUBSUB", "SUBRTN2"]),
        );
      });
    });
  });
});
