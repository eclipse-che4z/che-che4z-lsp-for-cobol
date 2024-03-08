/*
 * Copyright (c) 2024 Broadcom.
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
import { Range } from "../../../__mocks__/vscode";
import { ServerRuntimeCodeActionProvider } from "../../../services/nativeLanguageClient/serverRuntimeCodeActionProvider";

jest.mock("../../../services/reporter/TelemetryService");
describe("Tests the server code actions", () => {
  it("checks that no code action is provided when diagnostics is empty", async () => {
    const codeActionProvider = new ServerRuntimeCodeActionProvider();
    const { doc, context, token } = getCodeactionMockObjects([]);
    const codeActions = await codeActionProvider.provideCodeActions(
      doc,
      new Range(),
      context,
      token,
    );
    expect(codeActions.length).toBe(0);
  });

  it("checks that no code action is provided when diagnostics is a syntax error and not a setup  issue", async () => {
    const codeActionProvider = new ServerRuntimeCodeActionProvider();
    const { doc, context, token } = getCodeactionMockObjects([
      {
        range: new Range(),
        message: "some syntax error",
        severity: 0,
        code: "syntax error",
      },
    ]);
    const codeActions = await codeActionProvider.provideCodeActions(
      doc,
      new Range(),
      context,
      token,
    );
    expect(codeActions.length).toBe(0);
  });

  it("checks that code actions are provided when the diagnostics are related to the server type configuration", async () => {
    const codeActionProvider = new ServerRuntimeCodeActionProvider();
    const { doc, context, token } = getCodeactionMockObjects([
      {
        range: new Range(),
        message: "server configuration error",
        severity: 0,
        code: "incompatible server type",
      },
    ]);
    (vscode.CodeActionKind as any) = {
      QuickFix: "quickfix",
    };
    (vscode.CodeAction as any) = jest.fn();
    const codeActions = await codeActionProvider.provideCodeActions(
      doc,
      new Range(),
      context,
      token,
    );
    expect(codeActions.length).toBe(2);
  });
});

function getCodeactionMockObjects(diagnostics: vscode.Diagnostic[]) {
  const doc = {
    uri: { fsPath: "ws-path" },
    fileName: "test-file",
    lineAt: jest.fn().mockReturnValue({ text: "" }),
  } as any;
  const context = {
    triggerKind: 1,
    diagnostics: diagnostics,
    only: undefined,
  };
  const token = {
    isCancellationRequested: false,
    onCancellationRequested: jest.fn(),
  };
  return { doc, context, token };
}
