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
import { SettingsService } from "../services/Settings";
import { integer } from "vscode-languageclient";

export function updateCobolEditorRuler() {
    const configuration = vscode.workspace.getConfiguration()

    const rulers = SettingsService.getCobolProgramLayout();
    const seqLen = (rulers && rulers.sequence_length) || 6;
    const indcatorLen = (rulers && rulers.indicator_length) || 1;
    const areaA = (rulers && rulers.area_a_length) || 1;
    const areaB = (rulers && rulers.area_b_length) || 61;
    const commentLen = (rulers && rulers.comment_area) || 61;
    const rulerIndex = [seqLen,
        seqLen + indcatorLen,
        seqLen + indcatorLen + areaA,
        seqLen + indcatorLen + areaA + areaB,
        seqLen + indcatorLen + areaA + areaB + commentLen
    ];
    const updatedRules = {
        ...configuration.get("[cobol]") as { 'editor.guides.indentation': integer, 'editor.rulers': integer[], 'editor.wordSeparators': string },
        'editor.rulers': rulerIndex
    };
    configuration.update("[cobol]", updatedRules, vscode.ConfigurationTarget.Workspace, true);
}