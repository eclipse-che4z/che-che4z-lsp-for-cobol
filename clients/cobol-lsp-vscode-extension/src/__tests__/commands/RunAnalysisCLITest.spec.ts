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

const context = {
  extensionUri: vscode.Uri.file("/test"),
  globalStorageUri: vscode.Uri.file("/storagePath"),
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
      testAnalysis,
      "runCobolAnalysisCommand",
    );
    const getCurrentFileLocationSpy = jest.spyOn(
      testAnalysis,
      "getCurrentFileLocation" as keyof RunAnalysis,
    );
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis,
      "buildJavaCommand" as keyof RunAnalysis,
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis,
      "buildNativeCommand" as keyof RunAnalysis,
    );
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis,
      "buildAnalysisCommandPortion" as keyof RunAnalysis,
    );
    const sendToTerminalSpy = jest.spyOn(
      testAnalysis,
      "sendToTerminal" as keyof RunAnalysis,
    );

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildJavaCommandSpy).toHaveBeenCalledWith("/storagePath");
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
      testAnalysis,
      "runCobolAnalysisCommand",
    );
    const getCurrentFileLocationSpy = jest.spyOn(
      testAnalysis,
      "getCurrentFileLocation" as keyof RunAnalysis,
    );
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis,
      "buildJavaCommand" as keyof RunAnalysis,
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis,
      "buildNativeCommand" as keyof RunAnalysis,
    );
    const buildAnalysisCommandPortionSpy = jest.spyOn(
      testAnalysis,
      "buildAnalysisCommandPortion" as keyof RunAnalysis,
    );
    const sendToTerminalSpy = jest.spyOn(
      testAnalysis,
      "sendToTerminal" as keyof RunAnalysis,
    );

    await testAnalysis.runCobolAnalysisCommand();

    expect(runCobolAnalysisCommandSpy).toHaveBeenCalled();
    expect(getCurrentFileLocationSpy).toHaveBeenCalled();
    expect(buildNativeCommandSpy).toHaveBeenCalledWith(
      "/storagePath",
      process.platform,
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
      testAnalysis,
      "runCobolAnalysisCommand",
    );
    const getVersionToRunSpy = jest.spyOn(testAnalysis, "getVersionToRun");
    const buildJavaCommandSpy = jest.spyOn(
      testAnalysis,
      "buildJavaCommand" as keyof RunAnalysis,
    );
    const buildNativeCommandSpy = jest.spyOn(
      testAnalysis,
      "buildNativeCommand" as keyof RunAnalysis,
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

    const saveTempFileSpy = jest.spyOn(
      testAnalysis,
      "saveTempFile" as keyof RunAnalysis,
    );

    await testAnalysis.runCobolAnalysisCommand();

    expect(saveTempFileSpy).toHaveBeenCalled();
  });

  test("Cobol - Java - No file location", () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );

    const result = testAnalysis["buildJavaCommand"]("");

    expect(result).toBe("");
  });

  test("Cobol - getServerPath", () => {
    const testAnalysis = new RunAnalysis(
      context.globalStorageUri,
      context.extensionUri,
    );

    let result = testAnalysis["getServerPath"]("initialPath", "win32");
    expect(result).toBe("initialPath");

    result = testAnalysis["getServerPath"]("initialPath", "linux");
    expect(result).toBe("initialPath/server-linux");

    result = testAnalysis["getServerPath"]("initialPath", "darwin");
    expect(result).toBe("initialPath/server-mac");

    result = testAnalysis["getServerPath"]("initialPath", "other");
    expect(result).toBe("");
  });
});
