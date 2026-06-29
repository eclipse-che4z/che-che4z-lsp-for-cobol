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
  IDocumentProcessingContext,
  Item,
  Token,
} from "@code4z/cobol-dialect-api";
import { CopybookParser } from "../generated/CopybookParser";
import { CopybookLexer } from "../generated/CopybookLexer";
import * as antlr from "antlr4ng";
import {
  CollectingErrorListener,
  CopybookContentVisitor,
  CopybookDescriptor,
  CopybookVisitor,
  DaCoVisitor,
  ParseError,
  RegularVariableDescriptor,
  StatementDescriptor,
  VariableAccumulator,
  VariableDescriptor,
} from "./parsing";
import { VariableLexer } from "../generated/VariableLexer";
import { VariableParser } from "../generated/VariableParser";
import { MessageService } from "./services/MessageService";
import { DaCoLexer } from "../generated/DaCoLexer";
import { DaCoParser } from "../generated/DaCoParser";

const PROC_REGEX = /PROCEDURE\s+DIVISION\.?/i;
const WRK_SUFFIX = "WRK";
const FILLER_NAME = "FILLER";

export class DaCoPreprocessor {
  private firstCopybookLevel: number = 0;

  constructor(
    private readonly outputChannel: vscode.OutputChannel,
    private readonly messageService: MessageService,
  ) {}

  public async execute(
    context: IDocumentProcessingContext,
    _programUri: vscode.Uri,
    text: string,
  ) {
    const accumulator = new VariableAccumulator();

    text = this.cleanup(context, text);
    const descriptors = this.collectCopybookDescriptors(
      context,
      text,
      accumulator,
    );
    await this.processCopybooks(descriptors, context, accumulator);

    const variableDescriptors = accumulator
      .generateDescriptors()
      .filter((d): d is VariableDescriptor => !!d && "type" in d);
    this.processCopyFrom(context, variableDescriptors);

    const statementDescriptors = this.collectStatementsDescriptors(
      context,
      text,
    );
    this.processStatements(statementDescriptors, context);
  }

  private cleanup(context: IDocumentProcessingContext, text: string): string {
    const dcdbPattern = /^[\s\d]{7}D-[BC]/gm;

    let lastPosition = { position: new vscode.Position(0, 0), absPosition: 0 };
    text = text.replace(dcdbPattern, (match, offset) => {
      const startPosition = this.findPosition(
        text,
        lastPosition.absPosition,
        lastPosition.position.line,
        lastPosition.position.character,
        offset,
      );
      const endPosition = this.findPosition(
        text,
        startPosition.absPosition,
        startPosition.position.line,
        startPosition.position.character,
        offset + match.length - 1,
      );
      lastPosition = endPosition;

      const replacement = " ".repeat(match.length);
      context.replace(
        new vscode.Range(startPosition.position, endPosition.position),
        replacement,
      );

      return replacement;
    });
    return text;
  }

  private findPosition(
    text: string,
    absPosition: number,
    startLine: number,
    startColumn: number,
    finishAbsPosition: number,
  ): { position: vscode.Position; absPosition: number } {
    let line = startLine;
    let col = startColumn;

    while (absPosition < finishAbsPosition) {
      if (text.charAt(absPosition) === "\n") {
        ++line;
        col = 1;
      } else {
        ++col;
      }
      absPosition++;
    }
    return {
      position: new vscode.Position(line, col),
      absPosition,
    };
  }

  private collectCopybookDescriptors(
    context: IDocumentProcessingContext,
    text: string,
    accumulator: VariableAccumulator,
  ): CopybookDescriptor[] {
    const procMatch = PROC_REGEX.exec(text);

    const end =
      procMatch?.index !== undefined && procMatch.index > 0
        ? procMatch.index
        : text.length;

    const sliced = text.slice(0, end);
    const charStream = antlr.CharStream.fromString(sliced);

    this.outputChannel.appendLine(
      `Starting preprocessing. Procedure division starts at index ${end}. Processing text:\n${sliced}`,
    );

    const lexer = new CopybookLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new CopybookParser(tokenStream);
    parser.setMessageService(this.messageService);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const tree = parser.startRule();
    const descriptors =
      new CopybookVisitor(accumulator, this.messageService).visit(tree) || [];

    this.outputChannel.appendLine(
      `Parsing completed with ${lexerErrors.errors.length} lexer errors and ${parserErrors.errors.length} parser errors`,
    );

    this.addParsingErrors(context, [
      ...lexerErrors.errors,
      ...parserErrors.errors,
    ]);

    console.log(`Found ${descriptors.length} copybook descriptors:`);
    return descriptors;
  }

