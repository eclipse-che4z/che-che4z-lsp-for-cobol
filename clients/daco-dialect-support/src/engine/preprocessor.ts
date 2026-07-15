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
import * as antlr from "antlr4ng";
import { CollectingErrorListener, StatementsVisitor } from "./parsing";
import { MessageService } from "./services/MessageService";
import { StatementsLexer } from "../generated/StatementsLexer";
import { StatementsParser } from "../generated/StatementsParser";
import { processCopyFrom } from "./copyfrom";
import { CopybookPreprocessor } from "./copybook";
import { addParsingErrors } from "./util";
import { generatePredefinedSections } from "./predefined";
import { StatementDescriptor } from "./model";

export class DaCoPreprocessor {
  private readonly copybookPreprocessor: CopybookPreprocessor;

  constructor(
    private readonly outputChannel: vscode.OutputChannel,
    private readonly messageService: MessageService,
  ) {
    this.copybookPreprocessor = new CopybookPreprocessor(
      this.messageService,
      outputChannel,
    );
  }

  public async execute(
    context: IDocumentProcessingContext,
    _programUri: vscode.Uri,
    text: string,
  ) {
    text = this.cleanup(context, text);
    const programInfo = await this.copybookPreprocessor.execute(context, text);

    processCopyFrom(
      context,
      programInfo.accumulator.generateDescriptors(),
      this.messageService,
    );
    generatePredefinedSections(
      context,
      programInfo.sections,
      programInfo.procedureDivisionNameEnd,
    );

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
    const lexer = new StatementsLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new StatementsParser(tokenStream);
    parser.setMessageService(this.messageService);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    try {
      const tree = parser.startRule();

      addParsingErrors(context, [
        ...lexerErrors.errors,
        ...parserErrors.errors,
      ]);

      return new StatementsVisitor().visit(tree) || [];
    } catch (e) {
      this.outputChannel.appendLine(
        "Error during parsing: " + JSON.stringify(e),
      );
      return [];
    }
  }
}
