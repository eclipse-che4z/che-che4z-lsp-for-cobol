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
} from "./parsing";
import { MessageService } from "./services/MessageService";

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

      let copyFromVariables: VariableDescriptor[] =
        findCopyFromVariablesDescending(variables, i, name);
      if (copyFromVariables.length === 0) {
        copyFromVariables = findCopyFromVariablesAscending(variables, i, name);
      }

      const replacementText = generateReplacementText(
        context,
        copyFromVariables,
        messageService,
        variableDescriptor,
      );
      context.replace(variableDescriptor.copyFromRange, replacementText);
    }
  }
}

function generateReplacementText(
  context: IDocumentProcessingContext,
  variables: VariableDescriptor[],
  messageService: MessageService,
  copyFromVariable: CopyFromVariableDescriptor,
): string {
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
    return replacementText;
  }

  if (variables[0].type !== "DEFINITION") {
    return replacementText;
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
    return replacementText;
  }

  for (let j = 1; j < variables.length; j++) {
    const definition = variables[j];
    if (definition.type === "DEFINITION") {
      let options = definition.options;
      if (
        j < variables.length - 1 &&
        variables[j + 1].type === "REDEFINITION"
      ) {
        options = ` REDEFINES ${updateVariableName(
          variables[j + 1].name,
          suffix,
        )}`;
      }
      const updatedName = updateVariableName(definition.name, suffix);
      replacementText += `.\n        ${(definition.level - delta)
        .toString()
        .padStart(2, "0")} ${updatedName} ${options}`;
    }
  }

  return replacementText;
}

function findCopyFromVariablesDescending(
  variables: VariableDescriptor[],
  index: number,
  name: string,
): VariableDescriptor[] {
  let position = -1;

  // Search in descending order to find the closest variables with the same suffix and higher level than the COPY-FROM variable
  for (let i = index - 1; i >= 0; i--) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type !== "DEFINITION") {
      continue;
    }
    if (name === variableDescriptor.name.toUpperCase()) {
      position = i;
      break;
    }
  }
  const result = [];
  if (position >= 0) {
    const level = (variables[position] as RegularVariableDescriptor).level;
    result.push(variables[position]);

    for (let i = position + 1; i < index; i++) {
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
  }

  return result;
}

function findCopyFromVariablesAscending(
  variables: VariableDescriptor[],
  index: number,
  name: string,
): VariableDescriptor[] {
  let position = -1;

  // Search in the ascending order to find variables with the same suffix and higher level than the COPY-FROM variable
  for (let i = index + 1; i < variables.length; i++) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type !== "DEFINITION") {
      continue;
    }
    if (name === variableDescriptor.name.toUpperCase()) {
      position = i;
      break;
    }
  }
  const result = [];
  if (position >= 0) {
    const level = (variables[position] as RegularVariableDescriptor).level;
    result.push(variables[position]);

    for (let i = position + 1; i < variables.length; i++) {
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
  }

  return result;
}
