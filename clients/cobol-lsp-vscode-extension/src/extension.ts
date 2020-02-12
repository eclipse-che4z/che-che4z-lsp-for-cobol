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

import * as cp from "child_process";
import * as fs from "fs";
import { Disposable, ExtensionContext, extensions, window, workspace } from "vscode";
import {
    LanguageClient,
    LanguageClientOptions,
} from "vscode-languageclient/lib/main";
import { CopybooksDownloader, DEPENDENCIES_FOLDER } from "./CopybooksDownloader";
import { DefaultJavaVersionCheck } from "./JavaVersionCheck";
import { ProfileService } from "./ProfileService";
import { ZoweApi } from "./ZoweApi";

export async function activate(context: ExtensionContext) {
    const zoweApi: ZoweApi = new ZoweApi();
    const profileService: ProfileService = new ProfileService(zoweApi);
    const copyBooksDownloader: CopybooksDownloader = new CopybooksDownloader(zoweApi, profileService);
    // path resolved to identify the location of the LSP server into the extension
    const extPath = extensions.getExtension("BroadcomMFD.cobol-language-support").extensionPath;
    const LSPServerPath = `${extPath}/server/lsp-service-cobol-0.10.0.jar`;

    try {
        await isJavaInstalled();
        if (!fs.existsSync(LSPServerPath)) {
            window.showErrorMessage("COBOL extension failed to start - LSP server not found");
            return;
        }
    } catch (err) {
        window.showErrorMessage(err.toString());
        return;
    }

    // Options to control the language client
    const clientOptions: LanguageClientOptions = {
        // Register the server for COBOL
        documentSelector: ["COBOL"],
    };

    // Create the language client and start the client.
    const languageClient = new LanguageClient("COBOL", "LSP extension for COBOL language",
        createServerOptions(LSPServerPath),
        clientOptions);
    context.subscriptions.push(languageClient.start());
    context.subscriptions.push(initWorkspaceTracker(copyBooksDownloader));
}

function initWorkspaceTracker(downloader: CopybooksDownloader): Disposable {
    const watcher = workspace.createFileSystemWatcher("**/" + DEPENDENCIES_FOLDER + "/**/**.dep", false, false, true);
    watcher.onDidCreate(uri => downloader.downloadDependencies(uri));
    watcher.onDidChange(uri => downloader.downloadDependencies(uri));
    return watcher;
}

async function isJavaInstalled() {
    return new Promise<any>((resolve, reject) => {
        const ls = cp.spawn("java", ["-version"]);
        ls.stderr.on("data", (data: any) => {
            const javaCheck = new DefaultJavaVersionCheck();
            if (!javaCheck.isJavaVersionSupported(data.toString())) {
                reject("Java version 8 expected");
            }
            resolve();
        });
        ls.on("error", (code: any) => {
            if ("Error: spawn java ENOENT" === code.toString()) {
                reject("Java 8 is not found");
            }
            reject(code);
        });
        ls.on("close", (code: number) => {
            if (code !== 0) {
                reject("An error occurred when checking if Java was installed");
            }
        });
    });
}

function createServerOptions(jarPath: string) {
    return {
        args: ["-Dline.separator=\r\n", "-jar", jarPath, "pipeEnabled"],
        command: "java",
        options: { stdio: "pipe", detached: false },
    };
}
