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

import * as vscode from "../__mocks__/vscode";
import {
  replaceAltStateStatement,
  replaceFixStateStatement,
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

  it("should replace PROC statement", () => {
    const lines = [
      "LINE 0",
      "      PROC V1 OF G1 BY V2 OF G2 DO S1 WITH P1 AND P2 FROM S2, S3.",
    ];
    replaceProcessStatement(context, 1, lines);

    expect(context.replaceWithMap).toHaveBeenCalledWith(
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 64)),
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 10)),
      [
        {
          tokens: [
            {
              name: "VAR1",
              range: new vscode.Range(
                new vscode.Position(1, 11),
                new vscode.Position(1, 13),
              ),
            },
            {
              name: "GR1",
              range: new vscode.Range(
                new vscode.Position(1, 17),
                new vscode.Position(1, 19),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "VAR2",
              range: new vscode.Range(
                new vscode.Position(1, 23),
                new vscode.Position(1, 25),
              ),
            },
            {
              name: "GR2",
              range: new vscode.Range(
                new vscode.Position(1, 29),
                new vscode.Position(1, 31),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PAR1",
              range: new vscode.Range(
                new vscode.Position(1, 43),
                new vscode.Position(1, 45),
              ),
            },
            {
              name: "SEC1",
              range: new vscode.Range(
                new vscode.Position(1, 35),
                new vscode.Position(1, 37),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PAR2",
              range: new vscode.Range(
                new vscode.Position(1, 50),
                new vscode.Position(1, 52),
              ),
            },
            {
              name: "SEC2",
              range: new vscode.Range(
                new vscode.Position(1, 58),
                new vscode.Position(1, 60),
              ),
            },
          ],
        },
        {
          tokens: [
            {
              name: "PROC",
              range: new vscode.Range(
                new vscode.Position(1, 62),
                new vscode.Position(1, 64),
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

  it("should replace FIX STATE statement", () => {
    const lines = ["LINE 0", "      FIX STATE V1 OF G1."];
    replaceFixStateStatement(context, 1, lines);
    expect(context.replaceWithMap).toHaveBeenCalledWith(
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 24)),
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 9)),
      [
        {
          tokens: [
            {
              name: "VAR1",
              range: new vscode.Range(
                new vscode.Position(1, 16),
                new vscode.Position(1, 18),
              ),
            },
            {
              name: "GR1",
              range: new vscode.Range(
                new vscode.Position(1, 22),
                new vscode.Position(1, 24),
              ),
            },
          ],
          type: "VARIABLE",
        },
      ],
      "",
    );
  });

  it("should replace ALT STATE statement", () => {
    const lines = ["LINE 0", "      ALT STATE P1 OF S1."];
    replaceAltStateStatement(context, 1, lines);
    expect(context.replaceWithMap).toHaveBeenCalledWith(
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 24)),
      new vscode.Range(new vscode.Position(1, 6), new vscode.Position(1, 9)),
      [
        {
          tokens: [
            {
              name: "PAR1",
              range: new vscode.Range(
                new vscode.Position(1, 16),
                new vscode.Position(1, 18),
              ),
            },
            {
              name: "SEC1",
              range: new vscode.Range(
                new vscode.Position(1, 22),
                new vscode.Position(1, 24),
              ),
            },
          ],
          type: "PROCEDURE",
        },
      ],
      "",
    );
  });
});
