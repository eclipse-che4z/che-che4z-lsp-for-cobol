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

import * as vscode from "../../__mocks__/vscode";
import * as smartTab from "../../commands/SmartTabCommand";
import {initSmartTab} from "../../commands/SmartTabCommand";
import { TabRule, TabSettings } from "../../services/Settings";

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

beforeEach(() => {
    jest.clearAllMocks();
    context.subscriptions = [];
});

test("Test initSmartTab calls registerTextEditorCommand to bind 'tab button functionality' keys", () => {    
    expect(initSmartTab).toBeTruthy();
    initSmartTab(context)
    expect(vscode.commands.registerTextEditorCommand).toBeCalledTimes(2);
});

test("Default rule was choosen for empty rule list", () => {
    const tabSettings = new TabSettings([], new TabRule([5, 10, 15, 20], 60));
    const rule = smartTab.getRule(vscode.TextEditor as any, 10, tabSettings);

    expect(rule.stops[0]).toBe(5);
    expect(rule.regex).toBeUndefined();
});

test("One of the rule was choosen", () => {
    const rule1 = new TabRule([11, 12, 13, 14], 14, "MATCHED");
    const rule2 = new TabRule([15, 16, 17, 18],18,  "TEST");

    vscode.TextEditor.document.lineAt = jest.fn().mockImplementation(line => { 
        if (line >= 9)
            return { text: "line9" }
        
        return { text: "MATCHED" }
    })

    const tabSettings = new TabSettings([rule1, rule2], new TabRule([5, 10, 15, 20], 60));
    const rule = smartTab.getRule(vscode.TextEditor as any, 10, tabSettings);

    expect(rule.stops[0]).toBe(11);
    expect(rule.regex).toBe("MATCHED");
});
