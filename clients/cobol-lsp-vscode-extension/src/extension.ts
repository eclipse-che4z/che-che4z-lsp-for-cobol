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

import * as fs from "fs";
import * as net from "net";
import * as vscode from "vscode";
import {
    Disposable,
    LanguageClient,
    LanguageClientOptions,
    StreamInfo,
} from "vscode-languageclient/lib/main";
import { SETTINGS_SECTION } from "./constants";
import { DEPENDENCIES_FOLDER } from "./constants";
import { CopybooksDownloader } from "./CopybooksDownloader";
import { CopybooksDownloaderCodeActionProvider } from "./CopybooksDownloaderCodeActionProvider";
import { ProfileService } from "./ProfileService";
import { JavaCheck } from "./services/JavaCheck";
import { ZoweApi } from "./ZoweApi";

export async function activate(context: vscode.ExtensionContext) {
    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(zoweApi, profileService);
    const ext = vscode.extensions.getExtension("BroadcomMFD.cobol-language-support");
    const LSPServerPath = `${ext.extensionPath}/server/lsp-service-cobol-${ext.packageJSON.version}.jar`;

    try {
        await new JavaCheck().isJavaInstalled();
        if (!getLspPort() && !fs.existsSync(LSPServerPath)) {
            vscode.window.showErrorMessage("COBOL extension failed to start - LSP server not found");
            return;
        }
    } catch (err) {
        vscode.window.showErrorMessage(err.toString());
        return;
    }

    copyBooksDownloader.start();
    // Options to control the language client
    const clientOptions: LanguageClientOptions = {
        // Register the server for COBOL
        documentSelector: ["COBOL"],
    };

    // Create the language client and start the client.
    const languageClient = new LanguageClient("COBOL", "LSP extension for COBOL language",
        createServerOptions(LSPServerPath), clientOptions);

    context.subscriptions.push(vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration(SETTINGS_SECTION + ".paths")) {
            copyBooksDownloader.redownloadDependencies("Configuration was updated");
        }
    }));
    context.subscriptions.push(vscode.commands.registerCommand("cobol-language-support.copybooks.redownload", () => {
        copyBooksDownloader.redownloadDependencies();
    }));
    context.subscriptions.push(languageClient.start());
    context.subscriptions.push(initWorkspaceTracker(copyBooksDownloader));
    context.subscriptions.push(copyBooksDownloader);

    context.subscriptions.push(
        vscode.languages.registerCodeActionsProvider(
            { scheme: "file", language: "COBOL" },
            new CopybooksDownloaderCodeActionProvider()));
}

function initWorkspaceTracker(downloader: CopybooksDownloader): Disposable {
    const watcher = vscode.workspace.createFileSystemWatcher("**/"
        + DEPENDENCIES_FOLDER + "/**/**.dep", false, false, true);
    watcher.onDidCreate(uri => downloader.downloadDependencies(uri,
        "Program contains dependencies to missing copybooks."));
    watcher.onDidChange(uri => downloader.downloadDependencies(uri));
    return watcher;
}

function getLspPort(): number | undefined {
    return +vscode.workspace.getConfiguration().get("broadcom-cobol-lsp.server.port");
}

function createServerOptions(jarPath: string) {
    const port = getLspPort();
    if (port) {
        // Connect to language server via socket
        const connectionInfo = {
            host: "localhost",
            port,
        };
        return () => {
            const socket = net.connect(connectionInfo);
            const result: StreamInfo = {
                reader: socket,
                writer: socket,
            };
            return Promise.resolve(result);
        };
    }
    return {
        args: ["-Dline.separator=\r\n", "-Xmx768M", "-jar", jarPath, "pipeEnabled"],
        command: "java",
        options: { stdio: "pipe", detached: false },
    };
}
