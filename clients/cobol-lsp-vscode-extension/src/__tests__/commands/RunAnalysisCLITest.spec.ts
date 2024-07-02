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

import { RunAnalysis } from "../../commands/RunAnalysisCLI";
import * as vscode from "vscode";

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
        getText: jest.fn(),
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
    showQuickPick: jest.fn(),
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
    parse: jest.fn().mockReturnValue({ path: "/storagePath" }),
  },
}));

const context: any = {
  subscriptions: [],
  globalStorageUri: { fsPath: "/storagePath" },
};

describe("Test Analysis CLI command functionality", () => {
  test("Cobol Analysis - Java", async () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );
    vscode.window.showQuickPick = jest.fn().mockReturnValue("Java");

    const runCobolAnalysisCommandSpy = jest.spyOn(
      testAnalysis as any,
      "runCobolAnalysisCommand",
    );
    const getCurrentFileLocationSpy = jest.spyOn(
      testAnalysis as any,
      "getCurrentFileLocation",
    );
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildJavaCommand",
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildNativeCommand",
    );
    const getExtensionPathSpy = jest.spyOn(
      testAnalysis as any,
      "getExtensionPath",
    );
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis as any,
      "buildAnalysisCommandPortion",
    );
    const sendToTerminalSpy = jest.spyOn(testAnalysis as any, "sendToTerminal");

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildJavaCommandSpy).toHaveBeenCalled();
    expect(getExtensionPathSpy).toHaveBeenCalled();
    expect(buildAnalysisCommandPortionSpy).toHaveBeenCalled();
    expect(sendToTerminalSpy).toHaveBeenCalled();

    expect(buildNativeCommandSpy).toHaveBeenCalledTimes(0);
  });

  test("Cobol Analysis - Native", async () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );
    vscode.window.showQuickPick = jest.fn().mockReturnValue("Native");

    if (vscode.window.activeTextEditor) {
      (vscode.window.activeTextEditor.document.uri.path as any) =
        vscode.Uri.parse("/storagePath");
    }

    const runCobolAnalysisCommandSpy = jest.spyOn(
      testAnalysis as any,
      "runCobolAnalysisCommand",
    );
    const getCurrentFileLocationSpy = jest.spyOn(
      testAnalysis as any,
      "getCurrentFileLocation",
    );
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildJavaCommand",
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildNativeCommand",
    );
    const getExtensionPathSpy = jest.spyOn(
      testAnalysis as any,
      "getExtensionPath",
    );
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis as any,
      "buildAnalysisCommandPortion",
    );
    const sendToTerminalSpy = jest.spyOn(testAnalysis as any, "sendToTerminal");

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildNativeCommandSpy).toHaveBeenCalled();
    expect(getExtensionPathSpy).toHaveBeenCalled();
    expect(buildAnalysisCommandPortionSpy).toHaveBeenCalled();
    expect(sendToTerminalSpy).toHaveBeenCalled();

    expect(buildJavaCommandSpy).toHaveBeenCalledTimes(0);
  });

  test("Cobol Analysis - Undefined Type", async () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );
    vscode.window.showQuickPick = jest.fn().mockReturnValue(undefined);

    const runCobolAnalysisCommandSpy = jest.spyOn(
      testAnalysis as any,
      "runCobolAnalysisCommand",
    );
    const getVersionToRunSpy = jest.spyOn(
      testAnalysis as any,
      "getVersionToRun",
    );
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildNativeCommand",
    );

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getVersionToRunSpy).toHaveBeenCalled();
    expect(buildJavaCommandSpy).not.toHaveBeenCalled();
  });

  test("Cobol Analysis - Save temp file", async () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );
    vscode.window.showQuickPick = jest.fn().mockReturnValue("Java");
    if (vscode.window.activeTextEditor) {
      vscode.window.activeTextEditor.document.getText = jest
        .fn()
        .mockReturnValue("Test data");
      jest.replaceProperty(
        vscode.window.activeTextEditor.document.uri,
        "path",
        "Untitled-1",
      );
    }

    const saveTempFileSpy = jest.spyOn(testAnalysis as any, "saveTempFile");

    await testAnalysis.runCobolAnalysisCommand();

    expect(saveTempFileSpy).toHaveBeenCalled();
  });

  test("Cobol - Java - No file location", () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );

    const result = (testAnalysis as any).buildJavaCommand("");

    expect(result).toBe("");
  });

  test("Cobol - getServerPath", () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );

    let result = (testAnalysis as any).getServerPath("initialPath", "win32");
    expect(result).toBe("initialPath");

    result = (testAnalysis as any).getServerPath("initialPath", "linux");
    expect(result).toBe("initialPath/server-linux");

    result = (testAnalysis as any).getServerPath("initialPath", "darwin");
    expect(result).toBe("initialPath/server-mac");

    result = (testAnalysis as any).getServerPath("initialPath", "other");
    expect(result).toBe("");
  });

  test("Cobol - getClearCommand", () => {
    const testAnalysis = new RunAnalysis(
      vscode.Uri.parse(context.globalStorageUri),
    );

    let result = (testAnalysis as any).getClearCommand("win32");
    expect(result).toBe("cls");

    result = (testAnalysis as any).getClearCommand("linux");
    expect(result).toBe("clear");
  });
});
