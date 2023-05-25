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

import * as vscode from "vscode";
import { getV1Api } from "@code4z/cobol-dialect-api";

let unregisterDialect = () => {};

export async function activate(context: vscode.ExtensionContext) {
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
    name: "DaCo",
    description: "DaCo dialect support",
    snippets,
    jar,
  });
  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  unregisterDialect = unregister;
}

export function deactivate() {
  unregisterDialect();
}
