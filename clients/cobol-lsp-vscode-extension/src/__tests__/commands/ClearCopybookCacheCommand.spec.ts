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

import * as path from "path";
import * as vscode from "vscode";
import { clearCache } from "../../commands/ClearCopybookCacheCommand";
import { C4Z_FOLDER, COPYBOOKS_FOLDER } from "../../constants";

const fsPath = "tmp-ws";

let copybookCachePath: string;
const wsPath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath, C4Z_FOLDER, COPYBOOKS_FOLDER);

jest.mock("vscode", () => ({
    Uri: {
        parse: jest.fn().mockReturnValue(path.join("tmp-ws", ".c4z", ".copybooks"))
    },
    window: {
        setStatusBarMessage: jest.fn().mockResolvedValue(true),
        showInformationMessage: jest.fn().mockImplementation((message: string) => Promise.resolve(message)),
    },
    workspace: {
        fs: {
            delete: jest.fn().mockReturnValue(true),
        },
        workspaceFolders: [{
            uri: {
                fsPath: "tmp-ws",
                with: jest.fn().mockImplementation((change: { scheme?: string; authority?: string; path?: string; query?: string; fragment?: string }) => {
                    return change.path;
                })
            }
        } as any],
    },
}));
beforeEach(() => {
    jest.clearAllMocks();
});

afterAll(() => {
    jest.clearAllMocks();
  }
);

describe("Tests downloaded copybook cache clear", () => {
    it("checks running command multiple times doesn't produce error", () => {
        expect(() => {
            for (let index = 0; index < 3; index++) {
                clearCache();
            }
        }).not.toThrowError();
    });
});
