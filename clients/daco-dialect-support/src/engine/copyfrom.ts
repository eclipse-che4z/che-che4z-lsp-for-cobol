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
import { RegularVariableDescriptor, VariableDescriptor } from "./parsing";
import { MessageService } from "./services/MessageService";

export function processCopyFrom(
  context: IDocumentProcessingContext,
  variables: VariableDescriptor[],
  messageService: MessageService,
) {
  for (let i = 0; i < variables.length; i++) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type === "COPY-FROM") {
      const copyFromVariables = findCopyFromVariables(
        variables,
        i,
        variableDescriptor.level,
        variableDescriptor.suffix,
      );
      let replacementText = " ";
      if (copyFromVariables.length > 0) {
        replacementText = copyFromVariables[0].options;
        const suffix = extractSuffix(variableDescriptor.name);
        if (suffix.length === 2) {
          copyFromVariables.slice(1).forEach((v) => {
            const updatedName = updateVariableName(v.name, suffix);
            replacementText += `.\n        ${v.level
              .toString()
              .padStart(2, "0")} ${updatedName} ${v.options}`;
          });
        } else {
          context.addDiagnostic(
            new vscode.Diagnostic(
              variableDescriptor.nameRange,
              messageService.get("validation.copy_from.retrieve.suffix"),
              vscode.DiagnosticSeverity.Error,
            ),
          );
        }
      } else {
        context.addDiagnostic(
          new vscode.Diagnostic(
            variableDescriptor.copyFromRange,
            messageService.get(
              "validation.copy_from.noMatchingVariable",
              variableDescriptor.name,
            ),
            vscode.DiagnosticSeverity.Error,
          ),
        );
      }
      context.replace(variableDescriptor.copyFromRange, replacementText);
    }
  }
}

function findCopyFromVariables(
  variables: VariableDescriptor[],
  index: number,
  level: number,
  suffix: string,
): RegularVariableDescriptor[] {
  const result: RegularVariableDescriptor[] = [];

  // Search in descending order to find the closest variables with the same suffix and higher level than the COPY-FROM variable
  for (let i = index - 1; i >= 0; i--) {
    const variableDescriptor = variables[i];
    if (variableDescriptor.type !== "DEFINITION") {
      continue;
    }
    const varSuffix = extractSuffix(variableDescriptor.name);
    if (suffix === varSuffix && variableDescriptor.level >= level) {
      result.push(variableDescriptor);
    }
  }
  if (result.length > 0) {
    result.reverse();
  } else {
    // Search in the ascending order to find variables with the same suffix and higher level than the COPY-FROM variable
    for (let i = index + 1; i < variables.length; i++) {
      const variableDescriptor = variables[i];
      if (variableDescriptor.type !== "DEFINITION") {
        continue;
      }
      const varSuffix = extractSuffix(variableDescriptor.name);
      if (suffix === varSuffix && variableDescriptor.level >= level) {
        result.push(variableDescriptor);
      }
    }
  }
  return result;
}
