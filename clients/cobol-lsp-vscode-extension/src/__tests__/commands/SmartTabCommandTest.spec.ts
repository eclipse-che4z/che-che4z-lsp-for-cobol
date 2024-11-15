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
import * as smartTab from "../../commands/SmartTabCommand";
import { initSmartTab } from "../../commands/SmartTabCommand";
import { TabRule, TabSettings } from "../../services/SmartTabSettings";
import { ExtensionContext, Position, Selection, TextEditor } from "vscode";
import { asMutable } from "../../test/suite/testHelper";
import { TextEditorEdit } from "../../__mocks__/vscode";

const context = {
  subscriptions: [],
} as unknown as ExtensionContext;

beforeEach(() => {
  jest.clearAllMocks();
});

test("Test initSmartTab calls registerTextEditorCommand to bind 'tab button functionality' keys", () => {
  expect(initSmartTab).toBeTruthy();
  initSmartTab(context);
  expect(vscode.commands.registerTextEditorCommand).toHaveBeenCalledTimes(2);
});

test("Default rule was chosen for empty rule list", () => {
  const tabSettings = new TabSettings([], new TabRule([5, 10, 15, 20], 60));
  const editor = {} as TextEditor;
  const rule = smartTab.getRule(editor, 10, tabSettings);

  expect(rule.stops[0]).toBe(5);
  expect(rule.regex).toBeUndefined();
});

test("SmartTabCommandProvider execution", () => {
  const stp: smartTab.SmartTabCommandProvider =
    new smartTab.SmartTabCommandProvider(context, "some name");
  const active: Position = new Position(1, 2);
  const mockSelection: Selection = new Selection(active, active);
  const textLine = { text: "" };
  const mockEditor = {
    selections: [mockSelection],
    document: {
      lineAt: jest.fn().mockReturnValue(textLine),
    },
  } as unknown as TextEditor;
  stp.execute(mockEditor, TextEditorEdit);
  expect(mockEditor.selections[0].active.character).toBe(6);
});

test("Multi tab SmartTabCommandProvider execution", () => {
  const stp: smartTab.SmartTabCommandProvider =
    new smartTab.SmartTabCommandProvider(context, "some name");
  const smartOut: smartTab.SmartTabCommandProvider =
    new smartTab.SmartOutdentCommandProvider(context, "some name");
  const active: Position = new Position(1, 2);
  const mockSelection = new Selection(active, active);
  asMutable(mockSelection).start = new Position(1, 1);
  asMutable(mockSelection).end = new Position(3, 1);
  const textLine = { text: "TEST" };
  const mockEditor = {
    selections: [mockSelection],
    document: {
      lineAt: jest.fn().mockReturnValue(textLine),
    },
  } as unknown as TextEditor;
  stp.execute(mockEditor, TextEditorEdit);
  smartOut.execute(mockEditor, TextEditorEdit);
  expect(mockEditor.selections.length).toBe(1);
  expect(mockEditor.selections[0].start.line).toBe(1);
  expect(mockEditor.selections[0].end.line).toBe(3);
});

test("One of the rule was chosen", () => {
  const rule1 = new TabRule([11, 12, 13, 14], 14, "MATCHED");
  const rule2 = new TabRule([15, 16, 17, 18], 18, "TEST");

  const mockEditor = {
    document: {
      lineAt: jest.fn().mockImplementation((line) => {
        if (line >= 9) return { text: "line9" };

        return { text: "MATCHED" };
      }),
    },
  } as unknown as TextEditor;

  const tabSettings = new TabSettings(
    [rule1, rule2],
    new TabRule([5, 10, 15, 20], 60),
  );
  const rule = smartTab.getRule(mockEditor, 10, tabSettings);

  expect(rule.stops[0]).toBe(11);
  expect(rule.regex).toBe("MATCHED");
});
