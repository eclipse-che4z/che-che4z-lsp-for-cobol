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
import {
  CopyMaidContext,
  VariableEntryContext,
} from "../generated/CopybookParser";
import { VariableParserVisitor } from "../generated/VariableParserVisitor";

import {
  DataDescriptionEntryFormat1Context,
  DataRedefinesClauseContext,
} from "../generated/VariableParser";

const LEVEL_88 = "88";

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
    public prevName?: string,
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
    this.errors.push({
      line,
      column: charPositionInLine,
      message: msg,
      range: this.getRangeForSyntaxError(
        offendingSymbol,
        line,
        charPositionInLine,
      ),
    });
  }

  private getRangeForSyntaxError(
    offendingSymbol: Token | null,
    line: number,
    charPositionInLine: number,
  ) {
    const tokenLength = offendingSymbol
      ? offendingSymbol.stop - offendingSymbol.start + 1
      : 0;
    return new vscode.Range(
      line - 1,
      charPositionInLine,
      line - 1,
      charPositionInLine + tokenLength,
    );
  }
}

function concatResults<T>(r1: T[] | null, r2: T[] | null): T[] {
  return [...(r1 ?? []), ...(r2 ?? [])];
}

export class CopybookVisitor extends CopybookParserVisitor<
  CopybookDescriptor[]
> {
  prevName?: string;

  visitCopyMaid = (ctx: CopyMaidContext): CopybookDescriptor[] => {
    const layoutId = ctx.layoutId();
    if (!layoutId) {
      return super.visitChildren(ctx) ?? [];
    }

    const layoutUsage = ctx.layoutUsage();
    const name = layoutId.getText();
    const suffix = layoutUsage?.getText();

    console.log("Copybook level: " + ctx.LEVEL_NUMBER()?.getText());

    const level = Number.parseInt(ctx.LEVEL_NUMBER()?.getText() ?? "0", 10);
    const statementRange = constructRange(ctx);
    const nameRange = constructRange(layoutId);

    return [
      new CopybookDescriptor(
        statementRange,
        nameRange,
        level,
        name,
        suffix,
        this.prevName,
      ),
      ...(super.visitChildren(ctx) ?? []),
    ];
  };

  visitVariableEntry = (ctx: VariableEntryContext): CopybookDescriptor[] => {
    if (ctx.DACO_COPYBOOK_IDENTIFIER()) {
      ctx.DACO_COPYBOOK_IDENTIFIER()?.getText();

      if (ctx.levelNumber()?.getText() !== LEVEL_88) {
        this.prevName = ctx
          .DACO_COPYBOOK_IDENTIFIER()
          ?.getText()
          ?.toUpperCase();
      }
    }
    return super.visitChildren(ctx) ?? [];
  };

  protected aggregateResult(
    aggregate: CopybookDescriptor[] | null,
    nextResult: CopybookDescriptor[] | null,
  ): CopybookDescriptor[] | null {
    return concatResults(aggregate, nextResult);
  }
}

export class CopybookContentVisitor extends VariableParserVisitor<
  VariableDescriptor[]
> {
  visitDataDescriptionEntryFormat1? = (
    ctx: DataDescriptionEntryFormat1Context,
  ): VariableDescriptor[] => {
    const levelRange = constructRange(ctx.levelNumber());
    const level = Number.parseInt(ctx.levelNumber().getText());
    const entryName = ctx.entryName();
    const name = entryName?.getText() ?? "";

    if (name === "" || !entryName) {
      return super.visitChildren(ctx) ?? [];
    }
    const nameRange = constructRange(entryName);

    return [
      new VariableDescriptor(levelRange, level, nameRange, name),
      ...(super.visitChildren(ctx) ?? []),
    ];
  };

  dataRedefinesClause? = (
    ctx: DataRedefinesClauseContext,
  ): VariableDescriptor[] => {
    const redefinedName = ctx.dataName()?.getText();
    if (redefinedName) {
      //this.prevName = redefinedName.toUpperCase();
    }
    return super.visitChildren(ctx) ?? [];
  };

  protected aggregateResult(
    aggregate: VariableDescriptor[] | null,
    nextResult: VariableDescriptor[] | null,
  ): VariableDescriptor[] | null {
    return concatResults(aggregate, nextResult);
  }
}

function constructRange(ctx: ParserRuleContext): vscode.Range {
  const start = ctx.start!;
  const stop = ctx.stop;
  const startPosition = new vscode.Position(start.line - 1, start.column);
  const stopPosition =
    stop == null || start.start > stop.stop
      ? startPosition
      : new vscode.Position(
          stop.line - 1,
          stop.column + stop.stop - stop.start + 1,
        );
  return new vscode.Range(startPosition, stopPosition);
}
