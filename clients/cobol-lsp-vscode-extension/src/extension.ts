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
import { C4Z_FOLDER, GITIGNORE_FILE} from "./constants";
import { LANGUAGE_ID, SETTINGS_SECTION } from "./constants";
import { CopybookFix } from "./services/CopybookFix";
import { CopybooksCodeActionProvider } from "./services/CopybooksCodeActionProvider";
import { CopybooksDownloader } from "./services/CopybooksDownloader";
import { CopybooksPathGenerator } from "./services/CopybooksPathGenerator";
import { initializeSettings, createFileWithGivenPath } from "./services/Settings";

import {CopybookURI} from "./services/CopybookURI";
import {LanguageClientService} from "./services/LanguageClientService";
import {Middleware} from "./services/Middleware";
import {PathsService} from "./services/PathsService";
import {ProfileService} from "./services/ProfileService";
import {ZoweApi} from "./services/ZoweApi";

export async function activate(context: vscode.ExtensionContext) {
    initializeSettings();

    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copybookFix: CopybookFix = new CopybookFix();
    const copybooksPathGenerator: CopybooksPathGenerator = new CopybooksPathGenerator(profileService);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(copybookFix, zoweApi, profileService, copybooksPathGenerator);
    const pathsService: PathsService = new PathsService();
    const copybookResolveURI: CopybookURI = new CopybookURI(profileService, copyBooksDownloader);
    const middleware: Middleware = new Middleware(copybooksPathGenerator, copybookResolveURI);
    const languageClientService: LanguageClientService = new LanguageClientService(middleware);

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
            profileService.updateStatusBar();
        }
    }));

    // Commands
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

    //create .gitignore file within .c4z folder
    createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");
    
    context.subscriptions.push(copyBooksDownloader);
    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            {scheme: "file", language: LANGUAGE_ID},
            new CopybooksCodeActionProvider(profileService)));
}
