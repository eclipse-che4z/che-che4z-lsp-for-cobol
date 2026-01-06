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
import type { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import * as vscode from "vscode";

function makeRange(line: number, start: number, len: number) {
  return new vscode.Range(line, start, line, start + len);
}

function replaceVariable(
  original: string,
  change: string,
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
): void {
  const index = lines[line].indexOf(original);
  if (index <= 0) return;
  context.replace(makeRange(line, index, original.length), change);
}

function replaceWithParameter(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
  param?: string,
): void {
  if (!param) return;
  const placeholder = "XXX";
  const index = lines[line].indexOf(placeholder);
  if (index <= 0) return;
  context.replace(makeRange(line, index, placeholder.length), param);
}

const TEXT_CHANGERS = [
  replaceVariable.bind(undefined, " AA ", " 01 "),
  replaceVariable.bind(undefined, " BB ", " 05 "),
  replaceVariable.bind(undefined, " SDATA", " PIC X(9)"),
  replaceWithParameter,
];

export function replaceText(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
  param?: string,
) {
  TEXT_CHANGERS.forEach((tc) => tc(context, line, lines, param));
}
