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
  BLANK_STATEMENT,
  BLANK_VALUE,
  SPACE_VALUE,
  ParseError,
  createIdmsCopybookDescriptor,
} from "../../../engine/model";
import * as vscode from "vscode";
import { Token } from "antlr4ng";

function createToken(overrides: Partial<Token>): Token {
  return {
    text: "",
    type: 0,
    line: 1,
    column: 0,
    channel: 0,
    tokenIndex: 0,
    start: 0,
    stop: 0,
    tokenSource: null,
    inputStream: null,
    ...overrides,
  } as Token;
}

function createTerminalNode(token: Token) {
  return {
    symbol: token,
    getText: () => token.text ?? "",
  };
}

function createCopySourceContext(overrides: {
  literal?: string;
  cobolWord?: string;
  subschemaNames?: string;
}) {
  return {
    literal: () =>
      overrides.literal === undefined
        ? null
        : { getText: () => overrides.literal },
    cobolWord: () =>
      overrides.cobolWord === undefined
        ? null
        : { getText: () => overrides.cobolWord },
    SUBSCHEMA_NAMES: () =>
      overrides.subschemaNames === undefined
        ? null
        : { getText: () => overrides.subschemaNames },
  };
}

function createStatementCtx(options: {
  start: Token;
  stop: Token;
  sourceStart?: Token;
  sourceStop?: Token;
  levelToken?: Token;
  copySource?: ReturnType<typeof createCopySourceContext> | null;
  noCopyIdmsSource?: boolean;
}) {
  const copyIdmsSourceCtx = options.noCopyIdmsSource
    ? null
    : {
        start: options.sourceStart ?? options.start,
        stop: options.sourceStop ?? options.stop,
        copySource: () => options.copySource ?? null,
      };

  return {
    start: options.start,
    stop: options.stop,
    copyIdmsOptions: () => ({
      copyIdmsSource: () => copyIdmsSourceCtx,
    }),
    LEVEL_NUMBER: () =>
      options.levelToken ? createTerminalNode(options.levelToken) : null,
  } as unknown as Parameters<typeof createIdmsCopybookDescriptor>[0];
}

describe("model constants", () => {
  it("should expose the expected blank statement value", () => {
    expect(BLANK_STATEMENT).toBe("CONTINUE");
  });

  it("should expose the expected blank value", () => {
    expect(BLANK_VALUE).toBe("ZERO");
  });

  it("should expose the expected space value", () => {
    expect(SPACE_VALUE).toBe(" ");
  });

  it("should allow constructing a ParseError object", () => {
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 1),
    );
    const error: ParseError = {
      line: 1,
      column: 2,
      message: "some error",
      range,
    };

    expect(error.line).toBe(1);
    expect(error.column).toBe(2);
    expect(error.message).toBe("some error");
    expect(error.range).toBe(range);
  });
});

describe("createIdmsCopybookDescriptor", () => {
  const documentUri = "file:///program.cbl";

  it("should resolve the name from a literal copy source", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      copySource: createCopySourceContext({ literal: "'MYCOPY'" }),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.name).toBe("'MYCOPY'");
    expect(descriptor.usage.uri).toBe(documentUri);
    expect(descriptor.statement.uri).toBe(documentUri);
    expect(descriptor.insert).toBe(false);
  });

  it("should resolve the name from a cobol word when no literal is present", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      copySource: createCopySourceContext({ cobolWord: "MYCOPY" }),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.name).toBe("MYCOPY");
  });

  it("should resolve the name from subschema names when nothing else is present", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      copySource: createCopySourceContext({ subschemaNames: "SCHEMA-NAME" }),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.name).toBe("SCHEMA-NAME");
  });

  it("should return an undefined name when the copy source has no recognizable name", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      copySource: createCopySourceContext({}),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.name).toBeUndefined();
  });

  it("should return an undefined name when the copy idms source is missing", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      noCopyIdmsSource: true,
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.name).toBeUndefined();
    expect(descriptor.usage.range.start.line).toBe(0);
    expect(descriptor.usage.range.start.character).toBe(0);
  });

  it("should extract the level and level range when a level number is present", () => {
    const levelToken = createToken({ text: "05", line: 2, column: 7 });
    const ctx = createStatementCtx({
      start: createToken({ line: 2, column: 7 }),
      stop: createToken({ line: 2, column: 30 }),
      copySource: createCopySourceContext({ cobolWord: "MYCOPY" }),
      levelToken,
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.level).toBe(5);
    expect(descriptor.levelRange).toBeDefined();
    expect(descriptor.levelRange?.start.line).toBe(1);
    expect(descriptor.levelRange?.start.character).toBe(7);
    expect(descriptor.levelRange?.end.character).toBe(8);
  });

  it("should default the level to 0 and leave the level range undefined without a level number", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 1, column: 0 }),
      stop: createToken({ line: 1, column: 20 }),
      copySource: createCopySourceContext({ cobolWord: "MYCOPY" }),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.level).toBe(0);
    expect(descriptor.levelRange).toBeUndefined();
  });

  it("should derive the statement range from the whole statement context", () => {
    const ctx = createStatementCtx({
      start: createToken({ line: 4, column: 2, start: 10, stop: 12 }),
      stop: createToken({ line: 4, column: 20, start: 20, stop: 25 }),
      copySource: createCopySourceContext({ cobolWord: "MYCOPY" }),
    });

    const descriptor = createIdmsCopybookDescriptor(ctx, documentUri);

    expect(descriptor.statement.range.start.line).toBe(3);
    expect(descriptor.statement.range.start.character).toBe(2);
    expect(descriptor.statement.range.end.line).toBe(3);
    expect(descriptor.statement.range.end.character).toBe(26);
  });
});
