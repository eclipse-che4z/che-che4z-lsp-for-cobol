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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { extractSuffix, updateVariableName } from "./util";
import {
  CopyFromVariableDescriptor,
  RegularVariableDescriptor,
  VariableDescriptor,
} from "./model";
import { MessageService } from "./services/MessageService";

const SOURCE = "DaCo COPY-FROM generated text";

export function processCopyFrom(
  context: IDocumentProcessingContext,
  variables: VariableDescriptor[],
  messageService: MessageService,
) {
  for (let i = 0; i < variables.length; i++) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type === "COPY-FROM") {
      const name = (
        variableDescriptor.name.substring(
          0,
          Math.max(0, variableDescriptor.name.length - 2),
        ) + variableDescriptor.suffix
      ).toUpperCase();

      // Search order is defined in the dialect spec
      let copyFromVariables: VariableDescriptor[] =
        findCopyFromVariablesDescending(variables, i, name);
      if (copyFromVariables.length === 0) {
        copyFromVariables = findCopyFromVariablesAscending(variables, i, name);
      }

      const { replace, insert } = generateReplacementAndInsertTexts(
        context,
        copyFromVariables,
        messageService,
        variableDescriptor,
      );
      context.replace(variableDescriptor.copyFromRange, replace);
      if (insert.length > 0) {
        context.insert(
          variableDescriptor.copyFromRange.end.line + 1,
          insert,
          SOURCE,
        );
      }
    }
  }
}

function generateReplacementAndInsertTexts(
  context: IDocumentProcessingContext,
  variables: VariableDescriptor[],
  messageService: MessageService,
  copyFromVariable: CopyFromVariableDescriptor,
): { replace: string; insert: string } {
  let replacementText = " ";

  if (variables.length === 0) {
    context.addDiagnostic(
      new vscode.Diagnostic(
        copyFromVariable.copyFromRange,
        messageService.get(
          "validation.copy_from.noMatchingVariable",
          copyFromVariable.name,
        ),
        vscode.DiagnosticSeverity.Error,
      ),
    );
    return { replace: replacementText, insert: "" };
  }

  if (variables[0].type !== "DEFINITION") {
    return { replace: replacementText, insert: "" };
  }

  replacementText = variables[0].options;
  const delta = variables[0].level - copyFromVariable.level;
  const suffix = extractSuffix(copyFromVariable.name);

  if (suffix.length !== 2) {
    context.addDiagnostic(
      new vscode.Diagnostic(
        copyFromVariable.nameRange,
        messageService.get("validation.copy_from.retrieve.suffix"),
        vscode.DiagnosticSeverity.Error,
      ),
    );
    return { replace: replacementText, insert: "" };
  }

  let insert = "";
  for (let j = 1; j < variables.length; j++) {
    const definition = variables[j];
    if (definition.type === "DEFINITION") {
      let options = definition.options;
      const next = variables[j + 1];
      if (next?.type === "REDEFINITION") {
        options = ` REDEFINES ${updateVariableName(next.name, suffix)}`;
      }
      const updatedName = updateVariableName(definition.name, suffix);
      insert += `        ${(definition.level - delta)
        .toString()
        .padStart(2, "0")} ${updatedName} ${options}.\n`;
    }
  }

  return { replace: replacementText, insert: insert };
}

function findCopyFromVariablesDescending(
  variables: VariableDescriptor[],
  index: number,
  name: string,
): VariableDescriptor[] {
  // Search in descending order to find the closest variables with the same suffix and higher level than the COPY-FROM variable
  for (let i = index - 1; i >= 0; i--) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type !== "DEFINITION") {
      continue;
    }
    if (name === variableDescriptor.name.toUpperCase()) {
      return generateVariableArray(variables, i, index);
    }
  }

  return [];
}

function findCopyFromVariablesAscending(
  variables: VariableDescriptor[],
  index: number,
  name: string,
): VariableDescriptor[] {
  // Search in the ascending order to find variables with the same suffix and higher level than the COPY-FROM variable
  for (let i = index + 1; i < variables.length; i++) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type !== "DEFINITION") {
      continue;
    }
    if (name === variableDescriptor.name.toUpperCase()) {
      return generateVariableArray(variables, i, variables.length);
    }
  }

  return [];
}

function generateVariableArray(
  variables: VariableDescriptor[],
  start: number,
  end: number,
) {
  const result = [];
  const level = (variables[start] as RegularVariableDescriptor).level;
  result.push(variables[start]);

  for (let i = start + 1; i < end; i++) {
    const variableDescriptor = variables[i];
    if (
      variableDescriptor.type === "DEFINITION" &&
      variableDescriptor.level <= level
    ) {
      break;
    }
    if (variableDescriptor.type !== "COPY-FROM") {
      result.push(variableDescriptor);
    }
  }
  return result;
}
