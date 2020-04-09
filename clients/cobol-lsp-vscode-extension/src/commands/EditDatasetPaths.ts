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
import * as vscode from "vscode";
import { PathsService, validateDatasetNames } from "../services/PathsService";

// command for "broadcom-cobol-lsp.cpy-manager.edit-dataset-paths"
export async function editDatasetPaths(pathsService: PathsService) {
    const result = await vscode.window.showInputBox({
        "ignoreFocusOut": true,
        "placeHolder": "DATASET.ONE, DATASET.TWO, ...",
        "prompt": "Provide a comma-separated list of datasets",
        "value": (await pathsService.listPathDatasets()).join(", "),
        "validateInput": validateDatasetNames,
    });

    if (result) {
        pathsService.setPathDatasets(result.split(",").map(e => e.trim()));
    }
}
