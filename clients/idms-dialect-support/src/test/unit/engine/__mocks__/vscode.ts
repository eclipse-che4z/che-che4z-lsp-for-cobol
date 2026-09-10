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
  constructor(public readonly start: Position, public readonly end: Position) {}
}

export enum DiagnosticSeverity {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}

export const Uri = {
  joinPath: jest.fn((base: unknown, ...paths: string[]) => ({
    base,
    paths,
  })),
};
