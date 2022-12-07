/**
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/

 * SPDX-License-Identifier: EPL-2.0

 * Contributors:
 *  Broadcom, Inc. - initial API and implementation
 */

import { ServerLaucher } from "./serverLaucher";
import * as fs from "fs";
import { ConsoleLogger } from "./util/consoleLogger";
import {
    ConfigurationRequest,
    createProtocolConnection, DidCloseTextDocumentNotification,
    DidOpenTextDocumentNotification,
    DocumentDiagnosticRequest, DocumentSymbolRequest,
    ExitNotification,
    InitializedNotification,
    InitializeRequest,
    ProtocolConnection,
    PublishDiagnosticsNotification,
    RegistrationRequest,
    ShutdownRequest,
    WorkspaceFoldersRequest
} from "vscode-languageserver-protocol";
import { ShowMessageNotification } from "vscode-languageserver-protocol/lib/common/protocol";
import { ClientConfiguration } from "./clientConfiguration";
import { getCopybooks, getRootUri } from "./util/util";
import { getInitializeParams } from "./util/initializeParams";
import * as path from "path";
import {DocumentDiagnosticReport} from "vscode-languageserver-protocol/lib/common/protocol.diagnostic";
import {StreamMessageReader, StreamMessageWriter} from "vscode-languageserver-protocol/node";

export class Server {
    private readonly rootPath: string;
    private readonly name: string;
    private readonly configLoc: string;
    private port: number | undefined;
    private reader:  StreamMessageReader | null = null;
    private writer: StreamMessageWriter | null = null;
    private logger: ConsoleLogger;

    constructor(rootPath: string, name: string, configLoc: string, port?: number) {
        this.rootPath = rootPath;
        this.name = name;
        this.configLoc = configLoc;
        this.port = port;
        this.logger = new ConsoleLogger();
    }

    public async launchServer() {
        const serverLaucher = new ServerLaucher();
        const { reader, writer } = await serverLaucher.createSocketMessageTransporter(this.logger, this.port);
        this.reader =  reader;
        this.writer = writer;
    }

    public async establishLSProtocolConnection() {
        if(!this.reader && !this.writer) {
            this.logger.log("=== Server Not Launched Yet !. Call launchServer() first. ===");
        }
        const serverConnection = createProtocolConnection(this.reader!, this.writer!, this.logger);
        serverConnection.listen();
        this.registerClientResponseToServer(serverConnection);
        await this.handshake(serverConnection);
        return serverConnection;
    }

    private registerClientResponseToServer(serverConnection: ProtocolConnection) {
        const clientConfiguration = new ClientConfiguration(this.configLoc);
        const copybooks = getCopybooks(clientConfiguration);
        serverConnection.onRequest(PublishDiagnosticsNotification.type, _params => {});
        serverConnection.onNotification(ShowMessageNotification.type, (_param) => {});
        serverConnection.onRequest(ConfigurationRequest.type, (params, _token) => {
            return params.items.map((item) =>
                clientConfiguration.getConfiguration(item.section!.toString())
            );
        });
        serverConnection.onNotification(ShowMessageNotification.type, (_params) => {});
        serverConnection.onNotification(PublishDiagnosticsNotification.type, _params => {});
        serverConnection.onRequest(RegistrationRequest.type, _params => {
            return;
        });
        serverConnection.onRequest(WorkspaceFoldersRequest.type, () => {
            return [
                {
                    uri: getRootUri(this.rootPath),
                    name: this.name,
                },
            ];
        });

        serverConnection.onRequest("copybook/resolve", (cobolFilename, copybookName, _dialectType) => {
            //TODO  Handle dialects
            return copybooks.find(t => t.includes(copybookName));
        });

        serverConnection.onRequest("cobol/resolveSubroutine", _params => { });

    }

    public async shutdownServer(serverConnection: ProtocolConnection) {
        await serverConnection.sendRequest(ShutdownRequest.type, undefined);
        await serverConnection.sendNotification(ExitNotification.type);
        serverConnection.end();
        serverConnection.dispose();
    }

    private async handshake(serverConnection: ProtocolConnection) {
        await serverConnection.sendRequest(
            InitializeRequest.type,
            getInitializeParams(this.rootPath, this.name)
        );
        await serverConnection.sendNotification(InitializedNotification.type, {});
    }

    public async openDocument(serverConnection: ProtocolConnection,  ...programRelativePath: string[]) {
        const docPath = path.join(this.rootPath, ...programRelativePath);
        const documentText = fs.readFileSync(docPath);
        await serverConnection.sendNotification(
            DidOpenTextDocumentNotification.type,
            {
                textDocument: {
                    uri: getRootUri(docPath),
                    languageId: "cobol",
                    version: 1,
                    text: documentText.toString("utf-8"),
                }
            }
        );
    }

    public async getDocumentSymbol(serverConnection: ProtocolConnection, ...programRelativePath: string[]) {
        await serverConnection.sendRequest(DocumentSymbolRequest.type, {
            textDocument: {
                uri: getRootUri(this.rootPath, ...programRelativePath),
            },
        }) ;
    }

    public async getDocumentDiagnostics(serverConnection: ProtocolConnection, ...programRelativePath: string[]){
      const uri = getRootUri(this.rootPath, ...programRelativePath);
      return  await serverConnection.sendRequest(DocumentDiagnosticRequest.type, {
            textDocument: {
                uri,
            }
        }) as DocumentDiagnosticReport;
    }

    public async closeDocument(serverConnection: ProtocolConnection, ...programRelativePath: string[]){
        const uri = getRootUri(this.rootPath, ...programRelativePath);
        return  await serverConnection.sendNotification(DidCloseTextDocumentNotification.type, {
            textDocument: {
                uri,
            },
        }) ;
    }
}
