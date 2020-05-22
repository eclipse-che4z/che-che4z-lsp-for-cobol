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
import * as path from "path";
import { changeDefaultZoweProfile } from "./commands/ChangeDefaultZoweProfile";
import { editDatasetPaths } from "./commands/EditDatasetPaths";
import { fetchCopybookCommand } from "./commands/FetchCopybookCommand";
import { C4Z_FOLDER, DEPENDENCIES_FOLDER, GITIGNORE_FILE, REASON_MSG } from "./constants";
import { LANGUAGE_ID, SETTINGS_SECTION } from "./constants";
import { CopybookFix } from "./services/CopybookFix";
import { CopybooksCodeActionProvider } from "./services/CopybooksCodeActionProvider";
import { CopybooksDownloader } from "./services/CopybooksDownloader";
import { CopybooksPathGenerator } from "./services/CopybooksPathGenerator";
import { initializeSettings, createFileWithGivenPath } from "./services/Settings";

import {resolveLocalCopybooksCommand} from "./commands/ResolveLocalCopybooksCommand";
import { LanguageClientService } from "./services/LanguageClientService";
import { PathsService } from "./services/PathsService";
import { ProfileService } from "./services/ProfileService";
import {CopybookResolver} from "./services/settings/CopybookResolver";
import {LocalCopybookResolver} from "./services/settings/LocalCopybookResolver";
import { ZoweApi } from "./services/ZoweApi";

export async function activate(context: vscode.ExtensionContext) {
    initializeSettings();

    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copybookFix: CopybookFix = new CopybookFix();
    const copybooksPathGenerator: CopybooksPathGenerator = new CopybooksPathGenerator(profileService);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(copybookFix, zoweApi, profileService, copybooksPathGenerator);
    const languageClientService: LanguageClientService = new LanguageClientService(copybooksPathGenerator);
    const pathsService: PathsService = new PathsService();
    const copybookResolver: CopybookResolver = new LocalCopybookResolver();

    try {
        await languageClientService.checkPrerequisites();
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
        return;
    }

    copyBooksDownloader.start();

    // Listeners
    context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration(SETTINGS_SECTION) &&
        vscode.workspace.getConfiguration(SETTINGS_SECTION).get("profiles")) {
            copyBooksDownloader.redownloadDependencies(REASON_MSG);
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

    //POC Command: Used just to quickly share the resolution - might be removed later on.
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.resolve-local-copybooks", () => {
        resolveLocalCopybooksCommand(copybookResolver);
    }));


    context.subscriptions.push(languageClientService.start());
    context.subscriptions.push(initWorkspaceWatcher(copyBooksDownloader));
    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new CopybooksCodeActionProvider(profileService)));
}

function initWorkspaceWatcher(downloader: CopybooksDownloader): vscode.Disposable {
    const watcher = vscode.workspace.createFileSystemWatcher("**/"
        + path.join(C4Z_FOLDER, DEPENDENCIES_FOLDER) + "/**/**.dep", false, false, true);
    watcher.onDidCreate(uri => downloader.downloadDependencies(uri,
        "Program contains dependencies to missing copybooks."));
    watcher.onDidChange(uri => downloader.downloadDependencies(uri));

    //create .gitignore file within .c4z folder
    createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");
    return watcher;
}
