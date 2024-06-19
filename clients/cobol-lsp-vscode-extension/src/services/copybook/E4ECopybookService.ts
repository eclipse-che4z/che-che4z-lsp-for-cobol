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

export class E4ECopybookService {
  public static async getE4EAPI(): Promise<E4E | undefined> {
    const ext = vscode.extensions.getExtension(
      "BroadcomMFD.explorer-for-endevor",
    );
    if (!ext) {
      return undefined;
    }
    try {
      if (!ext.isActive) await ext.activate();
      const e4e = ext.exports;
      if (Utils.validateE4E(e4e)) return e4e;
    } catch (_err) {}
    return undefined;
  }
}
