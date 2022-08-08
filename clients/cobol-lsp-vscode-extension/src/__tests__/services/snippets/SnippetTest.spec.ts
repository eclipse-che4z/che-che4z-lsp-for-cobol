/*
 * Copyright (c) 2022 Broadcom.
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

// import { CompletionItem } from "vscode";
import * as vscode from "vscode";
import { SnippetCompletionProvider  } from "../../../services/snippetcompletion/SnippetCompletionProvider";

describe("Test CompletionProvider",() =>{
    const context = { triggerKind: {}, diagnostics: [], only: undefined };
    const snippetcompletion: SnippetCompletionProvider = new SnippetCompletionProvider();
    beforeAll(() => {
        (vscode.extensions as any) = {
            getExtension: jest.fn().mockReturnValue({
                extensionPath: "/test", packageJSON: {
                    version: 1,
                },
            }),
        };
    (vscode.CompletionItem as any) = jest.fn();
    (vscode.SnippetString as any) = jest.fn();
    (vscode.MarkdownString as any) = jest.fn().mockReturnValue({string: "",appendCodeblock: jest.fn().mockReturnValue({ value : "", language: "COBOL"}) });
    (vscode.CompletionItemKind as any) = jest.fn();
});
afterAll(() => {
    jest.clearAllMocks();
});

test("Suggest all DaCo Snippets", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: ""})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: line, character: character} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["DaCo"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(301);
})
test("Suggest all IDMS Snippets", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: ""})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: line, character: character} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["IDMS"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(232);
})
test("Suggest all Cobol only Snippets", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: ""})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: line, character: character} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue([""]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(222);
})

test("Suggest Snippets when both IDMS and DaCo is set", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: ""})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: line, character: character} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["DaCo","IDMS"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(311);
})

test(" Test number of suggestions for COPY when no dialect is selected", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: "COPY"})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: 0, character: 4} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue([""]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(1);
})

test(" Test number of suggestions for COPY when dialect is IDMS", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: "COPY"})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: 0, character: 4} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["IDMS"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(7);
})

test(" Test number of suggestions for WRITE when dialect is IDMS", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: "WRITE"})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: 0, character: 4} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["IDMS"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(1);
})

test(" Test number of suggestions for WRITE when dialect is Daco", async () => {
    const doc = { uri: { fsPath: "ws-path" }, fileName: "SNIPPET.cbl", lineAt: jest.fn().mockReturnValue({text: "WRITE"})} as any;
    const position = jest.fn().mockImplementation((line, character) => { return {line: 0, character: 4} });
    const token = { isCancellationRequested: false, onCancellationRequested: jest.fn() };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(["DaCo","IDMS"]),
    });
    expect((await snippetcompletion.provideCompletionItems(doc, position as any, token, context as any)).length).toBe(10);
})

})
