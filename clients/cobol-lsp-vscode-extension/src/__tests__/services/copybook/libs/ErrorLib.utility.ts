/*
 * Copyright (c) 2025 Broadcom.
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

import CopybookLib from "../../../../services/copybookLibs/CopybookLib";
import * as vscode from "vscode";

export class ErrorLib implements CopybookLib {
  resolveCopybookUri(
    _copybookName: string,
    _documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<vscode.Uri | (() => Promise<vscode.Uri | undefined>) | undefined> {
    return Promise.reject(new Error("Resolve error"));
  }
  listCopybooks(
    _documentUri: vscode.Uri,
    _dialect: string,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    return Promise.reject(new Error("List error"));
  }
}
