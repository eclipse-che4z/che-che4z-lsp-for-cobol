/*
 * Copyright (c) 2020 Broadcom.
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

import {
  RunAnalysis,
  runCobolAnalysisCommand,
} from "../../commands/RunAnalysisCLI";
import * as vscode from "vscode";

jest.mock("../../services/util/MultiStepInputUtil");

jest.mock("vscode", () => ({
  commands: {
    registerCommand: jest
        .fn()
        .mockImplementation((command, callback) => callback()),
    executeCommand: jest.fn(),
  },
  extensions: {
    getExtension: jest.fn().mockReturnValue({ extensionPath: "/test" }),
  },
  languages: {
    registerCodeActionsProvider: jest.fn(),
    registerCompletionItemProvider: jest.fn(),
  },
  window: {
    activeTextEditor: {
      document: {
        uri: {
          path: "/storagePath",
        },
      },
    },
    setStatusBarMessage: jest
        .fn()
        .mockImplementation(
            async (_text: string, _hideWhenDone: Thenable<any>) => {
              return Promise.resolve(true);
            },
        ),
    showErrorMessage: jest.fn().mockReturnValue("test"),
    showInformationMessage: jest
        .fn()
        .mockImplementation((message: string) => Promise.resolve(message)),
    onDidChangeActiveTextEditor: jest.fn(),
    createQuickPick: jest
        .fn()
        .mockReturnValue({ onDidChangeSelection: jest.fn(), show: jest.fn() }),
    createOutputChannel: jest.fn().mockReturnValue({
      appendLine: jest.fn(),
    }),
    terminals: {
      find: jest.fn(),
    },
    createTerminal: jest.fn().mockReturnValue({
      sendText: jest.fn(),
      show: jest.fn(),
    }),
  },
  workspace: {
    getConfiguration: jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(9),
    }),
    getWorkspaceFolder: jest.fn().mockReturnValue({ name: "workspaceFolder1" }),
    onDidChangeConfiguration: jest
        .fn()
        .mockReturnValue("onDidChangeConfiguration"),
    workspaceFolders: [{ uri: { fsPath: "ws-path" } } as any],
    fs: {
      createDirectory: jest.fn(),
    },
  },
  Uri: {
    file: jest.fn().mockReturnValue("workspaceFolder2"),
    parse: jest.fn().mockReturnValue({ path: "/storagePath"}),
  },
}));

const context: any = {
  subscriptions: [],
  globalStorageUri: { fsPath: "/storagePath" },
};

describe("Test Analysis CLI command functionality", () => {

  afterEach(() => {
    jest.restoreAllMocks();
  });

  test("Cobol Analysis Command", async () => {
    const testAnalysis = new RunAnalysis( false, "", vscode.Uri.parse(context.globalStorageUri));

    const spy = jest.spyOn(testAnalysis as any, "getCurrentFileLocation");
    testAnalysis.runCobolAnalysis();
    expect(spy).toHaveBeenCalled();
  });
});
