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
 *   Broadcom, Inc. - initial API and implementation
 */
import {
  IDocumentProcessingContext,
  Item,
  Token,
} from "@code4z/cobol-dialect-api";
import * as vscode from "vscode";

type ParamName =
  | "VAR1"
  | "GR1"
  | "VAR2"
  | "GR2"
  | "SEC1"
  | "PAR1"
  | "PAR2"
  | "SEC2"
  | "PROC";

type ExtractedParam = {
  name: ParamName;
  value: string;
  start: number; // absolute index in original string
  end: number; // exclusive
};

type ExtractResult = {
  matchStart: number;
  matchEnd: number;
  params: ExtractedParam[];
  fullMatch: string;
};

function rangeForParam(line: number, param: ExtractedParam): vscode.Range {
  return new vscode.Range(
    new vscode.Position(line, param.start),
    new vscode.Position(line, param.end),
  );
}

function createItemFromParams(
  line: number,
  params: ExtractedParam[],
  indexes: number[],
  type?: "VARIABLE" | "PROCEDURE",
): Item {
  const tokens: Token[] = indexes.map((i) => {
    return { name: params[i].name, range: rangeForParam(line, params[i]) };
  });
  return {
    tokens: tokens,
    type: type,
  };
}

function extractProcessStatementExpr(input: string): ExtractResult[] {
  const wholeRe =
    /\bPROC\b[\s\S]*?\bDO\b[\s\S]*?\bWITH\b[\s\S]*?\bFROM\b[\s\S]*?(?=($|[.;]))/gi;

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(wholeRe)) {
    if (m.index == null) continue;

    const fullMatch = m[0];
    const base = m.index;
    const token = String.raw`[A-Z0-9_-]+`;

    const paramPatterns: Array<{ name: ParamName; re: RegExp }> = [
      {
        name: "VAR1",
        re: new RegExp(String.raw`\bPROC\s+(${token})\s+OF\b`, "i"),
      },
      {
        name: "GR1",
        re: new RegExp(
          String.raw`\bPROC\s+${token}\s+OF\s+(${token})\s+BY\b`,
          "i",
        ),
      },

      {
        name: "VAR2",
        re: new RegExp(String.raw`\bBY\s+(${token})\s+OF\b`, "i"),
      },
      {
        name: "GR2",
        re: new RegExp(
          String.raw`\bBY\s+${token}\s+OF\s+(${token})\s+DO\b`,
          "i",
        ),
      },

      {
        name: "SEC1",
        re: new RegExp(String.raw`\bDO\s+(${token})\s+WITH\b`, "i"),
      },
      {
        name: "PAR1",
        re: new RegExp(String.raw`\bWITH\s+(${token})\s+AND\b`, "i"),
      },

      {
        name: "PAR2",
        re: new RegExp(String.raw`\bAND\s+(${token})\s+FROM\b`, "i"),
      },
      {
        name: "SEC2",
        re: new RegExp(String.raw`\bFROM\s+(${token})\s*,\s*${token}\b`, "i"),
      },

      {
        name: "PROC",
        re: new RegExp(String.raw`\bFROM\s+${token}\s*,\s*(${token})\b`, "i"),
      },
    ];

    const params: ExtractedParam[] = [];

    for (const p of paramPatterns) {
      const pm = p.re.exec(fullMatch);
      if (!pm) continue;

      const value = pm[1];
      const groupOffsetInMatch = pm[0].indexOf(value);
      const start = base + pm.index + groupOffsetInMatch;
      const end = start + value.length;

      params.push({ name: p.name, value, start, end });
    }

    const required: ParamName[] = [
      "VAR1",
      "GR1",
      "VAR2",
      "GR2",
      "SEC1",
      "PAR1",
      "PAR2",
      "SEC2",
      "PROC",
    ];
    const found = new Set(params.map((x) => x.name));
    const ok = required.every((r) => found.has(r));
    if (!ok) continue;

    params.sort((a, b) => a.start - b.start);

    results.push({
      matchStart: base,
      matchEnd: base + fullMatch.length,
      params: params,
      fullMatch,
    });
  }

  return results;
}

function applyProcessStatementResult(
  context: IDocumentProcessingContext,
  result: ExtractResult,
  line: number,
) {
  const range = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchEnd),
  );
  const statementRange = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchStart + "PROC".length),
  );
  const items: Item[] = [];

  items.push(
    createItemFromParams(line, result.params, [0, 1]), // VAR1 OF GR1
    createItemFromParams(line, result.params, [2, 3]), // VAR2 OF GR2
    createItemFromParams(line, result.params, [5, 4]), // PAR1 OF SEC1
    createItemFromParams(line, result.params, [6, 7]), // PAR2 OF SEC2
    createItemFromParams(line, result.params, [8]), // PROC
  );

  const replacementMap =
    `       MOVE {${result.params[0].name}} OF {${result.params[1].name}} TO {${result.params[2].name}} OF {${result.params[3].name}}.\n` +
    `       PERFORM {${result.params[5].name}} OF {${result.params[4].name}} THRU {${result.params[6].name}} OF {${result.params[7].name}}.\n` +
    `       PERFORM {${result.params[8].name}}.`;
  context.replaceWithMap(range, statementRange, items, replacementMap);
}

