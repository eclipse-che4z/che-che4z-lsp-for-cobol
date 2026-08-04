/*
 * Copyright (c) 2023 Broadcom.
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
import {
  getV1Api,
  getV2Api,
  IDocumentProcessingContext,
} from "@code4z/cobol-dialect-api";
import { DaCoPreprocessor } from "./engine/preprocessor";
import { MessageService } from "./engine/services/MessageService";
import { SettingsService } from "./engine/services/settings";

const COPY_REGEX = /^.*\bCOPY\s+MAID(?:\s+"?'?)(\S+)?$/i;

let unregisterDialect: () => void | Promise<void> = () => {};
const isCopyStatement = (statement: string) => {
  const match = COPY_REGEX.exec(statement);
  if (!match) {
    return { isCopy: false };
  }
  return { isCopy: true, prefix: match[1] };
};

const DIALECT_NAME = "DaCo";
const DESCRIPTION = "DaCo dialect support";

export async function activate(context: vscode.ExtensionContext) {
  await updateApiVersion(context);

  context.subscriptions.push(
    vscode.workspace.onDidChangeConfiguration(async (event) => {
      if (event.affectsConfiguration("dialect.api.version")) {
        await updateApiVersion(context);
      }
    }),
  );
}

export function deactivate(): void | Thenable<void> {
  return unregisterDialect();
}

async function updateApiVersion(context: vscode.ExtensionContext) {
  const version = SettingsService.getApiVersion();

  // The unregister callback triggers its own server round-trip (invalidateConfiguration)
  // to reanalyze open documents without the old dialect. It must fully settle before the
  // new dialect is registered, otherwise the two reanalysis requests race on the server
  // and the stale one can win, publishing empty diagnostics.
  await unregisterDialect();
  unregisterDialect = () => {};

  if (version === "legacy") {
    await v1Api(context);
  } else {
    await v2Api(context);
  }
}

async function v1Api(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  const jar = vscode.Uri.joinPath(
    extensionUri,
    "server",
    "jar",
    "dialect-daco.jar",
  );
  const v1Api = await getV1Api(extensionId);
  if (v1Api instanceof Error) {
    vscode.window.showErrorMessage(v1Api.toString());
    return;
  }
  const unregister = await v1Api.registerDialect({
    name: DIALECT_NAME,
    description: DESCRIPTION,
    snippets,
    jar,
    isCopyStatement: isCopyStatement,
  });
  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  unregisterDialect = unregister;
}

async function v2Api(context: vscode.ExtensionContext) {
  const outputChannel = vscode.window.createOutputChannel(DESCRIPTION);
  const messageService = await MessageService.create(context);
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  const v2Api = await getV2Api(extensionId);
  if (v2Api instanceof Error) {
    vscode.window.showErrorMessage(v2Api.toString());
    return;
  }
  outputChannel.appendLine(`Registering dialect with API version 2`);

  const unregister = await v2Api.registerDialect(
    {
      name: DIALECT_NAME,
      description: DESCRIPTION,
      snippets,
      isCopyStatement: isCopyStatement,
    },
    async (
      context: IDocumentProcessingContext,
      programUri: vscode.Uri,
      text: string,
    ) => {
      outputChannel.appendLine(
        `Executing preprocessor for document ${programUri.toString()}`,
      );

      const preprocessor = new DaCoPreprocessor(outputChannel, messageService);
      await preprocessor.execute(context, programUri, text);
    },
  );
  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  unregisterDialect = () => unregister.dispose();
}
