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
import { C4Z_FOLDER, GITIGNORE_FILE, IS_NATIVE_BUILD, LANGUAGE_ID } from "./constants";
import { CopybookDownloadService } from "./services/copybook/CopybookDownloadService";
import { CopybooksCodeActionProvider } from "./services/copybook/CopybooksCodeActionProvider";

import { CommentAction, commentCommand } from "./commands/CommentCommand";
import { initSmartTab } from "./commands/SmartTabCommand";
import { LanguageClientService } from "./services/LanguageClientService";
import { Middleware } from "./services/Middleware";
import { TelemetryService } from "./services/reporter/TelemetryService";
import { createFileWithGivenPath, SettingsService } from "./services/Settings";
import { resolveSubroutineURI } from "./services/util/SubroutineUtils";

let copyBooksDownloader: CopybookDownloadService;
let middleware: Middleware;
let languageClientService: LanguageClientService;

function initialize() {
    // We need lazy initialization to be able to mock this for unit testing
    copyBooksDownloader = new CopybookDownloadService();
    middleware = new Middleware(copyBooksDownloader);
    languageClientService = new LanguageClientService(middleware);
}

export async function activate(context: vscode.ExtensionContext) {
    initialize();
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
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.toggle",
        () => { commentCommand(CommentAction.TOGGLE); }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.comment",
        () => { commentCommand(CommentAction.COMMENT); }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.commentLine.uncomment",
        () => { commentCommand(CommentAction.UNCOMMENT); }));

    // create .gitignore file within .c4z folder
    createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");

    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new CopybooksCodeActionProvider()));

    vscode.workspace.onDidChangeConfiguration(async event => {
        if (event.affectsConfiguration(IS_NATIVE_BUILD)) {
            const selection = await vscode.window.showInformationMessage("Restart the vscode to enforce native build settings change", "Ok", "Later");
            if (typeof selection === "undefined" || selection === "Later") {
                return;
            }
            if (selection === "Ok") {
                await vscode.commands.executeCommand("workbench.action.reloadWindow");
            }
        }
    });

    try {
        if (SettingsService.isNativeBuildEnabled()) {
            languageClientService.enableNativeBuild();
        } else {
            await languageClientService.checkPrerequisites();
        }
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
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
