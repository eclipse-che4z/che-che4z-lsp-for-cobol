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
import { DialectRegistry } from "../DialectRegistry";
import { SettingsService } from "../Settings";
import { readFileSync } from "node:fs";

export interface Snippet {
  prefix: string | string[];
  body: string | string[];
  description?: string;
}

const SNIPPETS: Map<string, Map<string, Snippet>> = new Map();

export class SnippetCompletionProvider
  implements vscode.CompletionItemProvider
{
  private matchingWordsList: vscode.CompletionItem[] = [];
  private otherList: vscode.CompletionItem[] = [];

  public async provideCompletionItems(
    document: vscode.TextDocument,
    position: vscode.Position,
    _token: vscode.CancellationToken,
    _context: vscode.CompletionContext,
  ): Promise<vscode.CompletionItem[]> {
    const textUptoCursor = getCurrentLineText(document, position);
    const wordsUptoCursor = fetchWordsList(textUptoCursor);

    this.resetList();
    const snippets = await getSnippets();
    snippets.forEach((value, key) => {
      const prefixList: string[] = fetchWordsList(value.prefix);
      const matchedWords = getMatchedWords(prefixList, wordsUptoCursor);
      const completionItem = createCompletionItem(
        value,
        key,
        position,
        document,
      );
      if (matchedWords.length > 0) {
        this.matchingWordsList.push(completionItem);
      } else {
        this.otherList.push(completionItem);
      }
    });
    return this.matchingWordsList.length > 0
      ? this.matchingWordsList
      : this.otherList;
  }
  public resetList() {
    this.matchingWordsList = [];
    this.otherList = [];
  }
}

async function getSnippets() {
  const map = await SettingsService.getSnippetsForCobol();
  const dialectList = SettingsService.getDialects()!;
  const registeredDialects = DialectRegistry.getDialects();
  registeredDialects
    .filter((d) => dialectList.includes(d.name))
    .forEach((d) => {
      const snippets = importSnippet(d.snippetPath);
      if (snippets) {
        Object.entries(snippets).forEach((value) =>
          map.set(value[0], value[1]),
        );
      }
    });

  return map;
}

function importSnippet(snippetPath: string) {
  let result = SNIPPETS.get(snippetPath);
  if (!result) {
    try {
      const json = readFileSync(snippetPath, "utf-8");
      const snippet = JSON.parse(json);
      SNIPPETS.set(snippetPath, snippet);
      result = snippet;
    } catch (e) {
      console.log(e);
    }
  }
  return result;
}

function createCompletionItem(
  value: any,
  key: string,
  position: vscode.Position,
  document: vscode.TextDocument,
): vscode.CompletionItem {
  const itemLabel: vscode.CompletionItemLabel = {
    label: value.prefix,
    description: key,
  };
  const completionItem = new vscode.CompletionItem(itemLabel);
  completionItem.detail = value.description;
  completionItem.insertText = new vscode.SnippetString(value.body.join("\n"));
  completionItem.documentation = new vscode.MarkdownString().appendCodeblock(
    formatString(value.body.join("\n")),
    LANGUAGE_ID,
  );
  completionItem.kind = vscode.CompletionItemKind.Snippet;
  //Find the start position of the first word in the line
  const firstCharacterPosition = findPosition(position, document);
  const insertingRange = new vscode.Position(
    position.line,
    firstCharacterPosition,
  );
  const replaceRange = new vscode.Position(position.line, position.character);
  completionItem.range = new vscode.Range(insertingRange, replaceRange);
  return completionItem;
}

function fetchWordsList(text: string | string[]) {
  const wordsList: string[] = [];
  let texts: string[];
  if (Array.isArray(text)) {
    texts = text;
  } else {
    texts = [text];
  }
  texts.forEach((text) => {
    wordsList.push(
      ...text.split(/(\s+)/).filter(function (e) {
        return e.trim().length > 0;
      }),
    );
  });

  return wordsList;
}

function getCurrentLineText(
  document: vscode.TextDocument,
  position: vscode.Position,
) {
  return document.lineAt(position).text.slice(0, position.character).trim();
}

function findPosition(
  position: vscode.Position,
  document: vscode.TextDocument,
) {
  const lineText = document.lineAt(position).text.slice(0, position.character);
  const charPosition: number = 7;
  for (let index: number = 0; index < lineText.length; index++) {
    if (lineText.charAt(index) !== " ") return index;
  }
  return charPosition;
}

function getMatchedWords(words1: string[], words2: string[]) {
  const word = words1.filter((word) => words2.includes(word));
  return word;
}

function formatString(arg: string) {
  return arg.replace(/(\$\{*\d*\/*:*|\/\(.*\)|\\\.\.\+|\$\/|\})/g, "");
}

export async function pickSnippet() {
  try {
    const editor = vscode.window.activeTextEditor;
    const snippetList: vscode.QuickPickItem[] = [];
    const prefixToKeyMap = new Map<string, string>();
    const snippets = await getSnippets();
    const input = vscode.window.createQuickPick<vscode.QuickPickItem>();
    input.matchOnDetail = true;
    input.matchOnDescription = true;
    input.placeholder = "Type to search snippet";
    // Create the snippets list using settings for dialect
    snippets.forEach((snippet, key) => {
      let prefixes: string[];
      if (Array.isArray(snippet.prefix)) {
        prefixes = snippet.prefix;
      } else {
        prefixes = [snippet.prefix];
      }

      for (const prefix in prefixes) {
        // Also store the key as we are aligning the view with VSCode snippet
        prefixToKeyMap.set(prefix, key);
        snippetList.push({
          detail: snippet.description,
          label: prefix,
        });
      }

      input.items = snippetList;
    });
    input.onDidChangeSelection((items) => {
      const item = items[0];
      const getKey = prefixToKeyMap.get(item.label);
      if (getKey) {
        const snippetString = snippets.get(getKey);
        const snippet = new vscode.SnippetString(
          Array.isArray(snippetString?.body)
            ? snippetString?.body.join("\n")
            : snippetString?.body,
        );
        editor?.insertSnippet(snippet);
      }
    });
    input.show();
  } catch (error) {
    console.log(error);
  }
}
