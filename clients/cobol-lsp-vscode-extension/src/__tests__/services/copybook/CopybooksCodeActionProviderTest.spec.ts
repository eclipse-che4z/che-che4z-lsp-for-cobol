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

jest.mock("../../../services/reporter");

import * as vscode from "vscode";
import { CopybooksCodeActionProvider } from "../../../services/copybook/CopybooksCodeActionProvider";
import { Utils } from "../../../services/util/Utils";
import { telemetryEvent } from "../../../services/reporter";

describe("Test Copybook code action provider", () => {
  const copybooksCodeAction = new CopybooksCodeActionProvider();
  const doc = {
    uri: vscode.Uri.file("ws-path"),
    fileName: "testFile",
  } as vscode.TextDocument;
  const range = new vscode.Range(
    new vscode.Position(4, 5),
    new vscode.Position(4, 6),
  );
  const token = {
    isCancellationRequested: false,
    onCancellationRequested: jest.fn(),
  };

  beforeAll(() => {
    Utils.getZoweExplorerAPI = jest.fn();
  });

  afterAll(() => {
    jest.clearAllMocks();
  });

  test("code action is not triggered when diagnosis not completed", () => {
    const context = {
      triggerKind: {},
      diagnostics: [],
      only: undefined,
    } as unknown as vscode.CodeActionContext;
    expect(
      copybooksCodeAction.provideCodeActions(doc, range, context, token).length,
    ).toBe(0);
  });

  test("code action is not triggered even if diagnosis is completed with code different then `missing copybook` ", () => {
    const context = {
      triggerKind: {},
      diagnostics: [
        {
          range: {
            start: { line: 4, character: 5 },
            end: { line: 4, character: 6 },
          },
          code: "something",
        },
      ],
      only: undefined,
    } as unknown as vscode.CodeActionContext;
    expect(
      copybooksCodeAction.provideCodeActions(doc, range, context, token).length,
    ).toBe(0);
  });

  test("code action is triggered when diagnosis completed and diagnosis code is `missing copybook`", () => {
    const context = {
      triggerKind: {},
      diagnostics: [
        {
          range: {
            start: { line: 4, character: 5 },
            end: { line: 4, character: 6 },
          },
          code: "missing copybook",
        },
      ],
      only: undefined,
    } as unknown as vscode.CodeActionContext;
    expect(
      copybooksCodeAction.provideCodeActions(doc, range, context, token).length,
    ).toBe(1);
    expect(telemetryEvent).toHaveBeenCalledWith(
      "QuickFix for copybook activation",
      ["COBOL", "hover", "copybook", "quickfix"],
      "User try to understand the syntax error for a missing copybook",
    );
  });
});
