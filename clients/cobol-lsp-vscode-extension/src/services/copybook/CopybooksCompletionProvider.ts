/*
 * Copyright (c) 2025 Broadcom.
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

import {
  CancellationToken,
  CompletionContext,
  CompletionItem,
  CompletionItemKind,
  CompletionItemProvider,
  Position,
  Progress,
  ProgressLocation,
  TextDocument,
  window,
} from "vscode";
import {
  COPYBOOK_COMPLETIONS_SORT_PREFIX,
  DEFAULT_DIALECT,
} from "../../constants";
import { CopyStatementParser, DialectRegistry } from "../DialectRegistry";
import { loadProcessorGroupCopybooksLibs } from "../ProcessorGroups";

const isDefaultCopyStatement: CopyStatementParser = (statement: string) => {
  const regex = /^.*\bCOPY(?:\s+"?'?)([\S]+)?$/i;
  const match = statement.match(regex);
  if (!match) {
    return { isCopy: false };
  }
  return { isCopy: true, prefix: match[1] };
};

const isSQLCopyStatement: CopyStatementParser = (statement: string) => {
  const regex = /^.*\bEXEC\s+SQL\s+INCLUDE(?:\s+"?'?)([\S]+)?$/i;
  const match = statement.match(regex);
  if (!match) {
    return { isCopy: false };
  }
  return { isCopy: true, prefix: match[1] };
};

export class CopybooksCompletionProvider implements CompletionItemProvider {
  async provideCompletionItems(
    document: TextDocument,
    position: Position,
    _token: CancellationToken,
    _context: CompletionContext,
  ): Promise<CompletionItem[]> {
    const line = document
      .lineAt(position.line)
      .text.slice(0, position.character);

    const dialects: {
      name: string;
      isCopyStatement?: CopyStatementParser;
    }[] = [
      {
        name: DEFAULT_DIALECT,
        isCopyStatement: isDefaultCopyStatement,
      },
      {
        /**
         * SQL preprocessor is supposed to use `SQL` as a name, but because
         * the server is sending `COBOL` as a dialect name in the
         * `copybook/resolve` requests for `EXEC SQL INCLUDE` statements,
         * we need to use it for auto-completions as well, so copybook
         * downloading works correctly.
         */
        name: DEFAULT_DIALECT,
        isCopyStatement: isSQLCopyStatement,
      },
      ...DialectRegistry.getActiveDialects().map((di) => ({
        name: di.name,
        isCopyStatement: di.isCopyStatement,
      })),
    ];

    const copybooksLoadingPromises: Promise<void>[] = [];
    const copybooks: Set<string> = new Set();

    for (const dialect of dialects) {
      if (dialect.isCopyStatement) {
        let { isCopy, prefix } = dialect.isCopyStatement(line);
        prefix = prefix?.toUpperCase();

        if (isCopy) {
          const pgLibs = await loadProcessorGroupCopybooksLibs(
            document.uri,
            dialect.name,
          );

          copybooksLoadingPromises.push(
            ...pgLibs.map(async (lib) => {
              const list = await lib.listCopybooks(document.uri, dialect.name);
              list?.forEach((copybook) => {
                if (!prefix || copybook.startsWith(prefix)) {
                  copybooks.add(copybook);
                }
              });
            }),
          );
        }
      }
    }

    if (copybooksLoadingPromises.length === 0) {
      return [];
    }

    let copybooksLoadingFinished = false;
    const copybooksLoadingPromise = (async () => {
      await Promise.allSettled(copybooksLoadingPromises);
      copybooksLoadingFinished = true;
    })();

    await Promise.race([
      copybooksLoadingPromise,
      new Promise((resolve) => {
        setTimeout(resolve, 200);
      }),
    ]);

    // If we are unable to provide completions immediately, show info dialog
    if (!copybooksLoadingFinished) {
      await window.withProgress(
        {
          location: ProgressLocation.Notification,
          title: "Loading copybooks completions",
        },
        async (
          _progress: Progress<{ message?: string; increment?: number }>,
        ) => {
          await copybooksLoadingPromise;
        },
      );
    }

    const completions: CompletionItem[] = [];
    copybooks.forEach((copybook) => {
      const ci = new CompletionItem(copybook, CompletionItemKind.Class);
      ci.sortText = `${COPYBOOK_COMPLETIONS_SORT_PREFIX}${copybook}`;
      completions.push(ci);
    });

    return completions;
  }
}
