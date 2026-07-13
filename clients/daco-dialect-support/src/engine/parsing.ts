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
  ParserRuleContext,
  Interval,
} from "antlr4ng";
import { CopybookParserVisitor } from "../generated/CopybookParserVisitor";
import {
  CopyMaidContext,
  ProcedureDivisionContext,
  ProcedureSectionContext,
  SkipCopyMaidContext,
  VariableEntryContext,
} from "../generated/CopybookParser";
import { VariableParserVisitor } from "../generated/VariableParserVisitor";

import {
  DataDescriptionEntryFormat1Context,
  DataRedefinesClauseContext,
} from "../generated/VariableParser";
import { DaCoParserVisitor } from "../generated/DaCoParserVisitor";
import {
  DacoSectionsContext,
  DacoStatementsContext,
  QualifiedDataNameContext,
  VariableUsageNameContext,
} from "../generated/DaCoParser";
import { MessageService } from "./services/MessageService";

const BLANK_STATEMENT = "CONTINUE";
const BLANK_VALUE = "ZERO";
const SPACE_VALUE = " ";

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
    public readonly suffixRange?: vscode.Range,
    public readonly parentName?: string,
    public readonly parentNameRange?: vscode.Range,
  ) {}
}

export class CopybookDescriptorPD extends CopybookDescriptor {
  constructor(statementRange: vscode.Range) {
    super(statementRange, statementRange, 0, "");
  }
}

export type RedefinitionVariableDescriptor = {
  type: "REDEFINITION";
  nameRange: vscode.Range;
  name: string;
};

export type RegularVariableDescriptor = {
  type: "DEFINITION";
  levelRange: vscode.Range;
  level: number;
  nameRange: vscode.Range;
  name: string;
  options: string;
};

export type CopyFromVariableDescriptor = {
  type: "COPY-FROM";
  levelRange: vscode.Range;
  level: number;
  nameRange: vscode.Range;
  name: string;
  copyFromRange: vscode.Range;
  suffix: string;
};

export type VariableDescriptor =
  | RedefinitionVariableDescriptor
  | RegularVariableDescriptor
  | CopyFromVariableDescriptor;

export type DiagnosticMessage = {
  severity: vscode.DiagnosticSeverity;
  template: string;
};

export class StatementDescriptor {
  constructor(
    public readonly range: vscode.Range,
    public readonly statementRange: vscode.Range,
    public readonly type: "STATEMENT" | "VARIABLE" | "VARIABLE_USAGE",
    public readonly children: StatementDescriptor[],
    public readonly diagnostics: DiagnosticMessage[] = [],
    public readonly filler: string = BLANK_STATEMENT,
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
  private readonly nameStack: {
    level: number;
    name: string;
    range: vscode.Range;
  }[] = [];
  private lastLevel: number = 0;

  public getParentName(
    level: number,
  ): { name: string; range: vscode.Range } | undefined {
    for (let i = this.nameStack.length - 1; i >= 0; i--) {
      if (this.nameStack[i].level < level) {
        return { name: this.nameStack[i].name, range: this.nameStack[i].range };
      }
    }
    return undefined;
  }

  public pushName(level: number, name: string, range: vscode.Range) {
    if (this.lastLevel < level) {
      this.nameStack.push({ level, name, range });
      this.lastLevel = level;
    } else {
      // Pop all names with level greater than or equal to the current level
      while (
        this.nameStack.length > 0 &&
        (this.nameStack.at(-1)?.level ?? 0) >= level
      ) {
        this.nameStack.pop();
      }
      this.nameStack.push({ level, name, range });
      this.lastLevel = level;
    }
  }
}

export class VariableAccumulator {
  private readonly descriptors: (VariableDescriptor | CopybookDescriptor)[] =
    [];
  private readonly copybookDescriptors: Map<
    CopybookDescriptor,
    VariableDescriptor[]
  > = new Map();

  public generateDescriptors(): VariableDescriptor[] {
    const result: VariableDescriptor[] = [];

    for (const descriptor of this.descriptors) {
      if (descriptor instanceof CopybookDescriptor) {
        result.push(...(this.copybookDescriptors.get(descriptor) ?? []));
      } else {
        result.push(descriptor);
      }
    }

    return result;
  }

