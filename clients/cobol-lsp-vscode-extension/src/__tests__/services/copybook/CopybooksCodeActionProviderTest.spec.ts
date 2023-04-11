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

import * as vscode from "vscode";
import { CopybooksCodeActionProvider } from "../../../services/copybook/CopybooksCodeActionProvider";
import { TelemetryService } from "../../../services/reporter/TelemetryService";
import { Utils } from "../../../services/util/Utils";

describe("Test Copybook code action provider", () => {
  const copybooksCodeAction = new CopybooksCodeActionProvider();
  const doc = { uri: { fsPath: "ws-path" }, fileName: "testFile" } as any;
  const range = {
    start: { line: 4, character: 5 },
    end: { line: 4, character: 6 },
  };
  const token = {
    isCancellationRequested: false,
    onCancellationRequested: jest.fn(),
  };

  beforeAll(() => {
    (vscode.extensions as any) = {
      getExtension: jest.fn().mockReturnValue({
        extensionPath: "/test",
        packageJSON: {
          version: 1,
        },
      }),
    };

    (vscode.CodeActionKind as any) = {
      QuickFix: 1,
    };
    (vscode.CodeAction as any) = jest.fn();
    TelemetryService.registerEvent = jest.fn();
    Utils.getZoweExplorerAPI = jest.fn();
  });

  afterAll(() => {
    jest.clearAllMocks();
  });

  test("code action is not triggred when diaognosis not completed", async () => {
    const context = { triggerKind: {}, diagnostics: [], only: undefined };
    expect(
      (
        await copybooksCodeAction.provideCodeActions(
          doc,
          range as any,
          context as any,
          token,
        )
      ).length,
    ).toBe(0);
  });

  test("code action is not triggred even if diaognosis is completed with code different then `missing copybook` ", async () => {
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
    };
    expect(
      (
        await copybooksCodeAction.provideCodeActions(
          doc,
          range as any,
          context as any,
          token,
        )
      ).length,
    ).toBe(0);
  });

  test("code action is triggred when diaognosis completed and diaognis code is `missing copybook`", async () => {
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
    };
    expect(
      (
        await copybooksCodeAction.provideCodeActions(
          doc,
          range as any,
          context as any,
          token,
        )
      ).length,
    ).toBe(1);
    expect(TelemetryService.registerEvent).toHaveBeenCalledWith(
      "QuickFix for copybook activation",
      ["COBOL", "hover", "copybook", "quickfix"],
      "User try to understand the syntax error for a missing copybook",
    );
  });
});
