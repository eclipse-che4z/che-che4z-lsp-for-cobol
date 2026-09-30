/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 */

import * as vscode from "vscode";
import { waitForDiagnosticMessages } from "../../suite/testHelper";

jest.mock("vscode", () => ({
  languages: { getDiagnostics: jest.fn() },
}));

describe("waitForDiagnosticMessages", () => {
  const uri = { path: "/test.cbl" } as vscode.Uri;

  beforeEach(() => jest.clearAllMocks());

  it("waits for all messages and returns one diagnostic snapshot", async () => {
    const first = [{ message: "first" }];
    const complete = [...first, { message: "second" }];
    const getDiagnostics = vscode.languages.getDiagnostics as jest.Mock;
    getDiagnostics.mockReturnValueOnce(first).mockReturnValue(complete);

    const diagnostics = await waitForDiagnosticMessages(
      uri,
      ["first", "second"],
      1000,
    );

    expect(diagnostics).toBe(complete);
    expect(getDiagnostics).toHaveBeenCalledTimes(2);
  });

  it("waits for each occurrence of a repeated message", async () => {
    const first = [{ message: "duplicate" }];
    const complete = [...first, { message: "duplicate" }];
    const getDiagnostics = vscode.languages.getDiagnostics as jest.Mock;
    getDiagnostics.mockReturnValueOnce(first).mockReturnValue(complete);

    const diagnostics = await waitForDiagnosticMessages(
      uri,
      ["duplicate", "duplicate"],
      1000,
    );

    expect(diagnostics).toBe(complete);
    expect(getDiagnostics).toHaveBeenCalledTimes(2);
  });
});
