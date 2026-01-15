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
import {
  getV2Api,
  IDocumentProcessingContext,
} from "@code4z/cobol-dialect-api";
import { replaceText } from "./textchangers";

const DIALECT_NAME = "SAMPLE";

export async function activate(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  const outputChannel = vscode.window.createOutputChannel(
    "SAMPLE Dialect Support",
  );

  const v2Api = await getV2Api(extensionId);
  if (v2Api instanceof Error) {
    vscode.window.showErrorMessage(v2Api.toString());
    return;
  }

  const unregister = await v2Api.registerDialect(
    {
      name: DIALECT_NAME,
      description: "SAMPLE dialect support",
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
    async (
      context: IDocumentProcessingContext,
      programUri: vscode.Uri,
      text: string,
    ) => {
      return await handleProcessDialect(
        context,
        programUri,
        text,
        outputChannel,
      );
    },
  );

  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  context.subscriptions.push(unregister);
}

async function handleProcessDialect(
  context: IDocumentProcessingContext,
  programUri: vscode.Uri,
  text: string,
  outputChannel: vscode.OutputChannel,
): Promise<void> {
  await processDocument(context, programUri, text, outputChannel);
}

async function processDocument(
  context: IDocumentProcessingContext,
  documentUri: vscode.Uri,
  text: string,
  outputChannel: vscode.OutputChannel,
  documentParam?: string,
) {
  const startDate = new Date();
  const lines = text.split("\n");
  outputChannel.appendLine(
    `Start processing document ${documentUri.toString()}, line count: ${
      lines.length
    }`,
  );
  for (let i = 0; i < lines.length; i++) {
    await processDocumentLine(context, i, lines, outputChannel, documentParam);
  }
  const endDate = new Date();
  outputChannel.appendLine(
    `Finish processing document ${documentUri.toString()}. Processing time: ${
      endDate.getTime() - startDate.getTime()
    } mills.`,
  );
}

async function processDocumentLine(
  context: IDocumentProcessingContext,
  line: number,
  lines: string[],
  outputChannel: vscode.OutputChannel,
  param?: string,
) {
  replaceText(context, line, lines, param);

  const index = lines[line].indexOf("COPY SAMPLE");
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
        "Copybook parameters are invalid",
        vscode.DiagnosticSeverity.Error,
      );
      context.addDiagnostic(diagnostic);
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

    const statementRange = new vscode.Range(
      new vscode.Position(line, index),
      new vscode.Position(line, lines[line].length),
    );

    const copybookModel = await context.resolveCopybook(
      name,
      statementRange,
      statementRange,
    );

    if (copybookModel) {
      await processDocument(
        copybookModel.context,
        copybookModel.uri,
        copybookModel.text,
        outputChannel,
        copybookParam,
      );
    }
  }
}
