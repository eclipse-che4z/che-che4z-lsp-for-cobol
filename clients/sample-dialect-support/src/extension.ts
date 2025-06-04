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

import * as vscode from "vscode";
import { getV2Api, V2Api } from "@code4z/cobol-dialect-api";

const DIALECT_NAME = "SAMPLE";

let outputChannel: vscode.OutputChannel;
let unregisterDialect = () => {};

export async function activate(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  outputChannel = vscode.window.createOutputChannel("SAMPLE Dialect Support");

  const v2Api = await getV2Api(extensionId);
  if (v2Api instanceof Error) {
    vscode.window.showErrorMessage(v2Api.toString());
    return;
  }

  const unregister = await v2Api.registerDialect(
    {
      name: DIALECT_NAME,
      description: "Sample dialect support",
      snippets,
      isCopyStatement: (statement: string) => {
        const regex = /^.*\bCOPY\s+SAMPLE(?:\s+"?'?)(\S+)?$/i;
        const match = statement.match(regex);
        if (!match) {
          return { isCopy: false };
        }
        return { isCopy: true, prefix: match[1] };
      },
    },
    async (programUri: string, text: string) => {
      return handleProcessDialect(v2Api, programUri, text);
    },
  );

  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  unregisterDialect = unregister;
}

async function handleProcessDialect(
  v2Api: V2Api,
  programUri: string,
  text: string,
): Promise<Map<string, vscode.Diagnostic[]>> {
  const lines = text.split("\n");
  const startDate = new Date();
  outputChannel.appendLine(
    `Start processing program ${programUri}, line count: ${lines.length}`,
  );
  const diagnostics = new Map<string, vscode.Diagnostic[]>();
  for (let i = 0; i < lines.length; i++) {
    await processCopybook(
      v2Api,
      i,
      lines,
      programUri,
      programUri,
      diagnostics,
      undefined,
    );
  }
  const endDate = new Date();
  outputChannel.appendLine(
    `Finish processing program ${programUri}. Processing time: ${
      endDate.getTime() - startDate.getTime()
    }`,
  );
  return diagnostics;
}

function replace(
  v2Api: V2Api,
  programUri: string,
  documentUri: string,
  line: number,
  character: number,
  text: string,
) {
  const location = new vscode.Location(
    vscode.Uri.parse(documentUri),
    new vscode.Range(
      new vscode.Position(line, character),
      new vscode.Position(line, character + text.length),
    ),
  );
  v2Api.replace(DIALECT_NAME, programUri, location, text);
}

function replaceEx(
  v2Api: V2Api,
  programUri: string,
  documentUri: string,
  line: number,
  start: number,
  end: number,
  text: string,
) {
  const location = new vscode.Location(
    vscode.Uri.parse(documentUri),
    new vscode.Range(
      new vscode.Position(line, start),
      new vscode.Position(line, end),
    ),
  );
  v2Api.replace(DIALECT_NAME, programUri, location, text);
}

async function processCopybook(
  v2Api: V2Api,
  line: number,
  lines: string[],
  programUri: string,
  documentUri: string,
  diagnostics: Map<string, vscode.Diagnostic[]>,
  param?: string,
) {
  let index = lines[line].indexOf(" AA ");
  if (index > 0) {
    replace(v2Api, programUri, documentUri, line, index, " 01 ");
  }

  index = lines[line].indexOf(" BB ");
  if (index > 0) {
    replace(v2Api, programUri, documentUri, line, index, " 05 ");
  }

  index = lines[line].indexOf(" SDATA");
  if (index > 0) {
    replaceEx(
      v2Api,
      programUri,
      documentUri,
      line,
      index,
      index + " SDATA".length,
      " PIC X(9)",
    );
  }

  if (param) {
    index = lines[line].indexOf("XXX");
    if (index > 0) {
      replace(v2Api, programUri, documentUri, line, index, `${param}`);
    }
  }

  index = lines[line].indexOf("COPY SAMPLE");
  if (index > 0) {
    const words = lines[line]
      .substring(index + "COPY SAMPLE".length)
      .split(" ")
      .filter((s) => s.length > 0);

    outputChannel.appendLine(`Found copybook: ${JSON.stringify(words)}`);
    if (words.length < 2) {
      const range = new vscode.Range(
        new vscode.Position(line, index),
        new vscode.Position(line, index + "COPY SAMPLE".length + 1),
      );

      const diagnostic = new vscode.Diagnostic(
        range,
        "Copybook parameters are ivalid",
        vscode.DiagnosticSeverity.Error,
      );
      const diagArray = diagnostics.get(documentUri) ?? [];
      diagArray.push(diagnostic);
      diagnostics.set(documentUri, diagArray);

      return;
    }

    const name = words[0];
    let copybookParam = words[1];
    if (copybookParam.endsWith(".")) {
      copybookParam = copybookParam.substring(0, copybookParam.length - 1);
      if (copybookParam === "XXX" && param) {
        copybookParam = param;
      }
    }

    const statementLocation = new vscode.Location(
      vscode.Uri.parse(documentUri),
      new vscode.Range(
        new vscode.Position(line, index),
        new vscode.Position(line, lines[line].length),
      ),
    );

    const copybookModel = await v2Api.resolveCopybook(
      DIALECT_NAME,
      programUri,
      name,
      statementLocation,
    );
    if (copybookModel.uri) {
      const copyLines = copybookModel.text.split("\n");
      for (let i = 0; i < copyLines.length; i++) {
        await processCopybook(
          v2Api,
          i,
          copyLines,
          programUri,
          copybookModel.uri,
          diagnostics,
          copybookParam,
        );
      }

      v2Api.insertCopybook(
        DIALECT_NAME,
        programUri,
        statementLocation,
        statementLocation,
        copybookModel.uri,
      );
    }
  }
}

export function deactivate() {
  unregisterDialect();
}
