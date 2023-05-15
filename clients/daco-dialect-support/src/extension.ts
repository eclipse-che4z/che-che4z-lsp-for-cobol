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
 *   Broadcom, Inc. - initial API and implementation
 */

// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";
import { registerDialect } from "@code4z/cobol-dialect-api";

let unregisterDialect = () => {};

export async function activate(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  const jar = vscode.Uri.joinPath(
    extensionUri,
    "server",
    "jar",
    "dialect-daco.jar"
  );
  unregisterDialect = await registerDialect(extensionId, {
    apiVersion: 1,
    name: "DaCo",
    description: "DaCo dialect support",
    snippets,
    jar,
  });
}

export function deactivate() {
  unregisterDialect();
}
