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
const WRK_SECTION = /WORKING-STORAGE\s+SECTION\s*\./i;
const WRK_SUFFIX = "WRK";

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

    console.log(`Found ${descriptors.length} copybook descriptors:`);
    descriptors.forEach((descriptor) =>
      console.log(
        `Descriptor: name=${descriptor.name}, level=${descriptor.level}, suffix=${descriptor.suffix}, prevName=${descriptor.prevName}`,
      ),
    );
    await Promise.all(
      descriptors.map(async (descriptor) => {
        outputChannel.appendLine(`Descriptor: ${JSON.stringify(descriptor)}`);

        const hasWrkSuffix = descriptor.suffix?.toUpperCase() === WRK_SUFFIX;
        const copybookName =
          descriptor.name +
          (descriptor.suffix && !hasWrkSuffix ? `_${descriptor.suffix}` : "");

        const suffix = hasWrkSuffix
          ? this.extractSuffix(descriptor.prevName)
          : undefined;

        console.log(`Resolving copybook '${copybookName}'...`);
        outputChannel.appendLine(`Resolving copybook '${copybookName}'...`);
        const copybook = await context.resolveCopybook(
          copybookName,
          descriptor.statementRange,
          descriptor.nameRange,
        );

        if (copybook) {
          console.log(
            `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
          );
          outputChannel.appendLine(
            `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
          );
          this.insertCopybookContent(
            context,
            copybook,
            descriptor.level,
            suffix,
          );
        }
      }),
    );
  }

  private extractSuffix(prevName: string | undefined): string {
    if (!prevName) {
      return "";
    }
    const parts = prevName.split("-");
    if (parts.length > 1) {
      const suffix = parts.at(-1);
      if (suffix) {
        if (parts.length - 1 >= 0 && suffix.length > 1) {
          return suffix.substring(1);
        }
      }
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
        prevSuffix,
      );
    });
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

    const updatedLevel = this.calculateLevel(copybookLevel, descriptor.level);
    if (copybookLevel != descriptor.level) {
      const updatedLevelStr = updatedLevel.toString().padStart(2, "0");
      context.replace(descriptor.levelRange, updatedLevelStr);
    }
  }

  private updateVariableName(name: string, suffix: string) {
    console.log(`Updating variable name '${name}' with suffix '${suffix}'...`);
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
