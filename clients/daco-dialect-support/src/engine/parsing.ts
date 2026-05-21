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
import { DaCoParserVisitor } from "../generated/DaCoParserVisitor";
import {
  DacoStatementsContext,
  QualifiedDataNameContext,
  VariableUsageNameContext,
} from "../generated/DaCoParser";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}

export class CopybookDescriptor {
  constructor(
    public readonly statementRange: vscode.Range,
    public readonly nameRange: vscode.Range,
    public readonly level: number,
    public readonly name: string,
    public readonly suffix?: string,
    public readonly parentName?: string,
  ) {}
}

export class VariableDescriptor {
  constructor(
    public readonly levelRange: vscode.Range,
    public readonly level: number,
    public readonly nameRange: vscode.Range,
    public readonly name: string,
    public readonly type: "DEFINITION" | "REDEFINITION" = "DEFINITION",
  ) {}
}

export class StatementDescriptor {
  constructor(
    public readonly range: vscode.Range,
    public readonly statementRange: vscode.Range,
    public readonly type: "STATEMENT" | "VARIABLE" | "VARIABLE_USAGE",
    public readonly children: StatementDescriptor[],
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

export class NameResolver {
  private readonly nameStack: { level: number; name: string }[] = [];
  private lastLevel: number = 0;

  public getParentName(level: number): string | undefined {
    for (let i = this.nameStack.length - 1; i >= 0; i--) {
      if (this.nameStack[i].level < level) {
        return this.nameStack[i].name;
      }
    }
    return undefined;
  }

  public pushName(level: number, name: string) {
    if (this.lastLevel < level) {
      this.nameStack.push({ level, name });
      this.lastLevel = level;
    } else {
      // Pop all names with level greater than or equal to the current level
      while (
        this.nameStack.length > 0 &&
        (this.nameStack.at(-1)?.level ?? 0) >= level
      ) {
        this.nameStack.pop();
      }
      this.nameStack.push({ level, name });
      this.lastLevel = level;
    }
  }
}

export class CopybookVisitor extends CopybookParserVisitor<
  CopybookDescriptor[]
> {
  private readonly parentNameResolver: NameResolver = new NameResolver();

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
        this.parentNameResolver.getParentName(level),
      ),
      ...(super.visitChildren(ctx) ?? []),
    ];
  };

  visitVariableEntry = (ctx: VariableEntryContext): CopybookDescriptor[] => {
    const newName = ctx.DACO_COPYBOOK_IDENTIFIER()?.getText()?.toUpperCase();
    const level = Number.parseInt(ctx.LEVEL_NUMBER()?.getText() ?? "0", 10);

    if (newName) {
      this.parentNameResolver.pushName(level, newName);
    }
    return super.visitChildren(ctx) ?? [];
  };

  protected aggregateResult = concatResults;
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

  visitDataRedefinesClause? = (
    ctx: DataRedefinesClauseContext,
  ): VariableDescriptor[] => {
    const redefinitionName = ctx.dataName();

    if (redefinitionName) {
      const nameRange = constructRange(redefinitionName);
      return [
        new VariableDescriptor(
          nameRange,
          0,
          nameRange,
          redefinitionName.getText(),
          "REDEFINITION",
        ),
        ...(super.visitChildren(ctx) ?? []),
      ];
    }
    return super.visitChildren(ctx) ?? [];
  };

  protected aggregateResult = concatResults;
}

export class DaCoVisitor extends DaCoParserVisitor<StatementDescriptor[]> {
  visitDacoStatements?: (ctx: DacoStatementsContext) => StatementDescriptor[] =
    (ctx: DacoStatementsContext): StatementDescriptor[] => {
      const statements: StatementDescriptor[] = [];

      statements.push(
        new StatementDescriptor(
          constructRange(ctx),
          constructRangeFromTokens(ctx.start!, ctx.stop),
          "STATEMENT",
          this.visitChildren(ctx) ?? [],
        ),
      );
      return statements;
    };

  visitQualifiedDataName?: (
    ctx: QualifiedDataNameContext,
  ) => StatementDescriptor[] = (
    ctx: QualifiedDataNameContext,
  ): StatementDescriptor[] => {
    return [
      new StatementDescriptor(
        constructRange(ctx),
        constructRange(ctx),
        "VARIABLE",
        this.visitChildren(ctx) ?? [],
      ),
    ];
  };

  visitVariableUsageName?: (
    ctx: VariableUsageNameContext,
  ) => StatementDescriptor[] = (
    ctx: VariableUsageNameContext,
  ): StatementDescriptor[] => {
    return [
      new StatementDescriptor(
        constructRange(ctx),
        constructRange(ctx),
        "VARIABLE_USAGE",
        this.visitChildren(ctx) ?? [],
      ),
    ];
  };

  protected aggregateResult = concatResults;
}

function constructRange(ctx: ParserRuleContext): vscode.Range {
  const start = ctx.start!;
  const stop = ctx.stop;
  return constructRangeFromTokens(start, stop);
}

function constructRangeFromTokens(
  start: Token,
  stop: Token | null,
): vscode.Range {
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
