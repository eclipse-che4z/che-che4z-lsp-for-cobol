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
    "dialect-idms.jar",
  );
  const { registerDialect } = await getV1Api(extensionId);
  unregisterDialect = registerDialect({
    name: "IDMS",
    description: "IDMS dialect support",
    snippets,
    jar,
  });
}

export function deactivate() {
  unregisterDialect();
}
