/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";

export type ApiVersion = "legacy" | "new";
export const DIALECT_API_VERSION_CONFIG = "cobol-lsp.idms.dialect.api.version";

export class SettingsService {
  public static getApiVersion(): ApiVersion {
    const version = vscode.workspace
      .getConfiguration()
      .get<string>(DIALECT_API_VERSION_CONFIG, "legacy");

    if (version === "new") {
      return "new";
    }

    if (version !== "legacy") {
      vscode.window.showErrorMessage(
        `Invalid API version: '${version}'. Expected 'legacy' or 'new'. Switched to 'legacy'`,
      );
    }
    return "legacy";
  }
}
