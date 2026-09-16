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
import { IdmsLexer } from "../generated/IdmsLexer";
import { IdmsParser } from "../generated/IdmsParser";
import { MessageService } from "./services/MessageService";
import { IdmsCopybookPreprocessor } from "./copybooks";
import {
  IdmsCopybookDescriptor,
  ParseError,
  StatementDescriptor,
} from "./model";
import {
  CollectingErrorListener,
  IdmsDialectVisitor,
  IdmsTransformationVisitor,
} from "./parsing";
import { addParsingErrors } from "./util";

interface ProgramAnalysis {
  copybooks: IdmsCopybookDescriptor[];
  statements: StatementDescriptor[];
  errors: ParseError[];
}

export class IdmsPreprocessor {
  constructor(
    private readonly outputChannel: vscode.OutputChannel,
    private readonly messageService: MessageService,
  ) {}

  public async execute(
    context: IDocumentProcessingContext,
    text: string,
  ): Promise<void> {
    const analysis = this.analyzeProgram(
      text,
      context.getDocumentUri().toString(),
    );
    addParsingErrors(context, analysis.errors);

    this.processStatements(analysis.statements, context);

    const copybookPreprocessor = new IdmsCopybookPreprocessor(
      this.outputChannel,
      this.messageService,
    );
    await copybookPreprocessor.execute(context, analysis.copybooks);
  }

  private analyzeProgram(text: string, documentUri: string): ProgramAnalysis {
    const lexer = new IdmsLexer(antlr.CharStream.fromString(text));
    const parser = new IdmsParser(new antlr.CommonTokenStream(lexer));
    parser.setMessageService(this.messageService);

    const errorListeners = this.configureErrorListeners(lexer, parser);
    const tree = parser.startRule();
    const copybookVisitor = new IdmsDialectVisitor(documentUri);
    const copybooks = copybookVisitor.visit(tree) ?? [];
    copybooks.push(...copybookVisitor.collectPredefinedCopybooks(text));
    const statements = new IdmsTransformationVisitor().visit(tree) ?? [];
    const errors = [
      ...errorListeners.lexer.errors,
      ...errorListeners.parser.errors,
    ];

    this.outputChannel.appendLine(
      `IDMS parsing completed with ${errors.length} error(s)`,
    );
    return { copybooks, statements, errors };
  }

  private processStatements(
    descriptors: StatementDescriptor[],
    context: IDocumentProcessingContext,
  ): void {
    for (const descriptor of descriptors) {
      context.replace(descriptor.statementRange, descriptor.filler);
    }
  }

  private configureErrorListeners(
    lexer: IdmsLexer,
    parser: IdmsParser,
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
}
