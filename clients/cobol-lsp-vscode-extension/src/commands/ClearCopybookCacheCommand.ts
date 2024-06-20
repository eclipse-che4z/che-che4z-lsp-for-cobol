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

import * as path from "node:path";
import * as vscode from "vscode";
import { FileType } from "vscode";
import {
  CLEARING_COPYBOOK_CACHE,
  COPYBOOK_CACHE_CLEARED_INFO,
  COPYBOOKS_FOLDER,
  E4E_FOLDER,
  ZOWE_FOLDER,
} from "../constants";

/**
 * Clears the downloaded copybook cache folder ({globalStoragePath}/.zowe/.copybooks).
 *
 */
export function clearCache(uri: vscode.Uri) {
  vscode.window.setStatusBarMessage(
    CLEARING_COPYBOOK_CACHE,
    Promise.resolve().then(
      () => {
        const zoweFileUri = uri.with({
          path: path.join(uri.fsPath, ZOWE_FOLDER, COPYBOOKS_FOLDER),
        });
        const e4eFileUri = uri.with({
          path: path.join(uri.fsPath, E4E_FOLDER, COPYBOOKS_FOLDER),
        });
        deleteFolderContent(vscode.Uri.file(zoweFileUri.fsPath));
        deleteFolderContent(vscode.Uri.file(e4eFileUri.fsPath));
        vscode.window.showInformationMessage(COPYBOOK_CACHE_CLEARED_INFO);
      },
      () =>
        vscode.window.showInformationMessage(
          "Encountered problem while clearing copybook cache",
        ),
    ),
  );
}

function deleteFolderContent(fileUri: vscode.Uri) {
  return vscode.workspace.fs
    .readDirectory(fileUri)
    .then((value: [string, FileType][]) => {
      value.forEach((val) => {
        vscode.workspace.fs.delete(
          fileUri.with({ path: path.join(fileUri.fsPath, val[0]) }),
          { recursive: true },
        );
      });
    });
}
