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
import {PATHS_ZOWE, SETTINGS_SECTION} from "../constants";

export class PathsService {

    async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_SECTION).has(PATHS_ZOWE)) {
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE);
    }

    setPathDatasets(paths: string[]) {
        vscode.workspace.getConfiguration(SETTINGS_SECTION).update(PATHS_ZOWE, paths);
    }
}

export function validateDatasetNames(inputValue: string): string | undefined {
    const datasets: string[] = inputValue.split(",").map(e => e.trim());
    for (const dataset of datasets) {
        const result = validateDatasetName(dataset);
        if (result) {
            return result;
        }
    }
    return undefined;
}

function validateDatasetName(inputValue: string): string | undefined {
    const nameSegments = inputValue.split(".");

    const segmentHlqFirstCharRegex = new RegExp("^([@#$A-Za-z])$");

    const segmentHlqSegmentRegex = new RegExp("^([@#$A-Za-z0-9-]{1,8})$");
    for (const segment of nameSegments) {
        if (segment.length === 0) {
            return "Dataset name segment must not be empty.";
        }

        if (segment.length > 8) {
            return "Dataset name segment can't be more than 8 characters.";
        }

        if (!segmentHlqFirstCharRegex.test(segment.charAt(0))) {
            return `Dataset name segment: ${segment} starts with a prohibited character.`;
        }

        if (!segmentHlqSegmentRegex.test(segment)) {
            return `Dataset name segment: ${segment} contains a prohibited character.`;
        }
    }
    return undefined;
}
