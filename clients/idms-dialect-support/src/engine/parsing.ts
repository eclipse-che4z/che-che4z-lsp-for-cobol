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
import {
  BaseErrorListener,
  RecognitionException,
  Token,
  Recognizer,
  ATNSimulator,
  TerminalNode,
} from "antlr4ng";
import { IdmsParserVisitor } from "../generated/IdmsParserVisitor";
import { CopyIdmsStatementContext as ProgramCopyIdmsStatementContext } from "../generated/IdmsParser";
import { IdmsCopyParserVisitor } from "../generated/IdmsCopyParserVisitor";
import {
  CopyIdmsStatementContext as CopybookCopyIdmsStatementContext,
  DataDescriptionEntryFormat1Context,
  DataDescriptionEntryFormat1Level77Context,
  DataDescriptionEntryFormat2Context,
  DataDescriptionEntryFormat3Context,
} from "../generated/IdmsCopyParser";
import {
  IdmsCopybookDescriptor,
  ParseError,
  createIdmsCopybookDescriptor,
} from "./model";
import { constructRangeFromTokens } from "./util";

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
  if (!r1?.length) {
    return r2 ?? [];
  }

  for (const item of r2 ?? []) {
    r1.push(item);
  }
  return r1;
}

/** A data level or nested COPY IDMS statement, in source order. */
export type IdmsCopybookEntry =
  | {
      kind: "VARIABLE_LEVEL";
      level: number;
      range: vscode.Range;
    }
  | {
      kind: "COPYBOOK";
      descriptor: IdmsCopybookDescriptor;
    };

/** Collects explicit COPY IDMS statements from a COBOL program. */
export class IdmsDialectVisitor extends IdmsParserVisitor<
  IdmsCopybookDescriptor[]
> {
  public constructor(private readonly documentUri: string) {
    super();
  }

  visitCopyIdmsStatement = (
    ctx: ProgramCopyIdmsStatementContext,
  ): IdmsCopybookDescriptor[] => [
    createIdmsCopybookDescriptor(ctx, this.documentUri),
  ];

  protected aggregateResult = concatResults;
}

/** Collects data levels and nested COPY IDMS statements from an IDMS copybook. */
export class IdmsCopyVisitor extends IdmsCopyParserVisitor<
  IdmsCopybookEntry[]
> {
  public constructor(private readonly documentUri: string) {
    super();
  }

  visitCopyIdmsStatement = (
    ctx: CopybookCopyIdmsStatementContext,
  ): IdmsCopybookEntry[] => [
    {
      kind: "COPYBOOK",
      descriptor: createIdmsCopybookDescriptor(ctx, this.documentUri),
    },
  ];

  visitDataDescriptionEntryFormat1 = (
    ctx: DataDescriptionEntryFormat1Context,
  ): IdmsCopybookEntry[] =>
    this.createVariableLevel(ctx.levelNumber().LEVEL_NUMBER());

  visitDataDescriptionEntryFormat2 = (
    ctx: DataDescriptionEntryFormat2Context,
  ): IdmsCopybookEntry[] => this.createVariableLevel(ctx.LEVEL_NUMBER_66());

  visitDataDescriptionEntryFormat1Level77 = (
    ctx: DataDescriptionEntryFormat1Level77Context,
  ): IdmsCopybookEntry[] => this.createVariableLevel(ctx.LEVEL_NUMBER_77());

  visitDataDescriptionEntryFormat3 = (
    ctx: DataDescriptionEntryFormat3Context,
  ): IdmsCopybookEntry[] => this.createVariableLevel(ctx.LEVEL_NUMBER_88());

  protected aggregateResult = concatResults;

  private createVariableLevel(token: TerminalNode | null): IdmsCopybookEntry[] {
    if (!token) {
      return [];
    }

    return [
      {
        kind: "VARIABLE_LEVEL",
        level: Number.parseInt(token.getText(), 10),
        range: constructRangeFromTokens(token.symbol, token.symbol),
      },
    ];
  }
}
