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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { ParseError } from "./model";
import { Token, ParserRuleContext, Interval } from "antlr4ng";

const FILLER_NAME = "FILLER";

export function addParsingErrors(
  context: IDocumentProcessingContext,
  errors: ParseError[],
) {
  errors.forEach((error) => {
    context.addDiagnostic({
      severity: vscode.DiagnosticSeverity.Error,
      message: error.message,
      range: error.range,
    });
  });
}

export function constructRange(
  ctx: ParserRuleContext | null | undefined,
): vscode.Range {
  const start = ctx?.start;
  const stop = ctx?.stop;
  return constructRangeFromTokens(start, stop);
}

export function constructRangeFromTokens(
  start: Token | null | undefined,
  stop: Token | null | undefined,
): vscode.Range {
  if (!start) {
    return new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 0),
    );
  }
  const startPosition = new vscode.Position(start.line - 1, start.column);
  const stopPosition =
    stop == null || start.start > stop.stop
      ? startPosition
      : new vscode.Position(
          stop.line - 1,
          stop.column + stop.stop - stop.start + 1,
        );
  return new vscode.Range(startPosition, stopPosition);
}

export function extractLevelRange(token: Token): vscode.Range {
  const length = token.text?.length ?? 0;
  const start = new vscode.Position(token.line - 1, token.column);
  const end = new vscode.Position(token.line - 1, token.column + length - 1);
  return new vscode.Range(start, end);
}

export function createOptionsStr(ctx: ParserRuleContext | null): string {
  if (!ctx) {
    return "";
  }
  const start = ctx.start?.start;
  const stop = ctx.stop?.stop;

  if (start && stop) {
    return (
      ctx.start?.inputStream?.getTextFromInterval(Interval.of(start!, stop!)) ??
      ""
    );
  }
  return "";
}

export function tryParseInt(input: string | undefined): number | undefined {
  if (input === undefined) {
    return undefined;
  }
  const value = Number.parseInt(input, 10);
  return Number.isNaN(value) ? undefined : value;
}
