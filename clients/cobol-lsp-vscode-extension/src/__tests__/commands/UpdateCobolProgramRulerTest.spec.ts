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
// import { updateCobolEditorRuler } from "../../commands/UpdateCobolProgramRuler";
// import { SettingsService } from "../../services/Settings";

// describe("Tests cobol editor rulers", () => {
//   it("tests editor ruler is updated as per user configured settings", () => {
//     (SettingsService as any).getCobolProgramLayout = jest.fn().mockReturnValue({
//       sequence_length: 2,
//       indicator_length: 1,
//       area_a_length: 2,
//       area_b_length: 10,
//       comment_area: 4,
//     });
//     const mockUpdateFunction = jest.fn();
//     (vscode.workspace.getConfiguration as any) = jest.fn().mockReturnValue({
//       get: jest.fn().mockReturnValue({
//         "editor.guides.indentation": 4,
//         "editor.rulers": [],
//         "editor.wordSeparators": "separator",
//       }),
//       update: mockUpdateFunction,
//     });
//     updateCobolEditorRuler();
//     expect(mockUpdateFunction).toBeCalledWith(
//       "[cobol]",
//       {
//         "editor.guides.indentation": 4,
//         "editor.rulers": [2, 3, 5, 15, 19],
//         "editor.wordSeparators": "separator",
//       },
//       2,
//       true,
//     );
//   });

//   it("tests editor ruler defaults to IBM code layout", () => {
//     (SettingsService as any).getCobolProgramLayout = jest
//       .fn()
//       .mockReturnValue({});
//     const mockUpdateFunction = jest.fn();
//     (vscode.workspace.getConfiguration as any) = jest.fn().mockReturnValue({
//       get: jest.fn().mockReturnValue({
//         "editor.guides.indentation": 4,
//         "editor.rulers": [],
//         "editor.wordSeparators": "separator",
//       }),
//       update: mockUpdateFunction,
//     });
//     updateCobolEditorRuler();
//     expect(mockUpdateFunction).toBeCalledWith(
//       "[cobol]",
//       {
//         "editor.guides.indentation": 4,
//         "editor.rulers": [6, 7, 11, 72, 80],
//         "editor.wordSeparators": "separator",
//       },
//       2,
//       true,
//     );
//   });
// });
