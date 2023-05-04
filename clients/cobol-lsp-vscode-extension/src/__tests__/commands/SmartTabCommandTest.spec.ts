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
import { initSmartTab } from "../../commands/SmartTabCommand";
import { TabRule, TabSettings } from "../../services/Settings";
import { Position, Selection, TextEditor, TextEditorEdit } from "vscode";

const editor: any = {
  document: {
    uri: {
      path: "",
    },
  },
  selections: [],
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
  initSmartTab(context);
  expect(vscode.commands.registerTextEditorCommand).toBeCalledTimes(2);
});

test("Default rule was choosen for empty rule list", () => {
  const tabSettings = new TabSettings([], new TabRule([5, 10, 15, 20], 60));
  const rule = smartTab.getRule(vscode.TextEditor as any, 10, tabSettings);

  expect(rule.stops[0]).toBe(5);
  expect(rule.regex).toBeUndefined();
});

test("SmartTabCommandProvider execution", async () => {
  const stp: smartTab.SmartTabCommandProvider =
    new smartTab.SmartTabCommandProvider(context, "some name");
  const active: Position = new Position(1, 2);
  const mockSelection: Selection = new Selection(active, active);
  const textLine = { text: "" };
  const mockEditor: TextEditor = {
    selections: [mockSelection],
    document: {
      lineAt: jest.fn().mockReturnValue(textLine),
    },
  } as any;
  stp.execute(mockEditor, { insert: jest.fn() } as any);
  expect(mockEditor.selections[0].active.character).toBe(6);
});

test("Multitab SmartTabCommandProvider execution", async () => {
  const stp: smartTab.SmartTabCommandProvider =
    new smartTab.SmartTabCommandProvider(context, "some name");
  const smartOut: smartTab.SmartTabCommandProvider =
    new smartTab.SmartOutdentCommandProvider(context, "some name");
  const active: Position = new Position(1, 2);
  const mockSelection: Selection = new Selection(active, active);
  (mockSelection as any).start = { line: 1 };
  (mockSelection as any).end = { line: 3 };
  const textLine = { text: "TEST" };
  const mockEditor: TextEditor = {
    selections: [mockSelection],
    document: {
      lineAt: jest.fn().mockReturnValue(textLine),
    },
  } as any;
  stp.execute(mockEditor, { insert: jest.fn() } as any);
  smartOut.execute(mockEditor, { insert: jest.fn(), delete: jest.fn() } as any);
  expect(mockEditor.selections.length).toBe(1);
  expect(mockEditor.selections[0].start.line).toBe(1);
  expect(mockEditor.selections[0].end.line).toBe(3);
});

test("One of the rule was choosen", () => {
  const rule1 = new TabRule([11, 12, 13, 14], 14, "MATCHED");
  const rule2 = new TabRule([15, 16, 17, 18], 18, "TEST");

  vscode.TextEditor.document.lineAt = jest.fn().mockImplementation((line) => {
    if (line >= 9) return { text: "line9" };

    return { text: "MATCHED" };
  });

  const tabSettings = new TabSettings(
    [rule1, rule2],
    new TabRule([5, 10, 15, 20], 60),
  );
  const rule = smartTab.getRule(vscode.TextEditor as any, 10, tabSettings);

  expect(rule.stops[0]).toBe(11);
  expect(rule.regex).toBe("MATCHED");
});
