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
import {DEPENDENCIES_FOLDER, PATHS_LOCAL_KEY, PATHS_ZOWE, REASON_MSG} from "./constants";
import { LANGUAGE_ID, SETTINGS_SECTION} from "./constants";
import { CopybookFix } from "./services/CopybookFix";
import { CopybooksCodeActionProvider } from "./services/CopybooksCodeActionProvider";
import { CopybooksDownloader } from "./services/CopybooksDownloader";
import { CopybooksPathGenerator } from "./services/CopybooksPathGenerator";
import { initializeSettings } from "./services/Settings";

import {resolveLocalCopybooksCommand} from "./commands/ResolveLocalCopybooksCommand";
import { LanguageClientService } from "./services/LanguageClientService";
import { PathsService } from "./services/PathsService";
import { ProfileService } from "./services/ProfileService";
import {CopybookResolver} from "./services/settings/CopybookResolver";
import {LocalCopybookResolver} from "./services/settings/LocalCopybookResolver";
import { ZoweApi } from "./services/ZoweApi";
import { Prioritizer } from "./services/Prioritizer";
import {CopybookResolveURI} from "./services/CopybookResolveURI";

export async function activate(context: vscode.ExtensionContext) {
    initializeSettings();

    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copybookFix: CopybookFix = new CopybookFix();
    const prioritizer: Prioritizer = new Prioritizer();
    const copybooksPathGenerator: CopybooksPathGenerator = new CopybooksPathGenerator(profileService);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(copybookFix, zoweApi, profileService, copybooksPathGenerator, prioritizer);
    const languageClientService: LanguageClientService = new LanguageClientService(copybooksPathGenerator, prioritizer);
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

    //TODO: remove it
    // context.subscriptions.push
    // (vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.resolve-git-copybooks", () => {
    //     vscode.workspace.getConfiguration(SETTINGS_SECTION).update(PATHS_LOCAL_KEY,"MAMMT",vscode.ConfigurationTarget.Global);
    //     console.log("I updated the settings..");
    //     // prioritizer.checkCopybooksPresentLocal(["DEMO1", "DEMO2"],
    //     //      vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));
    // }));

    // context.subscriptions.push
    // (vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.resolve-git-copybooks-2", () => {
    //     let copybookResolverURI:CopybookResolveURI  = new CopybookResolveURI();
    //     //should come from depfile...
    //     console.log("found it locally");
    //     vscode.window.showInformationMessage(copybookResolverURI.generateConfigurationForCopybook("SLICKM0"));
    // }));


    //TODO: remove it
    context.subscriptions.push(vscode.commands.registerCommand("broadcom-cobol-lsp.cpy-manager.resolve-local-copybooks", () => {
        resolveLocalCopybooksCommand(copybookResolver);
    }));


    context.subscriptions.push(languageClientService.start());
    context.subscriptions.push(initWorkspaceTracker(copyBooksDownloader));
    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: LANGUAGE_ID },
            new CopybooksCodeActionProvider(profileService)));
}

function initWorkspaceTracker(downloader: CopybooksDownloader): vscode.Disposable {
    const watcher = vscode.workspace.createFileSystemWatcher("**/"
        + DEPENDENCIES_FOLDER + "/**/**.dep", false, false, true);

    const copybookResolveURI: CopybookResolveURI = new CopybookResolveURI();



    //instead of invoking zowe we have to invoke the prioritizer
    watcher.onDidCreate(uri => copybookResolveURI.resolveCopybooksInDepFile(uri),  "Program contains dependencies to resolve.");
    watcher.onDidChange(uri => copybookResolveURI.resolveCopybooksInDepFile(uri));


    // watcher.onDidCreate(uri => downloader.downloadDependencies(uri,
    //     "Program contains dependencies to missing copybooks."));
    // watcher.onDidChange(uri => downloader.downloadDependencies(uri));
    return watcher;
}
