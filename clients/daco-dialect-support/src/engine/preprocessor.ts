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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { CopybookParser } from "../generated/CopybookParser";
import { CopybookLexer } from "../generated/CopybookLexer";
import * as antlr from "antlr4ng";
import {
  CollectingErrorListener,
  CopybookContentVisitor,
  CopybookVisitor,
  ParseError,
  VariableDescriptor,
} from "./parsing";
import { VariableLexer } from "../generated/VariableLexer";
import { VariableParser } from "../generated/VariableParser";
import { MessageService } from "./services/MessageService";

const PROC_REGEX = /PROCEDURE\s+DIVISION\.?/i;

export class DaCoPreprocessor {
  private firstCopybookLevel: number = 0;

  public async execute(
    context: IDocumentProcessingContext,
    _programUri: vscode.Uri,
    text: string,
    outputChannel: vscode.OutputChannel,
    messageService: MessageService,
  ) {
    const procMatch = PROC_REGEX.exec(text);

    const end =
      procMatch?.index !== undefined && procMatch.index > 0
        ? procMatch.index
        : text.length;

    const sliced = text.slice(0, end);
    const charStream = antlr.CharStream.fromString(sliced);

    outputChannel.appendLine(
      `Starting preprocessing. Procedure division starts at index ${end}. Processing text:\n${sliced}`,
    );

    const lexer = new CopybookLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new CopybookParser(tokenStream);
    parser.setMessageService(messageService);

    tokenStream.fill();
    for (const t of tokenStream.getTokens()) {
      console.log(
        JSON.stringify(t.text),
        parser.vocabulary.getSymbolicName(t.type),
      );
    }

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const tree = parser.startRule();
    console.log(tree.toStringTree(parser));

    const descriptors = new CopybookVisitor().visit(tree) || [];

    outputChannel.appendLine(
      `Parsing completed with ${lexerErrors.errors.length} lexer errors and ${parserErrors.errors.length} parser errors`,
    );

    this.addParsingErrors(context, [
      ...lexerErrors.errors,
      ...parserErrors.errors,
    ]);

    await Promise.all(
      descriptors.map(async (descriptor) => {
        outputChannel.appendLine(`Descriptor: ${JSON.stringify(descriptor)}`);
        const copybookName =
          descriptor.name + (descriptor.suffix ? `_${descriptor.suffix}` : "");

        const copybook = await context.resolveCopybook(
          copybookName,
          descriptor.statementRange,
          descriptor.nameRange,
        );

        if (copybook) {
          outputChannel.appendLine(
            `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
          );
          this.insertCopybookContent(
            context,
            copybook,
            descriptor.level,
            descriptor.suffix,
          );
        }
      }),
    );
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
    layoutUsage?: string,
  ) {
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
    console.log(tree.toStringTree(parser));

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
        layoutUsage,
      );
    });
  }

  private processVariableDescriptor(
    context: IDocumentProcessingContext,
    descriptor: VariableDescriptor,
    copybookLevel: number,
    layoutUsage: string | undefined,
  ) {
    if (layoutUsage) {
      const updatedName = this.updateVariableName(descriptor.name, layoutUsage);
      context.replace(descriptor.nameRange, updatedName);
    }

    if (copybookLevel != descriptor.level) {
      const updatedLevel = this.calculateLevel(copybookLevel, descriptor.level);
      const updatedLevelStr = updatedLevel.toString().padStart(2, "0");
      context.replace(descriptor.levelRange, updatedLevelStr);
    }
  }

  private updateVariableName(name: string, suffix: string) {
    return name;
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
