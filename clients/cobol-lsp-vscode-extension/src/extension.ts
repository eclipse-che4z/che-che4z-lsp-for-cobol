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
import { SETTINGS_SECTION } from "./constants";
import { DEPENDENCIES_FOLDER } from "./constants";
import { CopybooksDownloader } from "./CopybooksDownloader";
import { CopybooksCodeActionProvider } from "./services/CopybooksCodeActionProvider";
import { ProfileService } from "./ProfileService";
import { LanguageClientService } from "./services/LanguageClientService";
import { ZoweApi } from "./ZoweApi";

export async function activate(context: vscode.ExtensionContext) {
    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(zoweApi, profileService);
    const languageClientService: LanguageClientService = new LanguageClientService();

    try {
        await languageClientService.checkPrerequisites();
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
        return;
    }

    copyBooksDownloader.start();

    // Listeners
    context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration(SETTINGS_SECTION + ".paths")) {
            copyBooksDownloader.redownloadDependencies("Configuration was updated");
        }
    }));

    // Commands
    context.subscriptions.push(vscode.commands.registerCommand("cobol-language-support.copybooks.redownload", () => {
        copyBooksDownloader.redownloadDependencies();
    }));


    context.subscriptions.push(languageClientService.start());
    context.subscriptions.push(initWorkspaceTracker(copyBooksDownloader));
    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: "COBOL" },
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
