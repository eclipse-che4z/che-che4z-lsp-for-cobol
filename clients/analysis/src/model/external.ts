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

export type DiagnosticDto = {
  range: RangeDto;
  message: string;
  severity: DiagnosticSeverityDto | undefined;
  tags: DiagnosticTagDto[] | undefined;
  source: string | undefined;
  relatedInformation: DiagnosticRelatedInformationDto[] | undefined;
};

/**
 * Represents the severity of diagnostics.
 */
export const enum DiagnosticSeverityDto {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}

export type RangeDto = {
  start: PositionDto;
  end: PositionDto;
};

export type PositionDto = {
  line: number;
  character: number;
};

export type LocationDto = {
  uri: string;
  range: RangeDto;
};

export type DiagnosticRelatedInformationDto = {
  location: LocationDto;
  message: string;
};

export const enum DiagnosticTagDto {
  Unnecessary = 1,
  Deprecated = 2,
}