  private async processCopybooks(
    descriptors: CopybookDescriptor[],
    context: IDocumentProcessingContext,
    accumulator: VariableAccumulator,
  ) {
    descriptors.forEach((descriptor) =>
      console.log(
        `Descriptor: name=${descriptor.name}, level=${descriptor.level}, suffix=${descriptor.suffix}, parentName=${descriptor.parentName}`,
      ),
    );

    for (const descriptor of descriptors) {
      this.outputChannel.appendLine(
        `Descriptor: ${JSON.stringify(descriptor)}`,
      );

      const hasWrkSuffix = descriptor.suffix?.toUpperCase() === WRK_SUFFIX;
      const copybookName =
        descriptor.name +
        (descriptor.suffix && !hasWrkSuffix ? `_${descriptor.suffix}` : "");

      const suffix = hasWrkSuffix
        ? this.extractSuffix(descriptor.parentName)
        : undefined;

      console.log(`Resolving copybook '${copybookName}'...`);
      this.outputChannel.appendLine(`Resolving copybook '${copybookName}'...`);
      const copybook = await context.resolveCopybook(
        copybookName,
        descriptor.statementRange,
        descriptor.nameRange,
      );

      if (copybook) {
        console.log(
          `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
        );
        this.outputChannel.appendLine(
          `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
        );
        const variables = this.insertCopybookContent(
          context,
          copybook,
          descriptor.level,
          suffix,
        );
        accumulator.insertCopybookVariables(descriptor, variables);
      }
    }
  }

  private processCopyFrom(
    context: IDocumentProcessingContext,
    variables: VariableDescriptor[],
  ) {
    for (let i = 0; i < variables.length; i++) {
      const variableDescriptor = variables[i];
      if (variableDescriptor.type === "COPY-FROM") {
        const copyFromVariables = this.findCopyFromVariables(
          variables,
          i,
          variableDescriptor.level,
          variableDescriptor.suffix,
        );
        let replacementText = " ";
        if (copyFromVariables.length > 0) {
          replacementText = copyFromVariables[0].options;
          const suffix = this.extractSuffixWithValidation(
            context,
            variableDescriptor.name,
            variableDescriptor.nameRange,
          );
          if (suffix) {
            copyFromVariables.slice(1).forEach((v) => {
              const updatedName = this.updateVariableName(v.name, suffix);
              replacementText += `.\n        ${v.level
                .toString()
                .padStart(2, "0")} ${updatedName} ${v.options}`;
            });
          }
        } else {
          context.addDiagnostic(
            new vscode.Diagnostic(
              variableDescriptor.copyFromRange,
              this.messageService.get(
                "validation.copy_from.noMatchingVariable",
                variableDescriptor.name,
              ),
              vscode.DiagnosticSeverity.Error,
            ),
          );
        }
        context.replace(variableDescriptor.copyFromRange, replacementText);
      }
    }
  }

  private extractSuffixWithValidation(
    context: IDocumentProcessingContext,
    name: string,
    nameRange: vscode.Range,
  ): string | undefined {
    const suffix = this.extractSuffix(name);
    if (suffix.length !== 2) {
      context.addDiagnostic(
        new vscode.Diagnostic(
          nameRange,
          this.messageService.get("validation.copy_from.retrieve.suffix"),
          vscode.DiagnosticSeverity.Error,
        ),
      );
      return undefined;
    }
    return suffix;
  }

  private findCopyFromVariables(
    variables: VariableDescriptor[],
    index: number,
    level: number,
    suffix: string,
  ): RegularVariableDescriptor[] {
    const result: RegularVariableDescriptor[] = [];

    // Search in descending order to find the closest variables with the same suffix and higher level than the COPY-FROM variable
    for (let i = index - 1; i >= 0; i--) {
      const variableDescriptor = variables[i];
      if (variableDescriptor.type !== "DEFINITION") {
        continue;
      }
      const varSuffix = this.extractSuffix(variableDescriptor.name);
      if (suffix === varSuffix && variableDescriptor.level >= level) {
        result.push(variableDescriptor);
      }
    }
    if (result.length > 0) {
      result.reverse();
    } else {
      // Search in the ascending order to find variables with the same suffix and higher level than the COPY-FROM variable
      for (let i = index + 1; i < variables.length; i++) {
        const variableDescriptor = variables[i];
        if (variableDescriptor.type !== "DEFINITION") {
          continue;
        }
        const varSuffix = this.extractSuffix(variableDescriptor.name);
        if (suffix === varSuffix && variableDescriptor.level >= level) {
          result.push(variableDescriptor);
        }
      }
    }
    return result;
  }

  private processStatements(
    descriptors: StatementDescriptor[],
    context: IDocumentProcessingContext,
  ) {
    descriptors.forEach((descriptor) =>
      console.log(
        `Statement Descriptor: type=${descriptor.type}, range=${JSON.stringify(
          descriptor.statementRange,
        )}`,
      ),
    );
    descriptors.forEach((descriptor) => {
      this.outputChannel.appendLine(
        `Statement Descriptor: ${JSON.stringify(descriptor)}`,
      );
      if (descriptor.children.length > 0) {
        context.replaceWithMap(
          descriptor.range,
          descriptor.statementRange,
          this.traverseChildren(descriptor.children),
          descriptor.filler,
        );
      } else {
        context.replace(descriptor.statementRange, descriptor.filler);
      }
      descriptor.diagnostics.forEach((d) => {
        context.addDiagnostic(
          new vscode.Diagnostic(
            descriptor.statementRange,
            this.messageService.get(d.template),
            d.severity,
          ),
        );
      });
    });
  }

