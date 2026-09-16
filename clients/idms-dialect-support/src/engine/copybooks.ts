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
import * as antlr from "antlr4ng";
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { IdmsCopyLexer } from "../generated/IdmsCopyLexer";
import { IdmsCopyParser } from "../generated/IdmsCopyParser";
import { IdmsCopybookDescriptor, ParseError } from "./model";
import {
  CollectingErrorListener,
  IdmsCopybookEntry,
  IdmsCopyVisitor,
} from "./parsing";
import { addParsingErrors } from "./util";
import { MessageService } from "./services/MessageService";

const SEQUENCE_NUMBER_AREA_END = 6;
const PROGRAM_TEXT_END = 72;
const IDENTIFICATION_AREA_END = 80;
const SIX_SPACES = "      ";
const EIGHT_SPACES = "        ";
const HIGHEST_LEVEL_FOR_ADJUSTMENT = 49;
const SPECIAL_LEVELS = new Set([66, 77, 88]);

interface ResolvedVariableLevel {
  context: IDocumentProcessingContext;
  range: vscode.Range;
  level: number;
  requiresReplacement: boolean;
}

interface ParsingResult<T> {
  result: T;
  errors: ParseError[];
}

/** Resolves explicit and predefined IDMS copybooks and adjusts their data levels. */
export class IdmsCopybookPreprocessor {
  public constructor(
    private readonly outputChannel: vscode.OutputChannel,
    private readonly messageService: MessageService,
  ) {}

  public async execute(
    context: IDocumentProcessingContext,
    descriptors: IdmsCopybookDescriptor[],
  ): Promise<void> {
    for (const descriptor of descriptors) {
      const variables = await this.processCopybook(context, descriptor, []);
      this.applyLevelReplacements(variables);
    }
  }

  private analyzeCopybook(
    text: string,
    documentUri: string,
  ): ParsingResult<IdmsCopybookEntry[]> {
    const lexer = new IdmsCopyLexer(
      antlr.CharStream.fromString(this.cleanCopybook(text)),
    );
    const parser = new IdmsCopyParser(new antlr.CommonTokenStream(lexer));
    parser.setMessageService(this.messageService);

    const errorListeners = this.configureErrorListeners(lexer, parser);
    const entries = new IdmsCopyVisitor(documentUri).visit(parser.startRule());
    const errors = this.collectParsingErrors(errorListeners);

    this.logParsingResult(errors);
    return { result: entries ?? [], errors };
  }

  private configureErrorListeners(
    lexer: IdmsCopyLexer,
    parser: IdmsCopyParser,
  ): {
    lexer: CollectingErrorListener;
    parser: CollectingErrorListener;
  } {
    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();
    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    return { lexer: lexerErrors, parser: parserErrors };
  }

  private collectParsingErrors(listeners: {
    lexer: CollectingErrorListener;
    parser: CollectingErrorListener;
  }): ParseError[] {
    return [...listeners.lexer.errors, ...listeners.parser.errors];
  }

  private async processCopybook(
    context: IDocumentProcessingContext,
    descriptor: IdmsCopybookDescriptor,
    copybookStack: string[],
  ): Promise<ResolvedVariableLevel[]> {
    const name = this.normalizeCopybookName(descriptor.name);
    if (!name) {
      context.replace(descriptor.statement.range, "");
      return [];
    }

    const normalizedName = name.toUpperCase();
    if (copybookStack.includes(normalizedName)) {
      this.addCopybookError(
        context,
        descriptor,
        "IdmsCopybookVisitor.errorCircularDependency",
        name,
      );
      return [];
    }

    this.outputChannel.appendLine(`Resolving IDMS copybook '${name}'...`);
    const copybook = await context.resolveCopybook(
      name,
      descriptor.statement.range,
      descriptor.usage.range,
    );

    if (!copybook) {
      this.addCopybookError(context, descriptor, "copybook.not_found", name);
      return [];
    }

    this.outputChannel.appendLine(
      `Resolved IDMS copybook '${name}' at ${copybook.uri.toString()}`,
    );

    const { result: entries, errors } = this.analyzeCopybook(
      copybook.text,
      copybook.uri.toString(),
    );
    addParsingErrors(copybook.context, errors);

    const variables: ResolvedVariableLevel[] = [];
    const nestedStack = [...copybookStack, normalizedName];
    for (const entry of entries) {
      if (entry.kind === "VARIABLE_LEVEL") {
        variables.push({
          context: copybook.context,
          range: entry.range,
          level: entry.level,
          requiresReplacement: false,
        });
      } else {
        variables.push(
          ...(await this.processCopybook(
            copybook.context,
            entry.descriptor,
            nestedStack,
          )),
        );
      }
    }

    this.adjustLevels(variables, descriptor.level, descriptor);
    return variables;
  }

