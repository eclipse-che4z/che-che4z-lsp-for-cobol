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

export const Uri = URI;
Object.assign(Uri, Utils);

export class Diagnostic {
  constructor(
    public range: Range,
    public message: string,
    public severity: DiagnosticSeverity = DiagnosticSeverity.Error,
  ) {}
}

export class Location {
  public constructor(private uri: typeof Uri, private range: Range) {}
  public getRange() {
    return this.range;
  }
  public getUri() {
    return this.uri;
  }
}

export class Range {
  public start: Position;
  public end: Position;

  constructor(
    par0: number | Position,
    par1: number | Position,
    endLine?: number,
    endCharacter?: number,
  ) {
    if (endLine !== undefined && endCharacter !== undefined) {
      this.start = new Position(par0 as number, par1 as number);
      this.end = new Position(endLine, endCharacter);
    } else {
      this.start = par0 as Position;
      this.end = par1 as Position;
    }
  }
}

export class Position {
  constructor(public line: number, public character: number) {}
}

export enum DiagnosticSeverity {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}

export const workspace = {
  fs: {
    readFile: jest.fn(),
  },
  getConfiguration: jest.fn().mockReturnValue({
    get: jest.fn(),
  }),
};

export const window = {
  showErrorMessage: jest.fn(),
};