function extractFixState(input: string): ExtractResult[] {
  const wholeRe = /\bFIX\s+STATE\s+[A-Z0-9_-]+\s+OF\s+[A-Z0-9_-]+\b/gi;

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(wholeRe)) {
    if (m.index == null) continue;

    const fullMatch = m[0];
    const base = m.index;

    const patterns: Array<{ name: ParamName; re: RegExp }> = [
      {
        name: "VAR1",
        re: /\bFIX\s+STATE\s+([A-Z0-9_-]+)\s+OF\b/i,
      },
      {
        name: "GR1",
        re: /\bOF\s+([A-Z0-9_-]+)\b/i,
      },
    ];

    const params: ExtractedParam[] = [];

    for (const p of patterns) {
      const pm = p.re.exec(fullMatch);
      if (!pm) continue;

      const value = pm[1];
      const offsetInMatch = pm[0].indexOf(value);
      const start = base + pm.index + offsetInMatch;
      const end = start + value.length;

      params.push({
        name: p.name,
        value,
        start,
        end,
      });
    }

    if (params.length !== 2) continue;

    params.sort((a, b) => a.start - b.start);
    results.push({
      matchStart: base,
      matchEnd: base + fullMatch.length,
      fullMatch,
      params: params,
    });
  }

  return results;
}

function extractAltState(input: string): ExtractResult[] {
  const wholeRe = /\bALT\s+STATE\s+[A-Z0-9_-]+\s+OF\s+[A-Z0-9_-]+\b/gi;

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(wholeRe)) {
    if (m.index == null) continue;

    const fullMatch = m[0];
    const base = m.index;

    const patterns: Array<{ name: ParamName; re: RegExp }> = [
      {
        name: "PAR1",
        re: /\bALT\s+STATE\s+([A-Z0-9_-]+)\s+OF\b/i,
      },
      {
        name: "SEC1",
        re: /\bOF\s+([A-Z0-9_-]+)\b/i,
      },
    ];

    const params: ExtractedParam[] = [];

    for (const p of patterns) {
      const pm = p.re.exec(fullMatch);
      if (!pm) continue;

      const value = pm[1];
      const offsetInMatch = pm[0].indexOf(value);
      const start = base + pm.index + offsetInMatch;
      const end = start + value.length;

      params.push({
        name: p.name,
        value,
        start,
        end,
      });
    }

    if (params.length !== 2) continue;

    params.sort((a, b) => a.start - b.start);
    results.push({
      matchStart: base,
      matchEnd: base + fullMatch.length,
      fullMatch,
      params: params,
    });
  }

  return results;
}

function applyFixStateStatementResult(
  context: IDocumentProcessingContext,
  result: ExtractResult,
  line: number,
) {
  const range = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchEnd),
  );
  const statementRange = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchStart + "FIX".length),
  );
  const items: Item[] = [];

  items.push(
    createItemFromParams(line, result.params, [0, 1], "VARIABLE"), // VAR1 OF GR1
  );

  const replacementMap = "";
  context.replaceWithMap(range, statementRange, items, replacementMap);
}

function applyAltStateStatementResult(
  context: IDocumentProcessingContext,
  result: ExtractResult,
  line: number,
) {
  const range = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchEnd),
  );
  const statementRange = new vscode.Range(
    new vscode.Position(line, result.matchStart),
    new vscode.Position(line, result.matchStart + "ALT".length),
  );
  const items: Item[] = [];

  items.push(
    createItemFromParams(line, result.params, [0, 1], "PROCEDURE"), // PAR1 OF SEC1
  );

  const replacementMap = "";
  context.replaceWithMap(range, statementRange, items, replacementMap);
}

export function replaceProcessStatement(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
): void {
  //      PROC VAR1 OF GR1 BY VAR2 OF GR2 DO SEC1 WITH PAR1 AND PAR2 FROM SEC2, PROC
  const results = extractProcessStatementExpr(lines[line]);

  for (const result of results) {
    applyProcessStatementResult(context, result, line);
  }
}

export function replaceFixStateStatement(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
): void {
  //      FIX STATE V1 OF G1
  const results = extractFixState(lines[line]);

  for (const result of results) {
    applyFixStateStatementResult(context, result, line);
  }
}

export function replaceAltStateStatement(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
): void {
  //      ALT STATE P1 OF S1
  const results = extractAltState(lines[line]);

  for (const result of results) {
    applyAltStateStatementResult(context, result, line);
  }
}
