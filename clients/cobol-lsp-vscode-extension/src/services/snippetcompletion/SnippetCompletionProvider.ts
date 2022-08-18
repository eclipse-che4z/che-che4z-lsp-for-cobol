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
import * as vscode from "vscode";
import { LANGUAGE_ID } from "../../constants";
import { SettingsService } from "../Settings";
export class SnippetCompletionProvider
    implements vscode.CompletionItemProvider
{
    private matchingWordsList: vscode.CompletionItem[] = new Array();
    private freshList: vscode.CompletionItem[] = new Array();

    public async provideCompletionItems(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.CompletionContext
    ): Promise<vscode.CompletionItem[]> {
        this.resetList();
        const textUptoCursor = getCurrentLineText(document, position);
        const wordsUptoCursor = fetchWordsList(textUptoCursor);
        if (textUptoCursor === "") {
            return fullList(position, document);
        }
        getSnippetsMapForUserDialect().forEach((value, key) => {
            const prefixList: string[] = fetchWordsList(value.prefix);
            const matchedWords = getMatchedWords(prefixList, wordsUptoCursor);
            if (matchedWords.length > 0) {
                this.matchingWordsList.push(
                    createCompletionItem(value, key, position, document)
                );
            } else {
                this.freshList.push(
                    createCompletionItem(value, key, position, document)
                );
            }
        });

        return this.matchingWordsList.length > 0
            ? this.matchingWordsList
            : this.freshList;
    }

    public resetList() {
        this.matchingWordsList = [];
        this.freshList = [];
    }
}
function createCompletionItem(
    value: any,
    key: string,
    position: vscode.Position,
    document?: vscode.TextDocument
): vscode.CompletionItem {
    const firstCharacterPosition = findPosition(position, document);
    const bodyDescription: string = value.description;
    const itemLabel: vscode.CompletionItemLabel = {
        description: key,
        label: value.prefix,
    };
    const completionItem = new vscode.CompletionItem(itemLabel);
    completionItem.detail = bodyDescription;
    completionItem.insertText = new vscode.SnippetString(value.body.join("\n"));
    completionItem.documentation = new vscode.MarkdownString().appendCodeblock(
        value.body.join("\n"),
        LANGUAGE_ID
    );
    completionItem.kind = vscode.CompletionItemKind.Snippet;
    const insertingRange = new vscode.Position(
        position.line,
        firstCharacterPosition
    );
    const replaceRange = new vscode.Position(position.line, position.character);
    completionItem.range = new vscode.Range(insertingRange, replaceRange);
    return completionItem;
}
function getSnippetsMapForUserDialect() {
    return SettingsService.getSnippetsForUserDialect();
}

function fetchWordsList(text: string) {
    const wordsList = text.split(/(\s+)/).filter(function (e) {
        return e.trim().length > 0;
    });
    return wordsList;
}

function getCurrentLineText(
    document: vscode.TextDocument,
    position: vscode.Position
) {
    return document.lineAt(position).text.slice(0, position.character).trim();
}

function fullList(
    position,
    document
): vscode.CompletionItem[] | PromiseLike<vscode.CompletionItem[]> {
    const list: vscode.CompletionItem[] = new Array();
    getSnippetsMapForUserDialect().forEach((value, key) => {
        list.push(createCompletionItem(value, key, position, document));
    });
    return list;
}

function findPosition(
    position: vscode.Position,
    document?: vscode.TextDocument
) {
    const lineText = document
        .lineAt(position)
        .text.slice(0, position.character);
    const charPosition: number = 7;
    for (let index: number = 0; index < lineText.length; index++) {
        if (lineText.charAt(index) !== " ") {
            return index;
        }
    }
    return charPosition;
}

function getMatchedWords(words1: string[], words2: string[]) {
    const word = words1.filter((word) => words2.includes(word));
    return word;
}

export function pickSnippet() {
    try {
        const editor = vscode.window.activeTextEditor;
        const snippetList = new Array();
        const mapKeyForSelectedSnippet = new Map<string, any>();
        const snippetMapsFromSettings = getSnippetsMapForUserDialect();
        const input = vscode.window.createQuickPick<vscode.QuickPickItem>();
        input.matchOnDetail = true;
        input.matchOnDescription = true;
        input.placeholder = "Type to search snippet";
        // Create the snippets list using settings for dialect
        snippetMapsFromSettings.forEach((value, key) => {
            // Also store the key as we are aligining the view with VSCode snippet
            mapKeyForSelectedSnippet.set(value.prefix, key);
            snippetList.push({
                detail: value.description,
                label: value.prefix,
            });
            input.items = snippetList;
        });
        input.onDidChangeSelection((items) => {
            const item = items[0];
            const getKey = mapKeyForSelectedSnippet.get(item.label);
            const snippetString = snippetMapsFromSettings.get(getKey);
            const snippet = new vscode.SnippetString(
                snippetString.body.join("\n")
            );
            editor.insertSnippet(snippet);
        });
        input.show();
    } catch (error) {
        console.log(error);
    }
}
