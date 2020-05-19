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
import { LANGUAGE_ID } from "../constants";
import {CancellationToken, ConfigurationParams, ConfigurationRequest, LanguageClient, LanguageClientOptions, StreamInfo} from "vscode-languageclient";
import { ConfigurationWorkspaceMiddleware } from "vscode-languageclient/lib/configuration";
import { CopybooksPathGenerator } from "./CopybooksPathGenerator";
import { JavaCheck } from "./JavaCheck";

export class LanguageClientService {
    private jarPath: string;

    constructor(private copybooksPathGenerator: CopybooksPathGenerator) {
        const ext = vscode.extensions.getExtension("BroadcomMFD.cobol-language-support");
        this.jarPath = `${ext.extensionPath}/server/lsp-service-cobol-${ext.packageJSON.version}.jar`;
    }
    async checkPrerequisites(): Promise<void> {
        await new JavaCheck().isJavaInstalled();
        if (!this.getLspPort() && !fs.existsSync(this.jarPath)) {
            throw new Error("LSP server for " + LANGUAGE_ID + " not found");
        }
    }
    start(): vscode.Disposable {
        const languageClient = new LanguageClient(LANGUAGE_ID,
            "LSP extension for " + LANGUAGE_ID + " language",
            this.createServerOptions(this.jarPath),
            this.createClientOptions());
        return languageClient.start();
    }

    private getLspPort(): number | undefined {
        return +vscode.workspace.getConfiguration().get("broadcom-cobol-lsp.server.port");
    }

    private createClientOptions(): LanguageClientOptions {
        const signatureFunc: ConfigurationRequest.MiddlewareSignature = async (
            params: ConfigurationParams,
            token: CancellationToken,
            next: ConfigurationRequest.HandlerSignature) => {

            if (params.items.length === 1) {
                const section = params.items[0].section;
                if (section.startsWith("broadcom-cobol-lsp.cpy-manager")) {
                    return (await this.copybooksPathGenerator.listUris()).map(uri => uri.toString());
                }
                if (section.startsWith("broadcom-cobol-lsp.theParam")) {
                    return ["foobar"];
                }
            }
            return next(params, token);
        };
        const configurationMiddleware: ConfigurationWorkspaceMiddleware = {
            configuration: signatureFunc,
        };

        return {
            documentSelector: [LANGUAGE_ID],
            middleware: { workspace: configurationMiddleware }
        };
    }
    private createServerOptions(jarPath: string) {
        const port = this.getLspPort();
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
}