  public add(descriptor: VariableDescriptor) {
    this.descriptors.push(descriptor);
  }

  public addCopybookPlaceholder(descriptor: CopybookDescriptor) {
    this.descriptors.push(descriptor);
  }

  public insertCopybookVariables(
    descriptor: CopybookDescriptor,
    variables: VariableDescriptor[],
  ) {
    this.copybookDescriptors.set(descriptor, variables);
  }
}

type CopyFromOptions =
  | { kind: "COPY_FROM"; suffix: string }
  | { kind: "REGULAR_OPTIONS"; options: string };

export class ProgramInfoAccumulator {
  public readonly sections: string[] = [];
  public procedureDivisionNameStart?: number;
  public procedureDivisionNameEnd?: number;
}

export class CopybookVisitor extends CopybookParserVisitor<
  CopybookDescriptor[]
> {
  private readonly parentNameResolver: NameResolver = new NameResolver();
  public readonly programInfo: ProgramInfoAccumulator =
    new ProgramInfoAccumulator();

  public constructor(
    public accumulator: VariableAccumulator,
    private readonly messageService: MessageService,
  ) {
    super();
  }

  private parseCopyFromOptions(options: string): CopyFromOptions {
    const trimmed = options.trim();

    const match = /^COPY-FROM\s+([A-Z0-9]+)$/i.exec(trimmed);

    if (!match) {
      return {
        kind: "REGULAR_OPTIONS",
        options,
      };
    }

    const suffix = match[1].toUpperCase();

    if (!/^[A-Z0-9]{2}$/.test(suffix)) {
      const message = this.messageService.get(
        "validation.copy_from_suffix",
        suffix,
      );
      throw new Error(message);
    }

    return {
      kind: "COPY_FROM",
      suffix,
    };
  }

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

    const parentInfo = this.parentNameResolver.getParentName(level);
    const descriptor = new CopybookDescriptor(
      statementRange,
      nameRange,
      level,
      name,
      suffix,
      layoutUsage ? constructRange(layoutUsage) : undefined,
      parentInfo?.name,
      parentInfo?.range,
    );
    this.accumulator.addCopybookPlaceholder(descriptor);

    return [descriptor, ...(super.visitChildren(ctx) ?? [])];
  };

  visitVariableEntry = (ctx: VariableEntryContext): CopybookDescriptor[] => {
    const newName = ctx.DACO_COPYBOOK_IDENTIFIER()?.getText()?.toUpperCase();
    const level = Number.parseInt(ctx.LEVEL_NUMBER()?.getText() ?? "0", 10);

    if (newName) {
      const nameRange = constructRangeFromTokens(
        ctx.DACO_COPYBOOK_IDENTIFIER().getSymbol(),
        ctx.DACO_COPYBOOK_IDENTIFIER().getSymbol(),
      );

      this.parentNameResolver.pushName(level, newName, nameRange);

      const optionsText = createOptionsStr(ctx.variableOptionEntry());
      const parsed = this.parseCopyFromOptions(optionsText);

      if (parsed.kind === "COPY_FROM") {
        const copyFromRange = constructRange(ctx.variableOptionEntry());
        this.accumulator.add({
          levelRange: constructRangeFromTokens(
            ctx.LEVEL_NUMBER().getSymbol(),
            ctx.LEVEL_NUMBER().getSymbol(),
          ),
          level: level,
          copyFromRange: copyFromRange,
          nameRange: nameRange,
          name: newName,
          suffix: parsed.suffix,
          type: "COPY-FROM",
        });
      } else {
        this.accumulator.add({
          levelRange: constructRangeFromTokens(
            ctx.LEVEL_NUMBER().getSymbol(),
            ctx.LEVEL_NUMBER().getSymbol(),
          ),
          level: level,
          nameRange: nameRange,
          name: newName,
          type: "DEFINITION",
          options: optionsText,
        });
      }
    }
    return super.visitChildren(ctx) ?? [];
  };

