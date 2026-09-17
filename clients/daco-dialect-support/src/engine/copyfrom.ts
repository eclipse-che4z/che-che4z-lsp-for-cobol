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
import { IDocumentProcessingContext, Item } from "@code4z/cobol-dialect-api";
import { extractSuffix, updateVariableName } from "./util";
import {
  CopyFromVariableDescriptor,
  RegularVariableDescriptor,
  VariableDescriptor,
} from "./model";
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

      // Search order is defined in the dialect spec
      let copyFromVariables: VariableDescriptor[] =
        findCopyFromVariablesDescending(variables, i, name);
      if (copyFromVariables.length === 0) {
        copyFromVariables = findCopyFromVariablesAscending(variables, i, name);
      }

      const { replace, insert, items } = generateReplacementAndInsertTexts(
        context,
        copyFromVariables,
        messageService,
        variableDescriptor,
      );
      context.replace(variableDescriptor.copyFromRange, replace);
      if (items.length > 0) {
        context.insertWithMap(
          variableDescriptor.copyFromRange.end.line + 1,
          variableDescriptor.levelRange,
          items,
          insert,
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
): { replace: string; insert: string; items: Item[] } {
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
    return { replace: replacementText, insert: "", items: [] };
  }

  if (variables[0].type !== "DEFINITION") {
    return { replace: replacementText, insert: "", items: [] };
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
    return { replace: replacementText, insert: "", items: [] };
  }

  let insert = "";
  const items: Item[] = [];

  for (let j = 1; j < variables.length; j++) {
    const definition = variables[j];
    if (definition.type === "DEFINITION") {
      let options = definition.options;
      const next = variables[j + 1];
      if (next?.type === "REDEFINITION") {
        options = ` REDEFINES ${updateVariableName(next.name, suffix)}`;
      }
      const updatedName = updateVariableName(definition.name, suffix);

      const tokenNumber = items.length;
      const levelTokenName = `TokenLevel${tokenNumber}`;
      const levelTokenValue = `${(definition.level - delta)
        .toString()
        .padStart(2, "0")}`;

      const variableTokenName = `TokenVariable${tokenNumber}`;
      const optionsTokenName = `TokenOptions${tokenNumber}`;

      insert += `         {${levelTokenName}} {${variableTokenName}} {${optionsTokenName}}.\n`;
      items.push(
        {
          tokens: [
            {
              name: levelTokenName,
              value: levelTokenValue,
              location: new vscode.Location(
                definition.uri,
                definition.levelRange,
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: variableTokenName,
              value: updatedName,
              location: new vscode.Location(
                definition.uri,
                definition.nameRange,
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: optionsTokenName,
              value: options,
              location: new vscode.Location(
                definition.uri,
                definition.optionsRange,
              ),
            },
          ],
        },
      );
    }
  }

  return { replace: replacementText, insert: insert, items: items };
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
