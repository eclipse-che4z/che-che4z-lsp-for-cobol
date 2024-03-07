// /*
//  * Copyright (c) 2024 Broadcom.
//  * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
//  *
//  * This program and the accompanying materials are made
//  * available under the terms of the Eclipse Public License 2.0
//  * which is available at https://www.eclipse.org/legal/epl-2.0/
//  *
//  * SPDX-License-Identifier: EPL-2.0
//  *
//  * Contributors:
//  *   Broadcom, Inc. - initial API and implementation
//  */

// import * as vscode from "vscode";
// import { SettingsService } from "../services/Settings";
// import { integer } from "vscode-languageclient";

// export interface LayoutStructure {
//   sequence_length?: integer;
//   indicator_length?: integer;
//   area_a_length?: integer;
//   area_b_length?: integer;
//   comment_area?: integer;
// }

// // export enum Layout {
// //   IBM = "IBM",
// //   HP = "HP"
// // }

// // export const layoutMappingObject: Record<string, LayoutStructure> = {
// //   [Layout.IBM]: { sequence_length: 6, indicator_length: 1, area_a_length: 4, area_b_length: 61, comment_area: 8 },
// //   [Layout.HP]: { sequence_length: 0, indicator_length: 1, area_a_length: 4, area_b_length: 127, comment_area: 0 }
// // }

// // export function updateCobolEditorRuler() {
// //   const configuration = vscode.workspace.getConfiguration();

// //   const rulers = SettingsService.getCobolProgramLayout();
// //   const seqLen = rulers?.sequence_length ?? 6;
// //   const indcatorLen = rulers?.indicator_length ?? 1;
// //   const areaA = rulers?.area_a_length ?? 4;
// //   const areaB = rulers?.area_b_length ?? 61;
// //   const commentLen = rulers?.comment_area ?? 8;
// //   const rulerIndex = [
// //     seqLen,
// //     seqLen + indcatorLen,
// //     seqLen + indcatorLen + areaA,
// //     seqLen + indcatorLen + areaA + areaB,
// //     seqLen + indcatorLen + areaA + areaB + commentLen,
// //   ];
// //   const updatedRules = {
// //     ...(configuration.get("[cobol]") as {
// //       "editor.guides.indentation": integer;
// //       "editor.rulers": integer[];
// //       "editor.wordSeparators": string;
// //     }),
// //     "editor.rulers": rulerIndex,
// //   };
// //   configuration.update(
// //     "[cobol]",
// //     updatedRules,
// //     vscode.ConfigurationTarget.Workspace,
// //     true,
// //   );
// // }
