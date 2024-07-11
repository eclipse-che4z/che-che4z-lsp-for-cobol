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
  FileType: {
    Directory: 2,
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
          fsPath: "/storagePath",
          scheme: "file",
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
      readDirectory: jest.fn().mockReturnValue([]),
      stat: jest.fn().mockReturnValue(2),
      writeFile: jest.fn(),
    },
  },
  Uri: {
    joinPath: jest.fn().mockImplementation((inputUri: vscode.Uri, path) => {
      return {
        path: inputUri.path + path,
        fsPath: inputUri.fsPath + path,
      };
    }),
  },
}));

const context: any = {
  extensionUri: { fsPath: "/test" },
  globalStorageUri: { fsPath: "/storagePath" },
  subscriptions: [],
};

describe("Test Analysis CLI command functionality", () => {
  test("Cobol Analysis - Java", async () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );
    vscode.window.showQuickPick = jest
      .fn()
      .mockReturnValueOnce("Java")
      .mockReturnValue("Show");

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
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis as any,
      "buildAnalysisCommandPortion",
    );
    const sendToTerminalSpy = jest.spyOn(testAnalysis as any, "sendToTerminal");

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildJavaCommandSpy).toHaveBeenCalledWith("/storagePath", true);
    expect(buildJavaCommandSpy).toHaveReturnedWith(
      'java -jar "/test/server/jar/server.jar" analysis -s "/storagePath" -cf=.',
    );
    expect(buildAnalysisCommandPortionSpy).toHaveReturnedWith(
      'analysis -s "/storagePath" -cf=.',
    );
    expect(sendToTerminalSpy).toHaveBeenCalled();

    expect(buildNativeCommandSpy).toHaveBeenCalledTimes(0);
  });

  test("Cobol Analysis - Native", async () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );
    vscode.window.showQuickPick = jest
      .fn()
      .mockReturnValueOnce("Native")
      .mockReturnValue("Show");

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
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis as any,
      "buildAnalysisCommandPortion",
    );
    const sendToTerminalSpy = jest.spyOn(testAnalysis as any, "sendToTerminal");

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildNativeCommandSpy).toHaveBeenCalledWith(
      "/storagePath",
      process.platform,
      true,
    );
    expect(buildAnalysisCommandPortionSpy).toHaveReturnedWith(
      'analysis -s "/storagePath" -cf=.',
    );
    expect(sendToTerminalSpy).toHaveBeenCalled();

    expect(buildJavaCommandSpy).toHaveBeenCalledTimes(0);
  });

  test("Cobol Analysis - Undefined Type", async () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
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
      "buildJavaCommand",
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis as any,
      "buildNativeCommand",
    );

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getVersionToRunSpy).toHaveBeenCalled();
    expect(buildJavaCommandSpy).not.toHaveBeenCalled();
    expect(buildNativeCommandSpy).not.toHaveBeenCalled();
  });

  test("Cobol Analysis - Save temp file", async () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );
    vscode.window.showQuickPick = jest.fn().mockReturnValue("Java");
    if (vscode.window.activeTextEditor) {
      vscode.window.activeTextEditor.document.getText = jest
        .fn()
        .mockReturnValue("Test data");
      jest.replaceProperty(
        vscode.window.activeTextEditor.document.uri,
        "scheme",
        "untitled",
      );
    }

    const saveTempFileSpy = jest.spyOn(testAnalysis as any, "saveTempFile");

    await testAnalysis.runCobolAnalysisCommand();

    expect(saveTempFileSpy).toHaveBeenCalled();
  });

  test("Cobol - Java - No file location", () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );

    const result = (testAnalysis as any).buildJavaCommand("");

    expect(result).toBe("");
  });

  test("Cobol - getServerPath", () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
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
});
