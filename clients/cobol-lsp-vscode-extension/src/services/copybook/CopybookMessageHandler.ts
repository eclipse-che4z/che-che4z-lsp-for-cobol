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
import { outputChannel } from "../util/OutputChannel";

export async function readFileContent(
  fileUri: string,
): Promise<string | undefined> {
  const uri = vscode.Uri.parse(fileUri);
  const openFile = vscode.workspace.textDocuments.find(
    (doc) => doc.uri.toString() === fileUri,
  );
  if (openFile) {
    return openFile.getText();
  }
  try {
    const data = await vscode.workspace.fs.readFile(uri);
    const content = new TextDecoder().decode(data);
    return content;
  } catch (err) {
    outputChannel.error(
      `file/content message handler error ${fileUri} ${JSON.stringify(err)}`,
    );
    return;
  }
}

export async function resolveCopybookURI(
  documentURI: string,
  copybookName: string,
  dialectType: string,
): Promise<string | undefined> {
  const uri = vscode.Uri.parse(documentURI);

  const pgLibs = await loadProcessorGroupCopybooksLibs(uri, dialectType);

  const promises = pgLibs.map((lib) =>
    lib.resolveCopybookUri(copybookName, uri, dialectType),
  );
  const results = await Promise.allSettled(promises);
  for (const result of results) {
    if (result.status === "fulfilled" && result.value) {
      if (typeof result.value === "function") {
        const resultUri = await result.value();
        return resultUri?.toString();
      }
      return result.value.toString();
    }
  }
}
