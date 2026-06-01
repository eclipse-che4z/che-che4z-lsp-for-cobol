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

import {
  CopybookContentVisitor,
  CopybookVisitor,
  DaCoVisitor,
  NameResolver,
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
      LEVEL_NUMBER: () => ({ getText: () => "01" }),
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

  it("should skip when dataName is missing", () => {
    const visitor = new CopybookContentVisitor();

    const ctx = {
      dataName: () => null,
      getChildCount: () => 0,
      getChild: () => null,
    } as any;

    const result = visitor.visitDataRedefinesClause(ctx);
    expect(result).toEqual([]);
  });

  it("should construct range for the context", () => {
    const visitor = new DaCoVisitor();

    const ctx = {
      start: { line: 1, column: 0, start: 0 },
      stop: { line: 1, column: 1, start: 0, stop: 1 },
      getChildCount: () => 0,
      getChild: () => null,
      dfldRcu: () => null,
      ifRowCondition: () => null,
      tableDMLStatement: () => null,
    } as any;

    const result = visitor.visitDacoStatements(ctx);
    expect(result.length).toEqual(1);
  });

  it("should create diagnostic for the SORT TABLE context", () => {
    const visitor = new DaCoVisitor();

    const ctx = {
      start: { line: 1, column: 0, start: 0 },
      stop: { line: 1, column: 1, start: 0, stop: 1 },
      getChildCount: () => 0,
      getChild: () => null,
      dfldRcu: () => null,
      ifRowCondition: () => null,
      tableDMLStatement: () => {
        return {
          sortTableStatement: () => ({}),
        };
      },
    } as any;

    const result = visitor.visitDacoStatements(ctx);
    expect(result.length).toEqual(1);
    expect(result[0].diagnostics.length).toEqual(1);
  });

  it("should substitute with value the IF ROW clause context", () => {
    const visitor = new DaCoVisitor();

    const ctx = {
      start: { line: 1, column: 0, start: 0 },
      stop: { line: 1, column: 1, start: 0, stop: 1 },
      getChildCount: () => 0,
      getChild: () => null,
      dfldRcu: () => null,
      ifRowCondition: jest.fn().mockReturnValue({}),
      tableDMLStatement: () => null,
    } as any;

    const result = visitor.visitDacoStatements(ctx);
    expect(result.length).toEqual(1);
    expect(result[0].filler).toEqual("ZERO");
  });
});

describe("name resolver test", () => {
  let nameResolver: NameResolver;

  beforeEach(() => {
    nameResolver = new NameResolver();
  });

  it("should return undefined when parent name is missing", () => {
    nameResolver.pushName(1, "TEST");
    const result = nameResolver.getParentName(1);
    expect(result).toBeUndefined();
  });

  it("should return undefined when parent name is missing", () => {
    nameResolver.pushName(1, "TEST1");
    nameResolver.pushName(3, "TEST3");
    nameResolver.pushName(5, "TEST5");
    nameResolver.pushName(3, "TEST3-2");

    const result = nameResolver.getParentName(5);
    expect(result).toBe("TEST3-2");
  });
});
