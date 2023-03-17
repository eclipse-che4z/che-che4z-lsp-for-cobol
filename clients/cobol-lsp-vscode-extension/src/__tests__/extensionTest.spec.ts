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

import * as vscode from "vscode";
import { fetchCopybookCommand } from "../commands/FetchCopybookCommand";
import { gotoCopybookSettings } from "../commands/OpenSettingsCommand";
import { initSmartTab } from "../commands/SmartTabCommand";
import { activate } from "../extension";
import { CopybooksCodeActionProvider } from "../services/copybook/CopybooksCodeActionProvider";
import { LanguageClientService } from "../services/LanguageClientService";
import { TelemetryService } from "../services/reporter/TelemetryService";
import { createFileWithGivenPath } from "../services/Settings";
import { SnippetCompletionProvider } from "../services/snippetcompletion/SnippetCompletionProvider";
import { Utils } from "../services/util/Utils";

jest.mock("../commands/SmartTabCommand");
jest.mock("../commands/FetchCopybookCommand");
jest.mock("../commands/OpenSettingsCommand");
jest.mock("../services/LanguageClientService");
jest.mock("../services/copybook/CopybookDownloadService");
jest.mock("../commands/ClearCopybookCacheCommand");

jest.mock("../services/Settings", () => ({
    createFileWithGivenPath: jest.fn(),
    initializeSettings: jest.fn(),
    SettingsService: {
        serverRuntime: jest.fn().mockReturnValueOnce(undefined).mockReturnValue("JAVA"),
        getSnippetsForCobol: jest.fn().mockReturnValue([]),
        getDialects: jest.fn().mockReturnValue([]),
    },
}));

Utils.getZoweExplorerAPI = jest.fn();
jest.mock("vscode", () => ({
    commands: {
        registerCommand: jest.fn().mockImplementation((command, callback) => callback()),
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
        setStatusBarMessage: jest.fn().mockImplementation(async (_text: string, _hideWhenDone: Thenable<any>) => {
            return Promise.resolve(true);
        }),
        showErrorMessage: jest.fn().mockReturnValue("test"),
        showInformationMessage: jest.fn().mockImplementation((message: string) => Promise.resolve(message)),
        onDidChangeActiveTextEditor: jest.fn(),
        createQuickPick: jest.fn().mockReturnValue({onDidChangeSelection: jest.fn(), show: jest.fn()}),
        createOutputChannel: jest.fn().mockReturnValue({
            appendLine: jest.fn(),
        }),
    },
    workspace: {
        getConfiguration: jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(9),
        }),
        getWorkspaceFolder: jest.fn().mockReturnValue({ name: "workspaceFolder1" }),
        onDidChangeConfiguration: jest.fn().mockReturnValue("onDidChangeConfiguration"),
        workspaceFolders: [{ uri: { fsPath: "ws-path" } } as any],
    },
}));

jest.mock("vscode-languageclient", () => ({
    LanguageClient: jest.fn(),
}));
jest.mock("../services/reporter/TelemetryService");
jest.mock("../services/copybook/CopybookMessageHandler", () => ({
    resolveCopybookHandler: jest.fn(),
    downloadCopybookHandler: jest.fn(),
}));

const context: any = {
    subscriptions: [],
};

beforeEach(() => {
    jest.clearAllMocks();
    context.subscriptions = [];
});

describe("Check plugin extension for cobol starts successfully.", () => {

    test("start extension", async () => {
        await activate(context);
        expect(TelemetryService.registerEvent).toHaveBeenCalledWith("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");

        expect(vscode.commands.registerCommand).toBeCalledTimes(9);

        expect(fetchCopybookCommand).toHaveBeenCalled();
        expect(gotoCopybookSettings).toHaveBeenCalled();
        expect(initSmartTab).toHaveBeenCalled();

        expect(vscode.languages.registerCodeActionsProvider)
            .toBeCalledWith({ scheme: "file", language: "cobol" }, expect.any(CopybooksCodeActionProvider));

        expect(vscode.languages.registerCompletionItemProvider)
             .toBeCalledWith({ scheme: "file", language: "cobol" }, expect.any(SnippetCompletionProvider));

    });

    test("extension reruns extended API surface", async () => {
        const extendedApi = await activate(context);
        extendedApi.analysis("test", "text");
        expect(LanguageClientService.prototype.retrieveAnalysis).toBeCalledTimes(1);
    });
});

describe("Check plugin extension for cobol fails.", () => {
    beforeEach(() => {
        (LanguageClientService as any).mockImplementation(() => {
            return {
                checkPrerequisites: () => {
                    throw new Error("The error");
                },
                enableNativeBuild: jest.fn(),
                addRequestHandler: jest.fn(),
                retrieveAnalysis: jest.fn(),
                start: jest.fn(),
            };
        });
    });

    test("start fails.", async () => {
        await activate(context);
        expect(TelemetryService.registerEvent).toHaveBeenCalledWith("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");
    });
});

describe("Check recognition of COBOL from first line", () => {
  const manifest = require('../../package.json')
  const firstLine = manifest.contributes.languages[0].firstLine;
  const cobol = expect.stringMatching(firstLine)

  test("Comment Line SEQ", () => {
    const pgm = `000010*REALLY ANYTHING`;
    expect(pgm).toEqual(cobol)
  })

  test("Comment Line NOSEQ", () => {
    const pgm = `      *REALLY ANYTHING`;
    expect(pgm).toEqual(cobol)
  })

  test("Identification Division SEQ", () => {
    const pgm = `000010 IDENTIFICATION DIVISION.`
    expect(pgm).toEqual(cobol)
  })

  test("Identification Division NOSEQ", () => {
    const pgm = `       IDENTIFICATION DIVISION.`
    expect(pgm).toEqual(cobol)
  })

  test("ID Division", () => {
    const pgm = `000010 ID DIVISION.`
    expect(pgm).toEqual(cobol)
  })


  test("Data Definition (copybook) SEQ", () => {
    const pgm = `000010 01 ABC-XYZ.`;
    expect(pgm).toEqual(cobol)
  })

  test("Data Definition (copybook) NOSEQ", () => {
    const pgm = `       01 ABC-XYZ.`;
    expect(pgm).toEqual(cobol)
  })

  test("CICS Translator Directive SEQ", () => {
    const pgm = `000010 CBL XOPTS(COBOL2)`;
    expect(pgm).toEqual(cobol)
  })

  test("CICS Translator Directive NOSEQ", () => {
    const pgm = `       CBL XOPTS(COBOL2)`;
    expect(pgm).toEqual(cobol)
  })
});
