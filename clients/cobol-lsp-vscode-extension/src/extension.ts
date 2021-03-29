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

import {changeDefaultZoweProfile} from "./commands/ChangeDefaultZoweProfile";
import {editDatasetPaths} from "./commands/EditDatasetPaths";
import {fetchCopybookCommand} from "./commands/FetchCopybookCommand";
import {gotoCopybookSettings} from "./commands/OpenSettingsCommand";
import {C4Z_FOLDER, GITIGNORE_FILE, LANGUAGE_ID, SETTINGS_CPY_SECTION} from "./constants";
import {CopybookDownloadService} from "./services/copybook/CopybookDownloadService";
import {CopybooksCodeActionProvider} from "./services/copybook/CopybooksCodeActionProvider";
import {CopybooksPathGenerator} from "./services/copybook/CopybooksPathGenerator";

import {CopybookURI} from "./services/copybook/CopybookURI";
import {AnalysisResult, LanguageClientService} from "./services/LanguageClientService";
import {Middleware} from "./services/Middleware";
import {PathsService} from "./services/PathsService";
import {ProfileService} from "./services/ProfileService";
import {TelemetryService} from "./services/reporter/TelemetryService";
import {createFileWithGivenPath} from "./services/Settings";
import {ZoweApi} from "./services/ZoweApi";
import {resolveSubroutineURI} from "./services/util/SubroutineUtils";
import {executeSmartTab} from "./commands/SmartTabCommand";

let zoweApi: ZoweApi;
let profileService: ProfileService;
let copybooksPathGenerator: CopybooksPathGenerator;
let copyBooksDownloader: CopybookDownloadService;
let pathsService: PathsService;
let middleware: Middleware;
let languageClientService: LanguageClientService;

function initialize() {
    // We need lazy initialization to be able to mock this for unit testing
    zoweApi = new ZoweApi();
    profileService = new ProfileService(zoweApi);
    copybooksPathGenerator = new CopybooksPathGenerator(profileService);
    copyBooksDownloader = new CopybookDownloadService(zoweApi, profileService, copybooksPathGenerator);
    pathsService = new PathsService();
    middleware = new Middleware(new CopybookURI(profileService), copyBooksDownloader);
    languageClientService = new LanguageClientService(middleware);
}

export async function activate(context: vscode.ExtensionContext) {
    initialize();
    TelemetryService.registerEvent("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");
    try {
        await languageClientService.checkPrerequisites();
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
        TelemetryService.registerExceptionEvent("RuntimeException", err.toString(), ["bootstrap", "experiment-tag"], "Client has wrong Java version installed");

        return;
    }

    copyBooksDownloader.start();

    // Listeners
    context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration(SETTINGS_CPY_SECTION) &&
            vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("profiles")) {
            profileService.updateStatusBar();
        }
    }));

    // Commands
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.fetch-copybook", (copybook, programName) => {
        fetchCopybookCommand(copybook, copyBooksDownloader, programName);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.change-default-zowe-profile", () => {
        changeDefaultZoweProfile(profileService);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.edit-dataset-paths", () => {
        editDatasetPaths(pathsService);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-lsp.cpy-manager.goto-settings", () => {
        gotoCopybookSettings();
    }));
    context.subscriptions.push(vscode.commands.registerCommand("tab", () => {
        executeSmartTab();
    }));

    // Custom client handlers
    languageClientService.addRequestHandler("cobol/resolveSubroutine", resolveSubroutineURI);

    context.subscriptions.push(languageClientService.start());

    // create .gitignore file within .c4z folder
    createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");

    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            {scheme: "file", language: LANGUAGE_ID},
            new CopybooksCodeActionProvider()));

    // 'export' public api-surface
    return {
        analysis(uri: string): Promise<AnalysisResult> {
            return languageClientService.retrieveAnalysis(uri);
        }
    };
}

export function deactivate() {
    return Promise.resolve(languageClientService.stop());
}
