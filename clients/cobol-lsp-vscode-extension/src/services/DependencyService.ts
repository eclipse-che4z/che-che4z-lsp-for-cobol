/*
 * Copyright (c) 2020 Broadcom.
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

import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";

export interface DependenciesDesc {
    programName: string;
    copybooks: string[];
}

export function loadDepFile(depFileUri: vscode.Uri): DependenciesDesc {
    const copybooks: string[] = fs.readFileSync(depFileUri.fsPath).toString().split("\n")
        .filter(e => e.trim().length > 0)
        .map(e => e.trim());
    const programName: string = path.basename(depFileUri.fsPath, ".dep");
    return { copybooks, programName };
}
