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

import * as vscode from "vscode";
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { Interval, ParserRuleContext, Token } from "antlr4ng";
import {
  addParsingErrors,
  constructRange,
  constructRangeFromTokens,
  createOptionsStr,
  extractLevelRange,
  tryParseInt,
} from "../../../engine/util";
import { ParseError } from "../../../engine/model";

jest.mock("vscode");

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

describe("tryParseInt", () => {
  it("should return undefined for undefined input", () => {
    expect(tryParseInt(undefined)).toBeUndefined();
  });

  it("should return undefined for non-numeric input", () => {
    expect(tryParseInt("abc")).toBeUndefined();
  });

  it("should parse a valid integer string", () => {
    expect(tryParseInt("42")).toBe(42);
  });
});

describe("addParsingErrors", () => {
  it("should add a diagnostic for each parse error", () => {
    const addDiagnostic = jest.fn();
    const context = {
      addDiagnostic,
    } as unknown as IDocumentProcessingContext;
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 1),
    );
    const errors: ParseError[] = [
      { line: 1, column: 1, message: "bad token", range },
    ];

    addParsingErrors(context, errors);

    expect(addDiagnostic).toHaveBeenCalledTimes(1);
    expect(addDiagnostic).toHaveBeenCalledWith({
      severity: vscode.DiagnosticSeverity.Error,
      message: "bad token",
      range,
    });
  });

  it("should do nothing when there are no errors", () => {
    const addDiagnostic = jest.fn();
    const context = {
      addDiagnostic,
    } as unknown as IDocumentProcessingContext;

    addParsingErrors(context, []);

    expect(addDiagnostic).not.toHaveBeenCalled();
  });
});

describe("constructRangeFromTokens", () => {
  it("should return a zero range when start is missing", () => {
    const range = constructRangeFromTokens(null, null);

    expect(range.start.line).toBe(0);
    expect(range.start.character).toBe(0);
    expect(range.end.line).toBe(0);
    expect(range.end.character).toBe(0);
  });

  it("should use the start position for both ends when stop is missing", () => {
    const start = createToken({ line: 3, column: 5 });

    const range = constructRangeFromTokens(start, null);

    expect(range.start.line).toBe(2);
    expect(range.start.character).toBe(5);
    expect(range.end.line).toBe(2);
    expect(range.end.character).toBe(5);
  });

  it("should use the start position for both ends when stop is before start", () => {
    const start = createToken({ line: 3, column: 5, start: 10, stop: 15 });
    const stop = createToken({ line: 1, column: 0, start: 0, stop: 2 });

    const range = constructRangeFromTokens(start, stop);

    expect(range.start.line).toBe(2);
    expect(range.start.character).toBe(5);
    expect(range.end.line).toBe(2);
    expect(range.end.character).toBe(5);
  });

  it("should compute the end position from the stop token", () => {
    const start = createToken({ line: 1, column: 0, start: 0, stop: 3 });
    const stop = createToken({ line: 1, column: 5, start: 5, stop: 7 });

    const range = constructRangeFromTokens(start, stop);

    expect(range.start.line).toBe(0);
    expect(range.start.character).toBe(0);
    expect(range.end.line).toBe(0);
    expect(range.end.character).toBe(8);
  });
});

describe("constructRange", () => {
  it("should return a zero range for a null context", () => {
    const range = constructRange(null);

    expect(range.start.line).toBe(0);
    expect(range.start.character).toBe(0);
  });

  it("should return a zero range for an undefined context", () => {
    const range = constructRange(undefined);

    expect(range.start.line).toBe(0);
    expect(range.start.character).toBe(0);
  });

  it("should derive the range from the context's start and stop tokens", () => {
    const ctx = new ParserRuleContext(null);
    ctx.start = createToken({ line: 2, column: 1, start: 1, stop: 3 });
    ctx.stop = createToken({ line: 2, column: 5, start: 5, stop: 6 });

    const range = constructRange(ctx);

    expect(range.start.line).toBe(1);
    expect(range.start.character).toBe(1);
    expect(range.end.line).toBe(1);
    expect(range.end.character).toBe(7);
  });
});

describe("extractLevelRange", () => {
  it("should derive a range spanning the token text on a single line", () => {
    const token = createToken({ text: "05", line: 3, column: 7 });

    const range = extractLevelRange(token);

    expect(range.start.line).toBe(2);
    expect(range.start.character).toBe(7);
    expect(range.end.line).toBe(2);
    expect(range.end.character).toBe(8);
  });

  it("should collapse to the start position when the token has no text", () => {
    const token = createToken({ text: undefined, line: 1, column: 4 });

    const range = extractLevelRange(token);

    expect(range.start.character).toBe(4);
    expect(range.end.character).toBe(3);
  });
});

describe("createOptionsStr", () => {
  it("should return an empty string for a null context", () => {
    expect(createOptionsStr(null)).toBe("");
  });

  it("should return an empty string when start or stop token is missing", () => {
    const ctx = new ParserRuleContext(null);
    ctx.start = null;
    ctx.stop = null;

    expect(createOptionsStr(ctx)).toBe("");
  });

  it("should extract the text between the start and stop tokens", () => {
    const getTextFromInterval = jest
      .fn()
      .mockImplementation(
        (interval: Interval) => `[${interval.start}-${interval.stop}]`,
      );
    const inputStream = {
      getTextFromInterval,
    } as unknown as Token["inputStream"];
    const ctx = new ParserRuleContext(null);
    ctx.start = createToken({ start: 2, stop: 4, inputStream });
    ctx.stop = createToken({ start: 6, stop: 9, inputStream });

    const result = createOptionsStr(ctx);

    expect(result).toBe("[2-9]");
    expect(getTextFromInterval).toHaveBeenCalledWith(Interval.of(2, 9));
  });

  it("should return an empty string when the input stream is unavailable", () => {
    const ctx = new ParserRuleContext(null);
    ctx.start = createToken({ start: 2, stop: 4, inputStream: null });
    ctx.stop = createToken({ start: 6, stop: 9, inputStream: null });

    expect(createOptionsStr(ctx)).toBe("");
  });
});
