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
import {
  IdmsStatementsContext,
  CopyIdmsStatementContext as ProgramCopyIdmsStatementContext,
  IdmsRecordLocationParagraphContext,
  IdmsSectionsContext,
  MapSectionContext,
  SchemaSectionContext,
} from "../generated/IdmsParser";
import { IdmsCopyParserVisitor } from "../generated/IdmsCopyParserVisitor";
import {
  CopyIdmsStatementContext as CopybookCopyIdmsStatementContext,
  DataDescriptionEntryFormat1Context,
  DataDescriptionEntryFormat1Level77Context,
  DataDescriptionEntryFormat2Context,
  DataDescriptionEntryFormat3Context,
} from "../generated/IdmsCopyParser";
import {
  BLANK_STATEMENT,
  IdmsCopybookDescriptor,
  ParseError,
  SPACE_VALUE,
  StatementDescriptor,
  createIdmsCopybookDescriptor,
} from "./model";
import { constructRange, constructRangeFromTokens } from "./util";

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

const DEFAULT_RECORD_PLACEMENT = "WORKING-STORAGE";
const SUBSCHEMA_COPYBOOK = "SUBSCHEMA-DESCRIPTION";
const MAPS_COPYBOOK = "MAPS";

/** Collects explicit and predefined IDMS copybooks from a COBOL program. */
export class IdmsDialectVisitor extends IdmsParserVisitor<
  IdmsCopybookDescriptor[]
> {
  private recordsManual = false;
  private recordsPlacement = DEFAULT_RECORD_PLACEMENT;
  private schemaSectionPresent = false;
  private mapSectionPresent = false;

  public constructor(private readonly documentUri: string) {
    super();
  }

  visitCopyIdmsStatement = (
    ctx: ProgramCopyIdmsStatementContext,
  ): IdmsCopybookDescriptor[] => [
    createIdmsCopybookDescriptor(ctx, this.documentUri),
  ];

  visitIdmsRecordLocationParagraph = (
    ctx: IdmsRecordLocationParagraphContext,
  ): IdmsCopybookDescriptor[] => {
    const withinClause = ctx.withinClause();
    if (withinClause.MANUAL()) {
      this.recordsManual = true;
    } else {
      const withinEntry = withinClause.withinEntry();
      if (withinEntry?.LINKAGE()) {
        this.recordsPlacement = "LINKAGE";
      } else if (withinEntry?.WORKING_STORAGE()) {
        this.recordsPlacement = DEFAULT_RECORD_PLACEMENT;
      }
    }
    return [];
  };

  visitSchemaSection = (
    _ctx: SchemaSectionContext,
  ): IdmsCopybookDescriptor[] => {
    this.schemaSectionPresent = true;
    return [];
  };

  visitMapSection = (_ctx: MapSectionContext): IdmsCopybookDescriptor[] => {
    this.mapSectionPresent = true;
    return [];
  };

  public collectPredefinedCopybooks(text: string): IdmsCopybookDescriptor[] {
    if (this.recordsManual) {
      return [];
    }

    const sectionPattern = new RegExp(
      `${this.recordsPlacement}\\s+SECTION`,
      "gi",
    );
    let match = sectionPattern.exec(text);
    while (match && !this.isSectionHeader(text, match.index)) {
      match = sectionPattern.exec(text);
    }
    if (!match) {
      return [];
    }

    const usageRange = this.rangeAt(
      text,
      match.index,
      match.index + match[0].length,
    );
    const descriptors: IdmsCopybookDescriptor[] = [];
    if (this.schemaSectionPresent) {
      descriptors.push(
        this.createPredefinedDescriptor(SUBSCHEMA_COPYBOOK, usageRange),
      );
    }
    if (this.mapSectionPresent) {
      descriptors.push(
        this.createPredefinedDescriptor(MAPS_COPYBOOK, usageRange),
      );
    }
    return descriptors;
  }

  protected aggregateResult = concatResults;

  private createPredefinedDescriptor(
    name: string,
    usageRange: vscode.Range,
  ): IdmsCopybookDescriptor {
    return {
      name,
      usage: {
        uri: this.documentUri,
        range: usageRange,
      },
      statement: {
        uri: this.documentUri,
        range: new vscode.Range(
          usageRange.end.line + 1,
          0,
          usageRange.end.line + 1,
          0,
        ),
      },
      levelRange: undefined,
      level: 0,
    };
  }

  private rangeAt(
    text: string,
    startOffset: number,
    endOffset: number,
  ): vscode.Range {
    let line = 0;
    let character = 0;
    let start: vscode.Position | undefined;

    for (let offset = 0; offset < endOffset; offset++) {
      if (offset === startOffset) {
        start = new vscode.Position(line, character);
      }

      if (text[offset] === "\n") {
        line++;
        character = 0;
      } else if (text[offset] !== "\r" || text[offset + 1] !== "\n") {
        character++;
      }
    }

    const end = new vscode.Position(line, character);
    return new vscode.Range(start ?? end, end);
  }

  private isSectionHeader(text: string, offset: number): boolean {
    const lineStart = text.lastIndexOf("\n", offset - 1) + 1;
    const prefix = text.slice(lineStart, offset);
    const areaAPrefix = prefix.length >= 7 ? prefix.slice(7) : prefix;
    return areaAPrefix.trim().length === 0;
  }
}

/** Collects text transformations required before COBOL parsing. */
export class IdmsTransformationVisitor extends IdmsParserVisitor<
  StatementDescriptor[]
> {
  visitIdmsSections = (ctx: IdmsSectionsContext): StatementDescriptor[] => {
    const start = ctx.start?.start;
    const stop = ctx.stop?.stop;
    if (start === undefined || stop === undefined || stop < start) {
      return [];
    }

    const range = constructRange(ctx);
    return [
      new StatementDescriptor(
        range,
        range,
        "STATEMENT",
        this.visitChildren(ctx) ?? [],
        SPACE_VALUE,
      ),
    ];
  };

  visitIdmsStatements = (ctx: IdmsStatementsContext): StatementDescriptor[] => {
    if (ctx.imperativeStatementCall()) {
      return [];
    }

    const range = constructRange(ctx);
    return [
      new StatementDescriptor(
        range,
        range,
        "STATEMENT",
        this.visitChildren(ctx) ?? [],
        BLANK_STATEMENT,
      ),
    ];
  };

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
