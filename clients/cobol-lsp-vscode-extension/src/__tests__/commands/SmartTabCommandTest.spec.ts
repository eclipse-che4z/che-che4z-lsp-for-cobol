/*
 * Copyright (c) 2021 Broadcom.
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

import * as vscode from "vscode";
import {initSmartTab} from "../../commands/SmartTabCommand";

const editor: any = {
    document: {
        uri: {
            path: ""
        }
    },
    selections: []
};

const context: any = {
    subscriptions: [],
};

jest.mock("vscode", () => ({
    window: {
        activeTextEditor: {
            options: {
                tabSize: 4
            }
        }
    },
    commands: {
        executeCommand: jest.fn().mockImplementation(),
        registerTextEditorCommand : jest.fn().mockImplementation((command, callback) => callback(editor, {}))
    },
}));

beforeEach(() => {
    jest.clearAllMocks();
    context.subscriptions = [];
});

test("Test initSmartTab calls registerTextEditorCommand to bind 'tab button functionality' keys", () => {    
    expect(initSmartTab).toBeTruthy();
    initSmartTab(context)
    expect(vscode.commands.registerTextEditorCommand).toBeCalledTimes(2);
});