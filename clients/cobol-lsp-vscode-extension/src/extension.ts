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

import { fetchCopybookCommand } from "./commands/FetchCopybookCommand";
import { gotoCopybookSettings } from "./commands/OpenSettingsCommand";
import { C4Z_FOLDER, GITIGNORE_FILE, LANGUAGE_ID, SERVER_TYPE } from "./constants";
import { CopybookDownloadService } from "./services/copybook/CopybookDownloadService";
import { CopybooksCodeActionProvider } from "./services/copybook/CopybooksCodeActionProvider";

import { clearCache } from "./commands/ClearCopybookCacheCommand";
import { CommentAction, commentCommand } from "./commands/CommentCommand";
import { initSmartTab } from "./commands/SmartTabCommand";
import { LanguageClientService } from "./services/LanguageClientService";
import { Middleware } from "./services/Middleware";
import { TelemetryService } from "./services/reporter/TelemetryService";
import { createFileWithGivenPath, SettingsService } from "./services/Settings";
import { pickSnippet, SnippetCompletionProvider } from "./services/snippetcompletion/SnippetCompletionProvider";
import { resolveSubroutineURI } from "./services/util/SubroutineUtils";

let languageClientService: LanguageClientService;

function initialize() {
    // We need lazy initialization to be able to mock this for unit testing
    const copyBooksDownloader = new CopybookDownloadService();
    const middleware = new Middleware(copyBooksDownloader);
    const outputChannel = vscode.window.createOutputChannel( "COBOL Language Support");
    languageClientService = new LanguageClientService(middleware, outputChannel);
    return {copyBooksDownloader, outputChannel};
}

export async function activate(context: vscode.ExtensionContext) {
    const { copyBooksDownloader, outputChannel} = initialize();
    initSmartTab(context);

    TelemetryService.registerEvent("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");

    copyBooksDownloader.start();

    // Commands
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.fetch-copybook",
        (copybook, programName) => {
        fetchCopybookCommand(copybook, copyBooksDownloader, programName);
    }));

    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.goto-settings",
        () => {
        gotoCopybookSettings();
    }));

    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.clear.downloaded.copybooks", () => { clearCache() }));

    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.toggle", () => { commentCommand(CommentAction.TOGGLE) }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.comment", () => { commentCommand(CommentAction.COMMENT) }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.uncomment", () => { commentCommand(CommentAction.UNCOMMENT) }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.snippets.insertSnippets", () => { pickSnippet(); }));
    // create .gitignore file within .c4z folder
    createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");

    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new CopybooksCodeActionProvider()));
    context.subscriptions.push(vscode.languages.registerCompletionItemProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new SnippetCompletionProvider()));

    vscode.workspace.onDidChangeConfiguration(async event => {
        if (event.affectsConfiguration(SERVER_TYPE)) {
            const selection = await vscode.window.showInformationMessage("Restart the vscode to enforce native build settings change", "Ok", "Later");
            if (typeof selection === "undefined" || selection === "Later") {
                return;
            }
            if (selection === "Ok") {
                TelemetryService.registerEvent("Native Build enabled", ["COBOL", "native build enabled", "settings"],
                    "Native build enabled by user");
                await vscode.commands.executeCommand("workbench.action.reloadWindow");
            }
        }
    });

    try {
        if (SettingsService.serverType() === "NATIVE") {
            languageClientService.enableNativeBuild();
        } else {
            await languageClientService.checkPrerequisites();
        }
    } catch (err) {
        outputChannel.appendLine(err.toString());
        languageClientService.enableNativeBuild();
        TelemetryService.registerExceptionEvent("RuntimeException", err.toString(), ["bootstrap", "experiment-tag"], "Client has wrong Java version installed. Native builds activated.");
    }

    // Custom client handlers
    languageClientService.addRequestHandler("cobol/resolveSubroutine", resolveSubroutineURI);

    context.subscriptions.push(languageClientService.start());

    // 'export' public api-surface
    return {
        analysis(uri: string, text: string): Promise<any> {
            return languageClientService.retrieveAnalysis(uri, text);
        },
    };
}

export function deactivate() {
    return Promise.resolve(languageClientService.stop());
}
