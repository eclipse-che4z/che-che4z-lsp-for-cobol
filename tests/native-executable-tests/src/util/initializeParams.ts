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

import { InitializeParams } from "vscode-languageserver-protocol";
import { getRootUri } from "./util";

export const getInitializeParams = (rootPath: string, name: string): InitializeParams => {
    let rootUri = getRootUri(rootPath);
    return {
        processId: 1,
        rootPath,
        rootUri,
        capabilities: {
            workspace: {
                applyEdit: true,
                workspaceEdit: {
                    documentChanges: true,
                    resourceOperations: ["create", "rename", "delete"],
                    failureHandling: "textOnlyTransactional",
                },
                didChangeConfiguration: {
                    dynamicRegistration: true,
                },
                didChangeWatchedFiles: {
                    dynamicRegistration: true,
                },
                symbol: {
                    dynamicRegistration: true,
                    symbolKind: {
                        valueSet: [
                            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                            19, 20, 21, 22, 23, 24, 25, 26,
                        ],
                    },
                },
                executeCommand: {
                    dynamicRegistration: true,
                },
                configuration: true,
                workspaceFolders: true,
            },
            textDocument: {
                publishDiagnostics: {
                    relatedInformation: true,
                },
                synchronization: {
                    dynamicRegistration: true,
                    willSave: true,
                    willSaveWaitUntil: true,
                    didSave: true,
                },
                completion: {
                    dynamicRegistration: true,
                    contextSupport: true,
                    completionItem: {
                        snippetSupport: true,
                        commitCharactersSupport: true,
                        documentationFormat: ["markdown", "plaintext"],
                        deprecatedSupport: true,
                        preselectSupport: true,
                    },
                    completionItemKind: {
                        valueSet: [
                            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                            19, 20, 21, 22, 23, 24, 25,
                        ],
                    },
                },
                hover: {
                    dynamicRegistration: true,
                    contentFormat: ["markdown", "plaintext"],
                },
                signatureHelp: {
                    dynamicRegistration: true,
                    signatureInformation: {
                        documentationFormat: ["markdown", "plaintext"],
                        parameterInformation: {
                            labelOffsetSupport: true,
                        },
                    },
                },
                definition: {
                    dynamicRegistration: true,
                    linkSupport: true,
                },
                references: {
                    dynamicRegistration: true,
                },
                documentHighlight: {
                    dynamicRegistration: true,
                },
                documentSymbol: {
                    dynamicRegistration: true,
                    symbolKind: {
                        valueSet: [
                            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                            19, 20, 21, 22, 23, 24, 25, 26,
                        ],
                    },
                    hierarchicalDocumentSymbolSupport: true,
                },
                codeAction: {
                    dynamicRegistration: true,
                    codeActionLiteralSupport: {
                        codeActionKind: {
                            valueSet: [
                                "",
                                "quickfix",
                                "refactor",
                                "refactor.extract",
                                "refactor.inline",
                                "refactor.rewrite",
                                "source",
                                "source.organizeImports",
                            ],
                        },
                    },
                },
                codeLens: {
                    dynamicRegistration: true,
                },
                formatting: {
                    dynamicRegistration: true,
                },
                rangeFormatting: {
                    dynamicRegistration: true,
                },
                onTypeFormatting: {
                    dynamicRegistration: true,
                },
                rename: {
                    dynamicRegistration: true,
                    prepareSupport: true,
                },
                documentLink: {
                    dynamicRegistration: true,
                },
                typeDefinition: {
                    dynamicRegistration: true,
                    linkSupport: true,
                },
                implementation: {
                    dynamicRegistration: true,
                    linkSupport: true,
                },
                colorProvider: {
                    dynamicRegistration: true,
                },
                foldingRange: {
                    dynamicRegistration: true,
                    rangeLimit: 5000,
                    lineFoldingOnly: true,
                },
                declaration: {
                    dynamicRegistration: true,
                    linkSupport: true,
                },
            },
        },
        // "trace": "verbose",
        workspaceFolders: [
            {
                uri: rootUri,
                name: name,
            },
        ],
    }
};
