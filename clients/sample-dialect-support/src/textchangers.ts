/*
 * Copyright (c) 2025 Broadcom.
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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import * as vscode from "vscode";

interface TextChanger {
  execute(
    context: IDocumentProcessingContext,
    line: number,
    lines: string[],
    param?: string,
  ): void;
}

abstract class CommonTextChanger implements TextChanger {
  public abstract execute(
    context: IDocumentProcessingContext,
    line: number,
    lines: string[],
    param?: string,
  ): void;

  protected replace(
    context: IDocumentProcessingContext,
    line: number,
    start: number,
    end: number,
    text: string,
  ): void {
    const range = new vscode.Range(
      new vscode.Position(line, start),
      new vscode.Position(line, end),
    );
    context.replace(range, text);
  }
}

export class VariableTextChanger extends CommonTextChanger {
  public constructor(
    private readonly original: string,
    private readonly change: string,
  ) {
    super();
  }

  public execute(
    context: IDocumentProcessingContext,
    line: number,
    lines: string[],
    param?: string,
  ): void {
    let index = lines[line].indexOf(this.original);
    if (index > 0) {
      this.replace(
        context,
        line,
        index,
        index + this.original.length,
        this.change,
      );
    }
  }
}

export class ParamTextChanger extends CommonTextChanger {
  public execute(
    context: IDocumentProcessingContext,
    line: number,
    lines: string[],
    param?: string,
  ): void {
    if (param) {
      const index = lines[line].indexOf("XXX");
      if (index > 0) {
        this.replace(context, line, index, param.length, param);
      }
    }
  }
}

export class TextChangerProcessor {
  private static readonly TEXT_CHANGERS: TextChanger[] = [
    new VariableTextChanger(" AA ", " 01 "),
    new VariableTextChanger(" BB ", " 05 "),
    new VariableTextChanger(" SDATA", " PIC X(9)"),
    new ParamTextChanger(),
  ];

  public static execute(
    context: IDocumentProcessingContext,
    line: number,
    lines: string[],
    param?: string,
  ) {
    TextChangerProcessor.TEXT_CHANGERS.forEach((tc) =>
      tc.execute(context, line, lines, param),
    );
  }
}
