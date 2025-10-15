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
import { DaCoPreprocessor } from "./engine/preprocessor";

export async function activate(context: vscode.ExtensionContext) {
  const outputChannel = vscode.window.createOutputChannel(
    "DaCo dialect support",
  );
  const preprocessor = new DaCoPreprocessor();

  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");

  const v2Api = await getV2Api(extensionId);
  if (v2Api instanceof Error) {
    vscode.window.showErrorMessage(v2Api.toString());
    return;
  }
  const unregister = await v2Api.registerDialect(
    {
      name: "DaCo",
      description: "DaCo dialect support",
      snippets,
      isCopyStatement: (statement: string) => {
        const regex = /^.*\bCOPY\s+MAID(?:\s+"?'?)(\S+)?$/i;
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
      preprocessor.execute(context, programUri, text, outputChannel);
    },
  );

  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  context.subscriptions.push(unregister);
}