  private adjustLevels(
    variables: ResolvedVariableLevel[],
    copybookLevel: number,
    source: IdmsCopybookDescriptor,
  ): void {
    if (copybookLevel <= 0 || variables.length === 0) {
      return;
    }

    const firstLevel = variables[0].level;
    const delta = copybookLevel - firstLevel;
    for (const variable of variables) {
      const adjustedLevel = variable.level + delta;
      variable.requiresReplacement = true;

      if (adjustedLevel <= HIGHEST_LEVEL_FOR_ADJUSTMENT) {
        variable.level = adjustedLevel;
      } else if (!SPECIAL_LEVELS.has(variable.level)) {
        const diagnostic = new vscode.Diagnostic(
          variable.range,
          this.messageService.get(
            "IdmsDialect.maxAdjustmentExceed",
            adjustedLevel,
            delta,
            variable.level,
          ),
          vscode.DiagnosticSeverity.Warning,
        );
        diagnostic.relatedInformation = [
          new vscode.DiagnosticRelatedInformation(
            new vscode.Location(
              vscode.Uri.parse(source.statement.uri),
              source.statement.range,
            ),
            "Copy IDMS source",
          ),
        ];
        variable.context.addDiagnostic(diagnostic);
      }
    }
  }

  private applyLevelReplacements(variables: ResolvedVariableLevel[]): void {
    for (const variable of variables) {
      if (variable.requiresReplacement) {
        variable.context.replace(
          variable.range,
          variable.level.toString().padStart(2, "0"),
        );
      }
    }
  }

  private addCopybookError(
    context: IDocumentProcessingContext,
    descriptor: IdmsCopybookDescriptor,
    messageKey: string,
    name: string,
  ): void {
    context.addDiagnostic(
      new vscode.Diagnostic(
        descriptor.usage.range,
        this.messageService.get(messageKey, name),
        vscode.DiagnosticSeverity.Error,
      ),
    );
    context.replace(descriptor.statement.range, "");
  }

  private normalizeCopybookName(name: string | undefined): string | undefined {
    if (!name) {
      return undefined;
    }

    const trimmed = name.trim();
    const first = trimmed.at(0);
    if (
      trimmed.length >= 2 &&
      (first === "'" || first === '"') &&
      trimmed.at(-1) === first
    ) {
      return trimmed.slice(1, -1);
    }
    return trimmed;
  }

  private cleanCopybook(text: string): string {
    return text
      .split(/\r?\n/)
      .map(
        (line) =>
          SIX_SPACES.slice(0, line.length) +
          line.slice(SEQUENCE_NUMBER_AREA_END, PROGRAM_TEXT_END) +
          EIGHT_SPACES.slice(0, Math.max(0, line.length - PROGRAM_TEXT_END)) +
          line.slice(IDENTIFICATION_AREA_END),
      )
      .join("\n");
  }

  private logParsingResult(errors: ParseError[]): void {
    this.outputChannel.appendLine(
      `IDMS parsing completed with ${errors.length} error(s)`,
    );
  }
}
