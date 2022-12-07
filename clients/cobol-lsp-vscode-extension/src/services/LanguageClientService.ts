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
import * as os from "os";
import { join } from "path";
import * as vscode from "vscode";

import {
    ErrorCodes,
    Executable,
    LanguageClient,
    LanguageClientOptions,
    StreamInfo,
} from "vscode-languageclient";
import {GenericNotificationHandler, GenericRequestHandler} from "vscode-languageserver-protocol";
import {LANGUAGE_ID} from "../constants";
import {JavaCheck} from "./JavaCheck";
import {TelemetryService} from "./reporter/TelemetryService";
import { SettingsService } from "./Settings";

const extensionId = "BroadcomMFD.cobol-language-support";

export class LanguageClientService {
    private executablePath: string;
    private dialectsPath: string;
    private languageClient: LanguageClient;
    private handlers: Array<(languageClient: LanguageClient) => void> = [];
    private isNativeBuildEnabled: boolean = false;

    constructor(private outputChannel: vscode.OutputChannel) {
        const ext = vscode.extensions.getExtension(extensionId);
        this.executablePath = join(ext.extensionPath, "server", "jar", "server.jar");
        this.dialectsPath = join(ext.extensionPath, "server", "jar", "dialects");
    }

    public enableNativeBuild() {
        const ext = vscode.extensions.getExtension(extensionId);
        this.isNativeBuildEnabled = true;
        this.executablePath = this.initializeExecutables(`${ext.extensionPath}/server`);
        TelemetryService.registerEvent("Native Build enabled", ["COBOL", "native build enabled", "settings"],
            "Native build enabled");
    }

    public async checkPrerequisites(): Promise<void> {
        await new JavaCheck().isJavaInstalled();
        if (!SettingsService.getLspPort() && !fs.existsSync(this.executablePath)) {
            throw new Error("LSP server for " + LANGUAGE_ID + " not found");
        }
    }

    public addNotificationHandler(method: string, handler: GenericNotificationHandler): void {
        this.handlers.push(languageClient => languageClient.onNotification(method, handler));
    }

    public addRequestHandler<R, E>(method: string, handler: GenericRequestHandler<R, E>): void {
        this.handlers.push(languageClient => languageClient.onRequest(method, handler));
    }

    public async retrieveAnalysis(uri: string, text: string): Promise<any> {
        const languageClient = this.getLanguageClient();
        await languageClient.onReady();
        return languageClient.sendRequest("extended/analysis", { uri, text });
    }

    public start(): vscode.Disposable {
        this.initHandlers();
        return this.getLanguageClient().start();
    }

    public stop(): Thenable<void> {
        if (this.languageClient) {
            return Promise.resolve(this.getLanguageClient().stop());
        }
    }

    private initHandlers() {
        const languageClient = this.getLanguageClient();
        for (const handler of this.handlers) {
            languageClient.onReady().then(() => handler(languageClient));
        }
    }

    private getLanguageClient() {
        if (!this.languageClient) {
            this.languageClient = new LanguageClient(LANGUAGE_ID,
                "LSP extension for " + LANGUAGE_ID.toUpperCase() + " language",
                this.createServerOptions(this.executablePath),
                this.createClientOptions());
            // hack to prevent notification for cancelled request.
            (ErrorCodes as any).RequestCancelled = -32800;
        }
        return this.languageClient;
    }

    private createClientOptions(): LanguageClientOptions {
        return {
            documentSelector: [LANGUAGE_ID],
            outputChannel: this.outputChannel,
        };
    }

    private createServerOptions(jarPath: string) {
        if (this.isNativeBuildEnabled) {
            return nativeServer(jarPath);
        }
        const port = SettingsService.getLspPort();
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
            args: ["-Dline.separator=\r\n", "-Ddialect.path=" + this.dialectsPath, "-Xmx768M", "-jar", jarPath, "pipeEnabled"],
            command: "java",
            options: { detached: false },
        };
    }

    private initializeExecutables(serverPath: string) {
        let executablePath;
        switch (os.type()) {
            case "Windows_NT":
                executablePath = join(serverPath, "package-win");
                break;
            case "Darwin":
                executablePath = join(serverPath, "package-macos");
                break;
            case "Linux":
                executablePath = join(serverPath, "package-linux");
                break;
            default:
                break;
        }
        return executablePath;
    }
}
export function nativeServer(jarPath: string) {
    const executable: Executable = {
            args: ["pipeEnabled"],
            command: "",
            options: { detached: false },
        };
    switch (os.type()) {
            case "Windows_NT":
                executable.options.cwd = `${jarPath}`;
                executable.command = `engine.exe`;
                break;
            case "Darwin":
                executable.options.cwd = `${jarPath}`;
                executable.command = `./server-mac-amd64`;
                break;
            case "Linux":
                executable.options.cwd = `${jarPath}`;
                executable.command = `./server`;
                break;
            default:
                break;
        }
    return executable;
}
