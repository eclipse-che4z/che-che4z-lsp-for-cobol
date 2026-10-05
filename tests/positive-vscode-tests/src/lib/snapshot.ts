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

// Port of SnapshotReader / SysprintSnap from server/engine/src/test/java/org/eclipse/lsp/cobol/positive

import * as fs from "fs";
import { Range } from "./types";

export type ReportSection = "DATA_NAMES" | "PROCEDURES" | "PROGRAMS";

export interface SysprintSnap {
  dataName: string;
  /** 1-based line number of the definition */
  definedLineNo: number;
  /** 1-based reference line numbers, used when the snapshot has no ranges */
  references: number[];
  /** 0-based LSP range of the definition, if present in the snapshot */
  definitionLocation?: Range;
  /** 0-based LSP ranges of the references, empty when the snapshot has only line numbers */
  referencesLocation: Range[];
}

export type Snapshot = Record<ReportSection, SysprintSnap[]>;

const SECTIONS = /DATA_NAMES([\s\S]*?)PROCEDURES([\s\S]*?)PROGRAMS([\s\S]*)/g;
const SNAP_LINE =
  /(\d+(:\d+-\d+:\d+)?)\t(.*?)\t((\d+(:\d+-\d+:\d+)?)(,\d+(:\d+-\d+:\d+)?)*)?/g;
const RANGE = /(\d+(:\d+)?)(-(\d+(:\d+)?))?/g;

export function emptySnapshot(): Snapshot {
  return { DATA_NAMES: [], PROCEDURES: [], PROGRAMS: [] };
}

export function readSnapshot(file: string): Snapshot {
  return parseSnapshot(fs.readFileSync(file, "utf8"));
}

export function parseSnapshot(content: string): Snapshot {
  const result = emptySnapshot();
  for (const match of content.matchAll(SECTIONS)) {
    result.DATA_NAMES = parseSection(match[1]);
    result.PROCEDURES = parseSection(match[2]);
    result.PROGRAMS = parseSection(match[3]);
  }
  return result;
}

function parseSection(section: string): SysprintSnap[] {
  const snaps: SysprintSnap[] = [];
  for (const match of section.matchAll(SNAP_LINE)) {
    const definition = match[1];
    const references = match[4];
    snaps.push({
      dataName: match[3],
      definedLineNo: parseInt(definition.split(":")[0], 10),
      definitionLocation: match[2] ? parseRanges(definition)[0] : undefined,
      referencesLocation: match[6] && references ? parseRanges(references) : [],
      references:
        !match[6] && references
          ? references.split(",").map((r) => parseInt(r, 10))
          : [],
    });
  }
  return snaps;
}

function parseRanges(text: string): Range[] {
  const result: Range[] = [];
  for (const match of text.matchAll(RANGE)) {
    const [startLine, startChar] = match[1].split(":").map(Number);
    const [endLine, endChar] = match[4].split(":").map(Number);
    result.push({
      start: { line: startLine, character: startChar },
      end: { line: endLine, character: endChar },
    });
  }
  return result;
}
