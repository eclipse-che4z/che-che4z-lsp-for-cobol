/*
 * Copyright (c) 2019 Broadcom.
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

import * as net from "net";
import { ExtensionContext, StatusBarAlignment, window } from "vscode";
import { LanguageClient, LanguageClientOptions, StreamInfo } from "vscode-languageclient/lib/main";

export function activate(context: ExtensionContext) {
    // connection with remote LS server
    const connectionInfo = {
        host: "localhost",
        port: 1044,
    };
    const serverOptions = () => {
        // Connect to language server via socket
        const socket = net.connect(connectionInfo);
        const result: StreamInfo = {
            reader: socket,
            writer: socket,
        };
        return Promise.resolve(result);
    };

    // Options to control the language client
    const clientOptions: LanguageClientOptions = {
        // Register the server for cobol
        documentSelector: ["COBOL"],
    };
    const item = window.createStatusBarItem(StatusBarAlignment.Right, Number.MIN_VALUE);

    // Create the language client and start the client.
    const languageClient = new LanguageClient("LSP", "LSP extension for Cobol language", serverOptions, clientOptions);

    const disposable = languageClient.start();

    context.subscriptions.push(disposable);
    item.text = "Language Server is active";
}
