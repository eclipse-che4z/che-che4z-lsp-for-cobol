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

// Port of PositiveTestUtility and PositiveTest.assertNoError from
// server/engine/src/test/java/org/eclipse/lsp/cobol/positive

import {
  AnalysisResultDto,
  Diagnostic,
  Location,
  ProgramDto,
  Range,
  VariableDto,
} from "./types";
import { Snapshot, SysprintSnap } from "./snapshot";

const IMPLICIT_PREFIX = "implicit://";
const ERROR_SEVERITY = 1;

interface ProgramVariable {
  variable: VariableDto;
  program: ProgramDto;
}

interface Procedure {
  definitions: Location[];
  usages: Location[];
}

/**
 * Compare the analysis result with the snapshot.
 *
 * @returns list of failure messages, empty if everything matches
 */
export function checkSnapshot(
  result: AnalysisResultDto,
  snapshot: Snapshot,
  fileName: string,
): string[] {
  const variables = new Map<string, ProgramVariable[]>();
  const procedures = new Map<string, Procedure[]>();
  const programs = new Set<string>();
  for (const program of result.programs) {
    for (const variable of program.variables) {
      push(variables, variable.name, { variable, program });
    }
    for (const procedure of program.procedures) {
      push(procedures, procedure.name.toUpperCase(), procedure);
    }
    programs.add(program.name.toUpperCase());
  }

  const failures: string[] = [];
  const fail = (message: string) => failures.push(`[${fileName}]:${message}`);

  for (const snap of snapshot.DATA_NAMES) {
    const nodes = variables.get(snap.dataName) || [];
    if (snap.definitionLocation) {
      checkDataNameByRange(snap, nodes, fail);
    } else {
      checkDataNameByLine(snap, nodes, fileName, fail);
    }
  }
  for (const snap of snapshot.PROCEDURES) {
    checkProcedure(snap, procedures.get(snap.dataName.toUpperCase()) || [], fail);
  }
  for (const snap of snapshot.PROGRAMS) {
    // Line numbers are not compared: program nodes always start at line 0 in the LSP
    if (!programs.has(snap.dataName.toUpperCase())) {
      fail(`Program definition not found for ${snap.dataName}`);
    }
  }
  return failures;
}

function checkDataNameByRange(
  snap: SysprintSnap,
  nodes: ProgramVariable[],
  fail: (message: string) => void,
) {
  const found = nodes.find((n) =>
    rangeEquals(snap.definitionLocation!, n.variable.definition.range),
  );
  if (!found) {
    fail(
      `Data name definition for ${snap.dataName} expected range: ${formatRange(snap.definitionLocation!)}` +
        ` but found: [${nodes.map((n) => formatRange(n.variable.definition.range)).join(", ")}]`,
    );
    return;
  }
  const unmatched = snap.referencesLocation.filter(
    (ref) => !found.variable.usages.some((u) => rangeEquals(ref, u.range)),
  );
  if (unmatched.length > 0) {
    fail(
      `Data references are not found for ${snap.dataName}, at: ${unmatched.map(formatRange).join(" ,")}`,
    );
  }
}

function checkDataNameByLine(
  snap: SysprintSnap,
  nodes: ProgramVariable[],
  fileName: string,
  fail: (message: string) => void,
) {
  // implicit nodes are always at line 0
  const found = nodes.find(
    ({ variable }) =>
      (variable.definition.uri.startsWith(IMPLICIT_PREFIX) &&
        snap.definedLineNo === 0) ||
      variable.definition.range.start.line + 1 === snap.definedLineNo,
  );
  if (!found) {
    fail(`Data name definition for ${snap.dataName} not found in LSP engine`);
    return;
  }
  const usageLines = found.variable.usages.flatMap((usage) =>
    decode(usage.uri).includes(fileName)
      ? [usage.range.start.line + 1]
      : // usage in a copybook: shift by the end line of the matching COPY statements
        found.program.copybooks
          .filter((copy) => copy.uri === usage.uri)
          .map((copy) => copy.range.end.line + 1 + usage.range.start.line + 1),
  );
  const unmatched = snap.references.filter((line) => !usageLines.includes(line));
  if (unmatched.length > 0) {
    fail(`Data references are not found for ${snap.dataName}, at: ${unmatched.join(" ,")}`);
  }
}

function checkProcedure(
  snap: SysprintSnap,
  procedures: Procedure[],
  fail: (message: string) => void,
) {
  const definitions = procedures.flatMap((p) => p.definitions);
  const usages = procedures.flatMap((p) => p.usages);
  if (definitions.length === 0) {
    fail(`Procedure definition for ${snap.dataName} not found in LSP engine`);
    return;
  }
  // As in the engine test, only reference ranges are compared: snapshot rows with line numbers
  // only have no reference ranges, so their procedure references are not checked
  for (const ref of snap.referencesLocation) {
    if (!usages.some((u) => rangeEquals(ref, u.range))) {
      fail(
        `Procedure snapReferences for ${snap.dataName} at ${snap.definedLineNo} not found at line no: ${formatRange(ref)}`,
      );
    }
  }
}

/**
 * Check that there are no errors reported for the document itself.
 *
 * @returns failure message or undefined if there are no errors
 */
export function checkNoErrors(
  result: AnalysisResultDto,
  documentUri: string,
  fileName: string,
): string | undefined {
  const errors = findDiagnostics(result, documentUri).filter(
    (d) => d.severity === ERROR_SEVERITY,
  );
  if (errors.length === 0) {
    return undefined;
  }
  let message = `${fileName} contains syntax errors:\r\n`;
  for (const d of errors) {
    message +=
      `${d.range.start.line + 1}:${d.range.start.character} - ` +
      `${d.range.end.line + 1}:${d.range.end.character} : ${d.message}\r\n`;
  }
  return message;
}

function findDiagnostics(result: AnalysisResultDto, documentUri: string): Diagnostic[] {
  const expected = normalizeUri(documentUri);
  const key = Object.keys(result.diagnostics || {}).find(
    (k) => normalizeUri(k) === expected,
  );
  return key ? result.diagnostics[key] : [];
}

function normalizeUri(uri: string): string {
  // VS Code encodes ':' of windows drive letters and lower-cases them, the server may not
  return decode(uri).replace(/^file:\/+/, "file:///").toLowerCase();
}

function decode(uri: string): string {
  try {
    return decodeURIComponent(uri);
  } catch {
    return uri;
  }
}

function rangeEquals(a: Range, b: Range): boolean {
  return (
    a.start.line === b.start.line &&
    a.start.character === b.start.character &&
    a.end.line === b.end.line &&
    a.end.character === b.end.character
  );
}

function formatRange(r: Range): string {
  return `${r.start.line}:${r.start.character}-${r.end.line}:${r.end.character}`;
}

function push<T>(map: Map<string, T[]>, key: string, value: T) {
  const list = map.get(key);
  if (list) {
    list.push(value);
  } else {
    map.set(key, [value]);
  }
}