  visitSkipCopyMaid = (ctx: SkipCopyMaidContext): CopybookDescriptor[] => {
    return [new CopybookDescriptorPD(constructRange(ctx))];
  };

  visitProcedureSection = (
    ctx: ProcedureSectionContext,
  ): CopybookDescriptor[] => {
    this.programInfo.sections.push(ctx.sectionName().getText().toUpperCase());
    return super.visitChildren(ctx) ?? [];
  };

  visitProcedureDivision = (
    ctx: ProcedureDivisionContext,
  ): CopybookDescriptor[] => {
    this.programInfo.procedureDivisionNameStart = ctx.PROCEDURE().symbol.line;
    this.programInfo.procedureDivisionNameEnd = ctx.DOT_FS().symbol.line;
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
      {
        levelRange: levelRange,
        level: level,
        nameRange: nameRange,
        name: name,
        type: "DEFINITION",
        options: createOptionsStr(ctx.variableOptionEntry()),
      },
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
        {
          nameRange: nameRange,
          name: redefinitionName.getText(),
          type: "REDEFINITION",
        },
        ...(super.visitChildren(ctx) ?? []),
      ];
    }
    return super.visitChildren(ctx) ?? [];
  };

  protected aggregateResult = concatResults;
}

export class DaCoVisitor extends DaCoParserVisitor<StatementDescriptor[]> {
  visitDacoSections? = (ctx: DacoSectionsContext): StatementDescriptor[] => {
    const statements: StatementDescriptor[] = [];
    statements.push(
      new StatementDescriptor(
        constructRange(ctx),
        constructRange(ctx),
        "STATEMENT",
        this.visitChildren(ctx) ?? [],
        [],
        SPACE_VALUE,
      ),
    );
    return statements;
  };

  visitDacoStatements?: (ctx: DacoStatementsContext) => StatementDescriptor[] =
    (ctx: DacoStatementsContext): StatementDescriptor[] => {
      const statements: StatementDescriptor[] = [];

      const dfldRcu = ctx.dfldRcu();
      const onSymbol = dfldRcu?.ON()?.symbol;
      const rcuSymbol = dfldRcu?.RCU()?.symbol;
      const isSortTable = ctx.tableDMLStatement()?.sortTableStatement();

      if (onSymbol && rcuSymbol) {
        const range = constructRangeFromTokens(onSymbol, rcuSymbol);
        statements.push(
          new StatementDescriptor(
            range,
            range,
            "STATEMENT",
            [],
            [],
            SPACE_VALUE,
          ),
        );
      } else {
        const diagnostics: DiagnosticMessage[] = [];
        if (isSortTable) {
          diagnostics.push({
            severity: vscode.DiagnosticSeverity.Warning,
            template: "parsers.deprecated",
          });
        }

        statements.push(
          new StatementDescriptor(
            constructRange(ctx),
            constructRange(ctx),
            "STATEMENT",
            this.visitChildren(ctx) ?? [],
            diagnostics,
            this.getFiller(ctx),
          ),
        );
      }
      return statements;
    };

  private getFiller(ctx: DacoStatementsContext): string {
    if (ctx.ifRowCondition()) {
      return BLANK_VALUE;
    }
    if (ctx.execStatement()) {
      return SPACE_VALUE;
    }
    return BLANK_STATEMENT;
  }

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

function constructRange(
  ctx: ParserRuleContext | null | undefined,
): vscode.Range {
  const start = ctx?.start;
  const stop = ctx?.stop;
  return constructRangeFromTokens(start, stop);
}

function constructRangeFromTokens(
  start: Token | null | undefined,
  stop: Token | null | undefined,
): vscode.Range {
  if (!start) {
    return new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 0),
    );
  }
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

function createOptionsStr(ctx: ParserRuleContext | null): string {
  if (!ctx) {
    return "";
  }
  const start = ctx.start?.start;
  const stop = ctx.stop?.stop;

  if (start && stop) {
    return (
      ctx.start?.inputStream?.getTextFromInterval(Interval.of(start!, stop!)) ??
      ""
    );
  }
  return "";
}
