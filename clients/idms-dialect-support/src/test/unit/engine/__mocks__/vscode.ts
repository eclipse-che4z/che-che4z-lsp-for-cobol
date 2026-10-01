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
import { URI, Utils } from "vscode-uri";

export const workspace = {
  getConfiguration: jest.fn().mockReturnValue({
    get: jest.fn(),
  }),
  fs: {
    readFile: jest.fn(),
  },
};

export const window = {
  showErrorMessage: jest.fn(),
};

export class Position {
  constructor(
    public readonly line: number,
    public readonly character: number,
  ) {}
}

export class Range {
  public readonly start: Position;
  public readonly end: Position;

  constructor(
    start: Position | number,
    end: Position | number,
    endLine?: number,
    endCharacter?: number,
  ) {
    if (
      typeof start === "number" &&
      typeof end === "number" &&
      endLine !== undefined &&
      endCharacter !== undefined
    ) {
      this.start = new Position(start, end);
      this.end = new Position(endLine, endCharacter);
    } else {
      this.start = start as Position;
      this.end = end as Position;
    }
  }
}

export class Diagnostic {
  public relatedInformation?: DiagnosticRelatedInformation[];

  constructor(
    public range: Range,
    public message: string,
    public severity: DiagnosticSeverity = DiagnosticSeverity.Error,
  ) {}
}

export class Location {
  constructor(public uri: unknown, public range: Range) {}
}

export class DiagnosticRelatedInformation {
  constructor(public location: Location, public message: string) {}
}

export enum DiagnosticSeverity {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}

export const Uri = URI;
Object.assign(Uri, Utils);
