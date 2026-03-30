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
  CopybookDescriptor,
  CopybookVisitor,
  ParseError,
} from "./parsing";

export class DaCoPreprocessor {
  public async execute(
    context: IDocumentProcessingContext,
    programUri: vscode.Uri,
    text: string,
    outputChannel: vscode.OutputChannel,
  ) {
    const charStream = antlr.CharStream.fromString(text);
    const lexer = new CopybookLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new CopybookParser(tokenStream);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const descriptors = new CopybookVisitor().visit(parser.startRule()) || [];

    this.addParsingErrors(context, [
      ...lexerErrors.errors,
      ...parserErrors.errors,
    ]);

    await Promise.all(
      descriptors.map(async (descriptor) => {
        outputChannel.appendLine(`Descriptor: ${JSON.stringify(descriptor)}`);
        const copybookName =
          descriptor.name + (descriptor.suffix ? `_${descriptor.suffix}` : "");

        const result = await context.resolveCopybook(
          copybookName,
          descriptor.statementRange,
          descriptor.nameRange,
        );

        if (result) {
          outputChannel.appendLine(
            `Resolved copybook '${copybookName}' at ${result.uri.toString()}`,
          );
          this.insertCopybookContent(context, result, descriptor);
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
    result: {
      context: IDocumentProcessingContext;
      uri: vscode.Uri;
      text: string;
    },
    descriptor: CopybookDescriptor,
  ) {
    throw new Error("Method not implemented.");
  }
}
