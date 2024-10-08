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
import { readFile } from "node:fs/promises";
import cobolSnippets = require("./cobolSnippets.json");
import * as t from "io-ts";
import { isRight } from "fp-ts/Either";

const SnippetCodec = t.type({
  prefix: t.string,
  body: t.array(t.string),
  description: t.union([t.string, t.undefined]),
});
type Snippet = t.TypeOf<typeof SnippetCodec>;

const SnippetRecordCodec = t.record(t.string, SnippetCodec);

const predefinedSnippets: Record<string, Snippet> = cobolSnippets;
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
  const map = new Map(Object.entries(predefinedSnippets));
  const dialectList = SettingsService.getDialects()!;
  const registeredDialects = DialectRegistry.getDialects();
  const activeDialects = registeredDialects.filter((d) =>
    dialectList.includes(d.name),
  );

  await Promise.all(
    activeDialects.map(async (d) => {
      const snippets = await importSnippet(d.snippetPath);
      if (snippets) {
        snippets.forEach((snippet, key) => {
          map.set(key, snippet);
        });
        Object.entries(snippets).forEach((value) =>
          map.set(value[0], value[1]),
        );
      }
    }),
  );

  return map;
}

async function importSnippet(snippetPath: string) {
  let result = SNIPPETS.get(snippetPath);
  if (!result) {
    const json = await readFile(snippetPath, "utf-8");
    const decoded = SnippetRecordCodec.decode(JSON.parse(json));
    if (isRight(decoded)) {
      const snippetMap = new Map<string, Snippet>();
      Object.entries(decoded.right).forEach((snippetRecord) => {
        const [key, snippet] = snippetRecord;
        snippetMap.set(key, snippet);
      });
      SNIPPETS.set(snippetPath, snippetMap);
      result = snippetMap;
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

function fetchWordsList(text: string) {
  return text.split(/(\s+)/).filter((e) => {
    return e.trim().length > 0;
  });
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
      // Also store the key as we are aligning the view with VSCode snippet
      prefixToKeyMap.set(snippet.prefix, key);
      snippetList.push({
        detail: snippet.description,
        label: snippet.prefix,
      });
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
