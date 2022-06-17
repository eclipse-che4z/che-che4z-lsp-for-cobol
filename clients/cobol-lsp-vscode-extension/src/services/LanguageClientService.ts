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
import * as os from "os";
import * as vscode from "vscode";
import {
    ConfigurationParams,
    ConfigurationRequest,
    Executable,
    LanguageClient,
    LanguageClientOptions,
} from "vscode-languageclient";
import {ConfigurationWorkspaceMiddleware} from "vscode-languageclient/lib/configuration";
import {GenericNotificationHandler, GenericRequestHandler} from "vscode-languageserver-protocol";
import {LANGUAGE_ID} from "../constants";
import {JavaCheck} from "./JavaCheck";
import {Middleware} from "./Middleware";
import { SettingsService } from "./Settings";

export class LanguageClientService {
    private readonly jarPath: string;
    private languageClient: LanguageClient;
    private handlers: {(languageClient: LanguageClient): void}[] = [];

    constructor(private middleware: Middleware) {
        const ext = vscode.extensions.getExtension("BroadcomMFD.cobol-language-support");
        this.jarPath = `${ext.extensionPath}/server/server.exe`;
    }

    public async checkPrerequisites(): Promise<void> {
        await new JavaCheck().isJavaInstalled();
        if (!SettingsService.getLspPort() && !fs.existsSync(this.jarPath)) {
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

    private initHandlers() {
        const languageClient = this.getLanguageClient();
        for (let handler of this.handlers) {
            languageClient.onReady().then(() => handler(languageClient));
        }
    }

    public stop(): Thenable<void> {
        if (this.languageClient) {
            return Promise.resolve(this.getLanguageClient().stop());
        }
    }

    private getLanguageClient() {
        if (!this.languageClient) {
            this.languageClient = new LanguageClient(LANGUAGE_ID,
                "LSP extension for " + LANGUAGE_ID + " language",
                this.createServerOptions(this.jarPath),
                this.createClientOptions());
        }
        return this.languageClient;
    }

    private createClientOptions(): LanguageClientOptions {
        const signatureFunc: ConfigurationRequest.MiddlewareSignature = async (
            params: ConfigurationParams,
            token: vscode.CancellationToken,
            next: ConfigurationRequest.HandlerSignature) => {
            return await this.middleware.handleConfigurationRequest(params, token, next);
        };
        const configurationMiddleware: ConfigurationWorkspaceMiddleware = {
            configuration: signatureFunc,
        };

        return {
            documentSelector: [LANGUAGE_ID],
            middleware: {workspace: configurationMiddleware},
        };
    }

    private createServerOptions(jarPath: string) {
        const executable: Executable = {
            args: ["pipeEnabled"],
            command: "",
            options: { stdio: "pipe", detached: false },
        };
        switch (os.type()) {
            case "Windows_NT":
                executable.command = jarPath;
                break;
            case "Darwin":
                executable.command = jarPath;
                break;
            case "Linux":
                executable.command = jarPath;
                break;
            default:
                break;
        }
        return executable;
        // const port = SettingsService.getLspPort();
        // if (port) {
        //     // Connect to language server via socket
        //     const connectionInfo = {
        //         host: "localhost",
        //         port,
        //     };
        //     return () => {
        //         const socket = net.connect(connectionInfo);
        //         const result: StreamInfo = {
        //             reader: socket,
        //             writer: socket,
        //         };
        //         return Promise.resolve(result);
        //     };
        // }
        // return {
        //     args: ["-Dline.separator=\r\n", "-Xmx768M", "-jar", jarPath, "pipeEnabled"],
        //     command: "java",
        //     options: {stdio: "pipe", detached: false},
        // };
    }
}
