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
import {
  BaseErrorListener,
  RecognitionException,
  Token,
  Recognizer,
  ATNSimulator,
} from "antlr4ng";
import { CopybookParserVisitor } from "../generated/CopybookParserVisitor";
import { CopyMaidContext } from "../generated/CopybookParser";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}

export class CopybookDescriptor {
  constructor(
    public statementRange: vscode.Range,
    public nameRange: vscode.Range,
    public level: number,
    public name: string,
    public suffix?: string,
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
    const range = new vscode.Range(
      (offendingSymbol?.line ?? 1) - 1,
      offendingSymbol?.column ?? 0,
      (offendingSymbol?.line ?? 1) - 1,
      (offendingSymbol?.column ?? 0) + (offendingSymbol?.text?.length ?? 1),
    );

    this.errors.push({
      line,
      column: charPositionInLine,
      message: msg,
      range: range,
    });
  }
}

export class CopybookVisitor extends CopybookParserVisitor<
  CopybookDescriptor[]
> {
  visitCopyMaid = (ctx: CopyMaidContext): CopybookDescriptor[] => {
    const descriptors: CopybookDescriptor[] = [];
    const layoutId = ctx.layoutId();
    if (!ctx.start || !ctx.stop) {
      return descriptors;
    }
    if (!layoutId?.start || !layoutId?.stop) {
      return descriptors;
    }
    const layoutUsage = ctx.layoutUsage();
    const name = layoutId.getText();

    const suffix = layoutUsage ? layoutUsage.SUFFIX()?.getText() : undefined;
    const level = ctx.LEVEL_NUMBER()
      ? Number.parseInt(ctx.LEVEL_NUMBER()!.getText(), 10)
      : 0;

    const statementRange = new vscode.Range(
      ctx.start.line - 1,
      ctx.start.column,
      ctx.stop.line - 1,
      ctx.stop.column,
    );

    const nameRange = new vscode.Range(
      layoutId.start.line - 1,
      layoutId.start.column,
      layoutId.stop.line - 1,
      layoutId.stop.column,
    );

    descriptors.push(
      new CopybookDescriptor(statementRange, nameRange, level, name, suffix),
    );
    return descriptors;
  };
}
