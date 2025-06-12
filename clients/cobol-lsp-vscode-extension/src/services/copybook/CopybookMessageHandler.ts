/*
 * Copyright (c) 2022 Broadcom.
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
import { loadProcessorGroupCopybooksLibs } from "../ProcessorGroups";

export async function readFileContent(fileUri: string): Promise<string> {
  const uri = vscode.Uri.parse(fileUri);
  const openFile = vscode.workspace.textDocuments.find(
    (doc) => doc.uri.toString() === fileUri,
  );
  if (openFile) {
    return openFile.getText();
  }
  const data = await vscode.workspace.fs.readFile(uri);
  const content = new TextDecoder().decode(data);
  return content;
}

export async function resolveCopybookURI(
  documentURI: string,
  copybookName: string,
  dialectType: string,
): Promise<string | undefined> {
  const uri = vscode.Uri.parse(documentURI);

  const pgLibs = await loadProcessorGroupCopybooksLibs(uri, dialectType);
  for (const pgLib of pgLibs) {
    const result = await pgLib.resolveCopybookUri(copybookName, uri);
    if (result) {
      if (typeof result === "function") {
        const resultUri = await result();
        return resultUri?.toString();
      }
      return result.toString();
    }
  }
}
