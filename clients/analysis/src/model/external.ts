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

export class DiagnosticDto {
  public source: string | undefined;
  public relatedInformation: DiagnosticRelatedInformationDto[] | undefined;
  public tags: DiagnosticTagDto[] | undefined;

  constructor(
    public range: RangeDto,
    public message: string,
    public severity: DiagnosticSeverityDto | undefined,
  ) {}
}

/**
 * Represents the severity of diagnostics.
 */
export enum DiagnosticSeverityDto {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}

export class RangeDto {
  constructor(
    public start: PositionDto,
    public end: PositionDto,
  ) {}
}

export class PositionDto {
  constructor(
    public line: number,
    public character: number,
  ) {}
}

export class LocationDto {
  constructor(
    public uri: string,
    public range: RangeDto,
  ) {}
}

export class DiagnosticRelatedInformationDto {
  constructor(
    public location: LocationDto,
    public message: string,
  ) {}
}

export enum DiagnosticTagDto {
  Unnecessary = 1,
  Deprecated = 2,
}
