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
import * as vscode from "vscode";
import {
  BaseErrorListener,
  RecognitionException,
  Token,
  Recognizer,
  ATNSimulator,
  ParserRuleContext,
} from "antlr4ng";
import { CopybookParserVisitor } from "../generated/CopybookParserVisitor";
import { CopyMaidContext } from "../generated/CopybookParser";
import { VariableParserVisitor } from "../generated/VariableParserVisitor";

import { DataDescriptionEntryFormat1Context } from "../generated/VariableParser";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}

export class CopybookDescriptor {
  constructor(
    public statementRange: vscode.Range,
    public nameRange: vscode.Range,
    public level: number,
    public name: string,
    public suffix?: string,
  ) {}
}

export class VariableDescriptor {
  constructor(
    public levelRange: vscode.Range,
    public level: number,
    public nameRange: vscode.Range,
    public name: string,
  ) {}
}

export class CollectingErrorListener extends BaseErrorListener {
  public readonly errors: ParseError[] = [];

  syntaxError<S extends Token, T extends ATNSimulator>(
    _recognizer: Recognizer<T>,
    offendingSymbol: S | null,
    line: number,
    charPositionInLine: number,
    msg: string,
    _e: RecognitionException | null,
  ): void {
    const range = new vscode.Range(
      (offendingSymbol?.line ?? 1) - 1,
      offendingSymbol?.column ?? 0,
      (offendingSymbol?.line ?? 1) - 1,
      (offendingSymbol?.column ?? 0) + (offendingSymbol?.text?.length ?? 1),
    );

    this.errors.push({
      line,
      column: charPositionInLine,
      message: msg,
      range: range,
    });
  }
}

export class CopybookVisitor extends CopybookParserVisitor<
  CopybookDescriptor[]
> {
  visitCopyMaid = (ctx: CopyMaidContext): CopybookDescriptor[] => {
    if (!ctx.layoutId()) {
      return super.visitChildren(ctx) ?? [];
    }

    const layoutId = ctx.layoutId()!;
    const layoutUsage = ctx.layoutUsage();

    const name = layoutId.getText();

    const suffix = layoutUsage?.getText();

    console.log("Copybook level: " + ctx.LEVEL_NUMBER()?.getText());

    const level = Number.parseInt(ctx.LEVEL_NUMBER()?.getText() ?? "0", 10);

    const statementRange = createRange(ctx);
    const nameRange = createRange(layoutId);

    return [
      new CopybookDescriptor(statementRange, nameRange, level, name, suffix),
      ...(super.visitChildren(ctx) ?? []),
    ];
  };

  protected aggregateResult = (
    aggregate: CopybookDescriptor[] | null,
    nextResult: CopybookDescriptor[] | null,
  ): CopybookDescriptor[] | null => {
    return [...(aggregate ?? []), ...(nextResult ?? [])];
  };
}

export class CopybookContentVisitor extends VariableParserVisitor<
  VariableDescriptor[]
> {
  visitDataDescriptionEntryFormat1? = (
    ctx: DataDescriptionEntryFormat1Context,
  ): VariableDescriptor[] => {
    const levelRange = createRange(ctx.levelNumber());
    const level = Number.parseInt(ctx.levelNumber().getText());
    const entryName = ctx.entryName();
    if (!entryName) return super.visitChildren(ctx) ?? [];
    const name = entryName.getText() ?? "";

    if (name === "") {
      return super.visitChildren(ctx) ?? [];
    }
    const nameRange = createRange(ctx.entryName());

    return [
      new VariableDescriptor(levelRange, level, nameRange, name),
      ...(super.visitChildren(ctx) ?? []),
    ];
  };

  protected aggregateResult = (
    aggregate: VariableDescriptor[] | null,
    nextResult: VariableDescriptor[] | null,
  ): VariableDescriptor[] | null => {
    return [...(aggregate ?? []), ...(nextResult ?? [])];
  };
}

function createRange(ctx: ParserRuleContext): vscode.Range {
  return new vscode.Range(
    (ctx?.start?.line ?? 1) - 1,
    ctx?.start?.column ?? 0,
    (ctx?.stop?.line ?? 1) - 1,
    (ctx?.stop?.column ?? 0) + (ctx?.stop?.text?.length ?? 0),
  );
}
