/*
 * Copyright (c) 2024 Broadcom.
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
import { E4E } from "../../type/e4eApi.d";
import { Utils } from "../util/Utils";

async function safeActivate(ext: vscode.Extension<any>) {
  try {
    return await ext.activate();
  } catch (_) {}
}

async function extractApi(
  ext: vscode.Extension<any>,
): Promise<E4E | undefined> {
  const e4e = ext.isActive ? ext.exports : await safeActivate(ext);
  if (!Utils.validateE4E(e4e)) return undefined;
  return e4e;
}

function asE4E(e4e: E4E | undefined) {
  if (e4e) return { e4e };
  return undefined;
}

export async function getE4EAPI(): Promise<
  undefined | { e4e: E4E } | { futureE4E: Promise<undefined | { e4e: E4E }> }
> {
  const e4eExt = "BroadcomMFD.explorer-for-endevor";
  const ext = vscode.extensions.getExtension(e4eExt);
  if (ext) {
    return asE4E(await extractApi(ext));
  }
  return {
    futureE4E: new Promise((res, _) => {
      const extAdded = vscode.extensions.onDidChange(() => {
        const ext = vscode.extensions.getExtension(e4eExt);
        if (!ext) return;
        extAdded.dispose();
        extractApi(ext).then((e4e) => res(asE4E(e4e)));
      });
    }),
  };
}
