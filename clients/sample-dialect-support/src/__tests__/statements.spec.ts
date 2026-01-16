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
 *   Broadcom, Inc. - initial API and implementation
 */

import { ItemType } from "@code4z/cobol-dialect-api";
import * as vscode from "../__mocks__/vscode";
import {
  replaceChangeStateStatement,
  replaceProcessStatement,
} from "../statements";

const context = {
  resolveCopybook: jest.fn(),
  replace: jest.fn(),
  replaceWithMap: jest.fn(),
  addDiagnostic: jest.fn(),
};

describe("statements replacement functionality", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should replace PROCESS statement", () => {
    const lines = [
      "LINE 0",
      "      PROCESS V1 OF G1 BY V2 OF G2 DO S1 WITH P1 AND P2 FROM S2, S3.",
    ];
    replaceProcessStatement(context, 1, lines);

    expect(context.replaceWithMap).toHaveBeenCalledWith(
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 67)),
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 13)),
      [
        {
          tokens: [
            {
              name: "VAR1",
              range: new vscode.Range(
                new vscode.Position(1, 14),
                new vscode.Position(1, 16),
              ),
            },
            {
              name: "GR1",
              range: new vscode.Range(
                new vscode.Position(1, 20),
                new vscode.Position(1, 22),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "VAR2",
              range: new vscode.Range(
                new vscode.Position(1, 26),
                new vscode.Position(1, 28),
              ),
            },
            {
              name: "GR2",
              range: new vscode.Range(
                new vscode.Position(1, 32),
                new vscode.Position(1, 34),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PAR1",
              range: new vscode.Range(
                new vscode.Position(1, 46),
                new vscode.Position(1, 48),
              ),
            },
            {
              name: "SEC1",
              range: new vscode.Range(
                new vscode.Position(1, 38),
                new vscode.Position(1, 40),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PAR2",
              range: new vscode.Range(
                new vscode.Position(1, 53),
                new vscode.Position(1, 55),
              ),
            },
            {
              name: "SEC2",
              range: new vscode.Range(
                new vscode.Position(1, 61),
                new vscode.Position(1, 63),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PROC",
              range: new vscode.Range(
                new vscode.Position(1, 65),
                new vscode.Position(1, 67),
              ),
            },
          ],
        },
      ],
      "       MOVE {VAR1} OF {GR1} TO {VAR2} OF {GR2}.\n" +
        "       PERFORM {PAR1} OF {SEC1} THRU {PAR2} OF {SEC2}.\n" +
        "       PERFORM {PROC}.",
    );
  });

  it("should replace CHANGE STATE statement", () => {
    const lines = ["LINE 0", "      CHANGE STATE V1 OF G1."];
    replaceChangeStateStatement(context, 1, lines);
    expect(context.replaceWithMap).toHaveBeenCalledWith(
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 27)),
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 12)),
      [
        {
          tokens: [
            {
              name: "VAR1",
              range: new vscode.Range(
                new vscode.Position(1, 19),
                new vscode.Position(1, 21),
              ),
            },
            {
              name: "GR1",
              range: new vscode.Range(
                new vscode.Position(1, 25),
                new vscode.Position(1, 27),
              ),
            },
          ],
          type: ItemType.VARIABLE,
        },
      ],
      "",
    );
  });
});
