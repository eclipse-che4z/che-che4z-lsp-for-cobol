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
import { changeDefaultZoweProfile } from "./commands/ChangeDefaultZoweProfile";
import { editDatasetPaths } from "./commands/EditDatasetPaths";
import { fetchCopybookCommand } from "./commands/FetchCopybookCommand";
import { DEPENDENCIES_FOLDER } from "./constants";
import { LANGUAGE_ID, SETTINGS_SECTION } from "./constants";
import { CopybookFix } from "./services/CopybookFix";
import { CopybooksCodeActionProvider } from "./services/CopybooksCodeActionProvider";
import { CopybooksDownloader } from "./services/CopybooksDownloader";
import { CopybooksPathGenerator } from "./services/CopybooksPathGenerator";

import { LanguageClientService } from "./services/LanguageClientService";
import { PathsService } from "./services/PathsService";
import { ProfileService } from "./services/ProfileService";
import { ZoweApi } from "./services/ZoweApi";

export async function activate(context: vscode.ExtensionContext) {
    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copybookFix: CopybookFix = new CopybookFix();
    const copybooksPathGenerator: CopybooksPathGenerator = new CopybooksPathGenerator(profileService);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(copybookFix, zoweApi, profileService, copybooksPathGenerator);
    const languageClientService: LanguageClientService = new LanguageClientService(copybooksPathGenerator);
    const pathsService: PathsService = new PathsService();

    try {
        await languageClientService.checkPrerequisites();
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
        return;
    }

    copyBooksDownloader.start();

    // Listeners
    context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration(SETTINGS_SECTION)) {
            copyBooksDownloader.redownloadDependencies("Configuration was updated");
            profileService.updateStatusBar();
        }
    }));

    // Commands
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.redownload", () => {
        copyBooksDownloader.redownloadDependencies();
    }));
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.fetch-copybook", (copybook, programName) => {
        fetchCopybookCommand(copybook, copyBooksDownloader, programName);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.change-default-zowe-profile", () => {
        changeDefaultZoweProfile(profileService);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.edit-dataset-paths", () => {
        editDatasetPaths(pathsService);
    }));


    context.subscriptions.push(languageClientService.start());
    context.subscriptions.push(initWorkspaceTracker(copyBooksDownloader));
    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new CopybooksCodeActionProvider()));
}

function initWorkspaceTracker(downloader: CopybooksDownloader): vscode.Disposable {
    const watcher = vscode.workspace.createFileSystemWatcher("**/"
        + DEPENDENCIES_FOLDER + "/**/**.dep", false, false, true);
    watcher.onDidCreate(uri => downloader.downloadDependencies(uri,
        "Program contains dependencies to missing copybooks."));
    watcher.onDidChange(uri => downloader.downloadDependencies(uri));
    return watcher;
}
