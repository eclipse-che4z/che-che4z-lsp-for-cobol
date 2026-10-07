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

// from org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto
// or should be source from analysis/src/model/external.ts as a common model ??
export interface Position {
  line: number;
  character: number;
}

export interface Range {
  start: Position;
  end: Position;
}

export interface Location {
  uri: string;
  range: Range;
}

export interface Diagnostic {
  range: Range;
  severity?: number;
  code?: string | number | { left?: string; right?: number };
  source?: string;
  message: string;
}

export interface VariableDto {
  name: string;
  definition: Location;
  usages: Location[];
}

export interface ProcedureDto {
  name: string;
  definitions: Location[];
  usages: Location[];
}

export interface CopyDto {
  name: string;
  uri?: string;
  range: Range;
}

export interface ProgramDto {
  name: string;
  variables: VariableDto[];
  procedures: ProcedureDto[];
  copybooks: CopyDto[];
}

export interface AnalysisResultDto {
  diagnostics: Record<string, Diagnostic[]>;
  programs: ProgramDto[];
}

/** API exported by the COBOL Language Support extension */
export interface CobolExtensionApi {
  analysisResult(uri: string): Promise<AnalysisResultDto | null>;
}
