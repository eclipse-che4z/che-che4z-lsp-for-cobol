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

export const BLANK_STATEMENT = "CONTINUE";
export const BLANK_VALUE = "ZERO";
export const SPACE_VALUE = " ";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}

export class ProgramInfo {
  public readonly sections: string[] = [];
  public procedureDivisionNameStart?: number;
  public procedureDivisionNameEnd?: number;
  public copybooks: CopybookDescriptor[] = [];
  public accumulator: VariableAccumulator = new VariableAccumulator();
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

    return result.filter((d): d is VariableDescriptor => !!d && "type" in d);
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
