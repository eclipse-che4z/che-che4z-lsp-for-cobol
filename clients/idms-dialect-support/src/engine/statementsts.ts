/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";
import {
  IDocumentProcessingContext,
  Item,
  Token,
} from "@code4z/cobol-dialect-api";
import { StatementDescriptor } from "./model";

/**
 * Replaces parsed IDMS statements with their COBOL-compatible filler text,
 * preserving variable usages so that the underlying COBOL parser can still
 * resolve them.
 */
export function processStatement(
  context: IDocumentProcessingContext,
  descriptors: StatementDescriptor[],
): void {
  for (const descriptor of descriptors) {
    const items = traverseChildren(
      context.getDocumentUri(),
      descriptor.children,
    );
    if (items.length > 0) {
      context.replaceWithMap(
        descriptor.range,
        descriptor.statementRange,
        items,
        descriptor.filler,
      );
    } else {
      context.replace(descriptor.statementRange, descriptor.filler);
    }
  }
}

function traverseChildren(
  documentUri: vscode.Uri,
  children: StatementDescriptor[],
): Item[] {
  const items: Item[] = [];
  let index = 0;

  for (const child of children) {
    if (child.type === "VARIABLE") {
      const tokens: Token[] = [];
      const name = `VAR_${index++}`;
      createTokens(documentUri, tokens, name, child.children);
      items.push({ type: "VARIABLE", tokens });
    }
  }

  return items;
}

function createTokens(
  documentUri: vscode.Uri,
  tokens: Token[],
  name: string,
  children: StatementDescriptor[],
): void {
  let index = 0;

  for (const child of children) {
    if (child.type === "VARIABLE_USAGE") {
      const tokenName = `${name}_USG_${index++}`;
      tokens.push({
        name: tokenName,
        location: new vscode.Location(documentUri, child.statementRange),
      });
      createTokens(documentUri, tokens, tokenName, child.children);
    }
  }
}
