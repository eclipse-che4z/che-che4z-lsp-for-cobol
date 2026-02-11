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

const REQ_PARAMS_PROCESS: ParamName[] = [
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

type NamedGroupIndices = Record<string, [number, number]>;

type IndicesWithGroups = Array<[number, number]> & {
  groups: NamedGroupIndices;
};

interface MatchWithIndices extends RegExpMatchArray {
  indices: IndicesWithGroups;
  groups: Record<string, string>;
}

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
  const token = String.raw`[A-Z0-9_-]+`;

  const re = new RegExp(
    String.raw`\bPROC\s+(?<VAR1>${token})\s+OF\s+(?<GR1>${token})\s+BY\s+(?<VAR2>${token})\s+OF\s+(?<GR2>${token})\s+DO\s+(?<SEC1>${token})\s+WITH\s+(?<PAR1>${token})\s+AND\s+(?<PAR2>${token})\s+FROM\s+(?<SEC2>${token})\s*,\s*(?<PROC>${token})(?=($|[.;]))`,
    "gid",
  );

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(re)) {
    if (m.index == null) continue;

    const match = m as MatchWithIndices;
    const fullMatch = m[0];

    const params: ExtractedParam[] = [];

    for (const name of REQ_PARAMS_PROCESS) {
      const value = match.groups[name];
      const span = match.indices.groups[name];

      const [startInMatch, endInMatch] = span;
      params.push({
        name,
        value,
        start: startInMatch,
        end: endInMatch,
      });
    }

    params.sort((a, b) => a.start - b.start);
    const [matchStart, matchEnd] = match.indices[0];

    results.push({
      matchStart: matchStart,
      matchEnd: matchEnd,
      params,
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
  const token = String.raw`[A-Z0-9_-]+`;

  const re = new RegExp(
    String.raw`\bFIX\s+STATE\s+(?<VAR1>${token})\s+OF\s+(?<GR1>${token})\b`,
    "gid",
  );

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(re)) {
    if (m.index == null) continue;

    const match = m as MatchWithIndices;

    const var1 = match.groups.VAR1;
    const gr1 = match.groups.GR1;

    const var1Span = match.indices.groups.VAR1;
    const gr1Span = match.indices.groups.GR1;

    if (!var1 || !gr1 || !var1Span || !gr1Span) continue;

    const params: ExtractedParam[] = [
      { name: "VAR1", value: var1, start: var1Span[0], end: var1Span[1] },
      { name: "GR1", value: gr1, start: gr1Span[0], end: gr1Span[1] },
    ];

    params.sort((a, b) => a.start - b.start);

    const [matchStart, matchEnd] = match.indices[0];

    results.push({
      matchStart,
      matchEnd,
      fullMatch: m[0],
      params,
    });
  }

  return results;
}

function extractAltState(input: string): ExtractResult[] {
  const token = String.raw`[A-Z0-9_-]+`;

  const re = new RegExp(
    String.raw`\bALT\s+STATE\s+(?<PAR1>${token})\s+OF\s+(?<SEC1>${token})\b`,
    "gid",
  );

  const results: ExtractResult[] = [];

  for (const m of input.matchAll(re)) {
    if (m.index == null) continue;

    const match = m as MatchWithIndices;

    const par1 = match.groups.PAR1;
    const sec1 = match.groups.SEC1;

    const par1Span = match.indices.groups.PAR1;
    const sec1Span = match.indices.groups.SEC1;

    if (!par1 || !sec1 || !par1Span || !sec1Span) continue;

    const params: ExtractedParam[] = [
      { name: "PAR1", value: par1, start: par1Span[0], end: par1Span[1] },
      { name: "SEC1", value: sec1, start: sec1Span[0], end: sec1Span[1] },
    ];

    params.sort((a, b) => a.start - b.start);

    const [matchStart, matchEnd] = match.indices[0];

    results.push({
      matchStart,
      matchEnd,
      fullMatch: m[0],
      params,
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