  private traverseChildren(children: StatementDescriptor[]): Item[] {
    const items: Item[] = [];
    let index = 0;
    children.forEach((child) => {
      if (child.type === "VARIABLE") {
        const tokens: Token[] = [];
        const name = `VAR_${index++}`;

        if (child.children.length > 0) {
          this.createTokens(tokens, name, child.children);
        }
        const item: Item = {
          type: "VARIABLE",
          tokens,
        };
        items.push(item);
      }
    });
    return items;
  }

  private createTokens(
    tokens: Token[],
    name: string,
    children: StatementDescriptor[],
  ): Token[] {
    let index = 0;
    children.forEach((child) => {
      if (child.type === "VARIABLE_USAGE") {
        const tokenName = `${name}_USG_${index++}`;
        const token: Token = { name: tokenName, range: child.statementRange };
        tokens.push(token);
        this.createTokens(tokens, tokenName, child.children);
      }
    });
    return tokens;
  }

  private collectStatementsDescriptors(
    context: IDocumentProcessingContext,
    text: string,
  ): StatementDescriptor[] {
    const charStream = antlr.CharStream.fromString(text);
    const lexer = new DaCoLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new DaCoParser(tokenStream);
    parser.setMessageService(this.messageService);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    try {
      const tree = parser.startRule();

      this.addParsingErrors(context, [
        ...lexerErrors.errors,
        ...parserErrors.errors,
      ]);

      return new DaCoVisitor().visit(tree) || [];
    } catch (e) {
      this.outputChannel.appendLine(
        "Error during parsing: " + JSON.stringify(e),
      );
      return [];
    }
  }

  private extractSuffix(parentName: string | undefined): string {
    if (!parentName) {
      return "";
    }
    if (parentName.length > 2) {
      return parentName.substring(parentName.length - 2);
    }
    return "";
  }

  private addParsingErrors(
    context: IDocumentProcessingContext,
    errors: ParseError[],
  ) {
    errors.forEach((error) => {
      context.addDiagnostic({
        severity: vscode.DiagnosticSeverity.Error,
        message: error.message,
        range: error.range,
      });
    });
  }

  private insertCopybookContent(
    context: IDocumentProcessingContext,
    copybook: {
      context: IDocumentProcessingContext;
      uri: vscode.Uri;
      text: string;
    },
    copybookLevel: number,
    prevSuffix?: string,
  ): VariableDescriptor[] {
    const charStream = antlr.CharStream.fromString(copybook.text);
    const lexer = new VariableLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new VariableParser(tokenStream);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const tree = parser.startRule();

    this.addParsingErrors(context, [
      ...lexerErrors.errors,
      ...parserErrors.errors,
    ]);

    const descriptors = new CopybookContentVisitor().visit(tree) || [];
    descriptors.forEach((descriptor) => {
      this.processVariableDescriptor(
        copybook.context,
        descriptor,
        copybookLevel,
        prevSuffix,
      );
    });

    return descriptors;
  }

  private processVariableDescriptor(
    context: IDocumentProcessingContext,
    descriptor: VariableDescriptor,
    copybookLevel: number,
    suffix?: string,
  ) {
    if (suffix) {
      const updatedName = this.updateVariableName(descriptor.name, suffix);
      context.replace(descriptor.nameRange, updatedName);
    }

    if (descriptor.type === "DEFINITION") {
      const updatedLevel = this.calculateLevel(copybookLevel, descriptor.level);
      this.outputChannel.appendLine(
        `Processing variable '${descriptor.name}' with level ${descriptor.level}. Copybook level: ${copybookLevel}. First copybook Level: ${this.firstCopybookLevel} Updated level: ${updatedLevel}`,
      );
      if (updatedLevel != descriptor.level) {
        const updatedLevelStr = updatedLevel.toString().padStart(2, "0");
        context.replace(descriptor.levelRange, updatedLevelStr);
        descriptor.level = updatedLevel;
      }
    }
  }

  private updateVariableName(name: string, suffix: string) {
    console.log(`Updating variable name '${name}' with suffix '${suffix}'...`);
    if (name.toUpperCase() === FILLER_NAME) {
      return name;
    }

    const dashIndex = name.lastIndexOf("-");
    if (dashIndex === name.length - 4) {
      return name.substring(0, dashIndex + 2) + suffix;
    }
    return name + suffix;
  }

  private calculateLevel(copybookLevel: number, level: number): number {
    if (copybookLevel != 0) {
      if (this.firstCopybookLevel == 0) {
        this.firstCopybookLevel = level;
        return copybookLevel;
      }
      return level - this.firstCopybookLevel + copybookLevel;
    }
    return level;
  }
}
