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

import { Uri, workspace } from "vscode";

export async function readFileContent(fileUri: string): Promise<string> {
  const uri = Uri.parse(fileUri);
  const openFile = workspace.textDocuments.find(
    (doc) => doc.uri.toString() === fileUri,
  );
  if (openFile) {
    return openFile.getText();
  }
  const data = await workspace.fs.readFile(uri);
  const content = new TextDecoder().decode(data);
  return content;
}
