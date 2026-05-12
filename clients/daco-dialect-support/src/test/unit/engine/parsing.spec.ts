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
  CopybookContentVisitor,
  CopybookVisitor,
} from "../../../engine/parsing";

describe("parsing test", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should fallback when layoutId is missing", () => {
    const visitor = new CopybookVisitor();

    const ctx = {
      layoutId: () => null,
      getChildCount: () => 0,
      getChild: () => null,
    } as any;

    const result = visitor.visitCopyMaid(ctx);
    expect(result).toEqual([]);
  });

  it("should fallback when DACO_COPYBOOK_IDENTIFIER is missing", () => {
    const visitor = new CopybookVisitor();

    const ctx = {
      DACO_COPYBOOK_IDENTIFIER: () => null,
      getChildCount: () => 0,
      getChild: () => null,
    } as any;

    const result = visitor.visitVariableEntry(ctx);
    expect(result).toEqual([]);
  });

  it("should skip when entryName is missing", () => {
    const visitor = new CopybookContentVisitor();

    const levelNumber = {
      getText: () => "01",
      start: { line: 1, column: 0, start: 0 },
      stop: { line: 1, column: 1, start: 0, stop: 1 },
    };
    const ctx = {
      entryName: () => null,
      levelNumber: () => levelNumber,
      getChildCount: () => 0,
      getChild: () => null,
    } as any;

    const result = visitor.visitDataDescriptionEntryFormat1(ctx);
    expect(result).toEqual([]);
  });
});
