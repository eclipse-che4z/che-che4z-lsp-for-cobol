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
import {
  CLEARING_COPYBOOK_CACHE,
  COPYBOOK_CACHE_CLEARED_INFO,
  COPYBOOKS_FOLDER,
  E4E_FOLDER,
  ZOWE_FOLDER,
} from "../constants";

/**
 * Clears the downloaded copybook cache folder ({globalStoragePath}/zowe/copybooks).
 *
 */
export function clearCache(uri: vscode.Uri) {
  const deletePromise = (async () => {
    const zowe = await deleteFolderContent(
      vscode.Uri.joinPath(uri, ZOWE_FOLDER, COPYBOOKS_FOLDER),
    );
    const e4e = await deleteFolderContent(
      vscode.Uri.joinPath(uri, E4E_FOLDER, COPYBOOKS_FOLDER),
    );
    const results = await Promise.allSettled([...zowe, ...e4e]);
    if (results.find((r) => r.status === "rejected"))
      vscode.window.showInformationMessage(
        "Encountered problem while clearing copybook cache",
      );
    else vscode.window.showInformationMessage(COPYBOOK_CACHE_CLEARED_INFO);
  })();
  vscode.window.setStatusBarMessage(CLEARING_COPYBOOK_CACHE, deletePromise);
  return deletePromise;
}

async function deleteFolderContent(fileUri: vscode.Uri) {
  const files = await vscode.workspace.fs.readDirectory(fileUri);
  return files.map(([name, _]) =>
    vscode.workspace.fs.delete(vscode.Uri.joinPath(fileUri, name), {
      recursive: true,
      useTrash: false,
    }),
  );
}
