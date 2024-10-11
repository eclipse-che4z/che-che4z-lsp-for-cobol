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

let snippetsCompletionItems: vscode.CompletionItem[] | null = null;

export class SnippetCompletionProvider
  implements vscode.CompletionItemProvider
{
  public async provideCompletionItems(
    document: vscode.TextDocument,
    position: vscode.Position,
    _token: vscode.CancellationToken,
    _context: vscode.CompletionContext,
  ): Promise<vscode.CompletionItem[]> {
    // use already loaded completion items if available
    if (!snippetsCompletionItems) {
      snippetsCompletionItems = [];
      // load all snippets for all dialects
      const snippets = await loadSnippets();
      snippets.forEach((snippet, key) => {
        if (!snippet.description) {
          snippet.description = key;
        }
        snippetsCompletionItems?.push(
          createCompletionItem(snippet, key, position, document),
        );
      });
    }

    // filter completion items using words on current line
    const textUptoCursor = getCurrentLineText(document, position);
    const wordsUptoCursor = splitToWords(textUptoCursor);
    const filteredSnippets = snippetsCompletionItems.filter(
      (completionItem) => {
        const prefixList: string[] =
          splitToWordsFromCompletionItem(completionItem);
        const matchedWords = getMatchedWords(prefixList, wordsUptoCursor);

        return matchedWords.length > 0;
      },
    );

    // if no snippet matches current line, return all of them
    const resultCompletionItems =
      filteredSnippets.length > 0 ? filteredSnippets : snippetsCompletionItems;

    // update ranges for each completion item
    resultCompletionItems.forEach((completionItem) => {
      const firstCharacterPosition = findPosition(position, document);
      const insertingRange = new vscode.Position(
        position.line,
        firstCharacterPosition,
      );
      const replaceRange = new vscode.Position(
        position.line,
        position.character,
      );
      completionItem.range = new vscode.Range(insertingRange, replaceRange);
    });

    return resultCompletionItems;
  }
}

function createCompletionItem(
  snippet: Snippet,
  key: string,
  _position: vscode.Position,
  _document: vscode.TextDocument,
): vscode.CompletionItem {
  const itemLabel: vscode.CompletionItemLabel = {
    label: snippet.prefix,
    description: key,
  };
  const completionItem = new vscode.CompletionItem(itemLabel);
  completionItem.detail = snippet.description;
  completionItem.insertText = new vscode.SnippetString(snippet.body.join("\n"));
  completionItem.documentation = new vscode.MarkdownString().appendCodeblock(
    formatString(snippet.body.join("\n")),
    LANGUAGE_ID,
  );
  completionItem.kind = vscode.CompletionItemKind.Snippet;
  return completionItem;
}

/**
 * Return map of all predefined snippets and snippets
 * for all active dialects from JSON files provided by dialects
 */
async function loadSnippets() {
  const loadedSnippets = new Map(Object.entries(predefinedSnippets));
  const activeDialectsNames = SettingsService.getDialects()!;
  const registeredDialects = DialectRegistry.getDialects();
  const activeDialects = registeredDialects.filter((dialect) =>
    activeDialectsNames.includes(dialect.name),
  );

  await Promise.all(
    activeDialects.map(async (d) => {
      const dialectSnippets = await importDialectSnippets(d.snippetPath);
      if (dialectSnippets) {
        dialectSnippets.forEach((snippet, key) => {
          loadedSnippets.set(key, snippet);
        });
      }
    }),
  );

  return loadedSnippets;
}

async function importDialectSnippets(snippetPath: string) {
  const dialectSnippets: Map<string, Snippet> = new Map();
  const json = await readFile(snippetPath, "utf-8");
  const decoded = SnippetRecordCodec.decode(JSON.parse(json));
  if (isRight(decoded)) {
    Object.entries(decoded.right).forEach((snippetRecord) => {
      const [key, snippet] = snippetRecord;
      dialectSnippets.set(key, snippet);
    });
  }

  return dialectSnippets;
}

function splitToWordsFromCompletionItem(completionItem: vscode.CompletionItem) {
  let prefix: string;
  if (typeof completionItem.label === "string") {
    prefix = completionItem.label;
  } else {
    prefix = completionItem.label.label;
  }
  return splitToWords(prefix);
}

function splitToWords(text: string) {
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

function getMatchedWords(words1: string[], words2: string[]) {
  const word = words1.filter((word) => words2.includes(word));
  return word;
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

function formatString(arg: string) {
  return arg.replace(/(\$\{*\d*\/*:*|\/\(.*\)|\\\.\.\+|\$\/|\})/g, "");
}

export async function resetSnippetsCompletionItems() {
  snippetsCompletionItems = null;
}

export async function pickSnippet() {
  try {
    const editor = vscode.window.activeTextEditor;
    const snippetList: vscode.QuickPickItem[] = [];
    const prefixToKeyMap = new Map<string, string>();
    const snippets = await loadSnippets();
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
      const snippetKey = prefixToKeyMap.get(item.label);
      if (snippetKey) {
        const snippet = snippets.get(snippetKey);
        if (snippet) {
          const snippetString = new vscode.SnippetString(
            snippet.body.join("\n"),
          );
          editor?.insertSnippet(snippetString);
        }
      }
    });
    input.show();
  } catch (error) {
    console.log(error);
  }
}
