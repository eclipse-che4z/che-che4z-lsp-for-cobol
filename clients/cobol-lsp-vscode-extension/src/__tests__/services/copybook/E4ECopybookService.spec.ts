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
import { getE4EAPI } from "../../../services/copybook/E4ECopybookService";
import { e4eMock } from "../../../__mocks__/getE4EMock.utility";
import { Utils } from "../../../services/util/Utils";
import { E4E } from "../../../type/e4eApi";

describe("e4e copybook service tests", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  it("checks valid e4e api retrieved", async () => {
    const exports = { ...e4eMock };
    const ext = { exports, activate: jest.fn().mockReturnValue(exports) };
    vscode.extensions.getExtension = jest.fn().mockReturnValue(ext);

    const spyValidate = jest.spyOn(Utils, "validateE4E");
    const api = await getE4EAPI();
    expect(spyValidate).toHaveBeenCalled();
    expect(api).toEqual({ e4e: e4eMock });
  });
  it("e4e installed later on", async () => {
    const spyValidate = jest.spyOn(Utils, "validateE4E");
    const exports = { ...e4eMock };
    const getExtension = jest.fn();
    const dispose = jest.fn();
    let changeCallback: unknown;
    const onDidChange = jest.fn((fn) => {
      changeCallback = fn;
      return { dispose };
    });
    vscode.extensions.getExtension = getExtension;
    (vscode.extensions as any).onDidChange = onDidChange;

    const api = await getE4EAPI();
    expect(api).toHaveProperty("futureE4E");
    expect(changeCallback).toBeTruthy();
    const { futureE4E } = api as {
      futureE4E: Promise<undefined | { e4e: E4E }>;
    };

    // e4e has now been installed
    const ext = { exports, activate: jest.fn().mockReturnValue(exports) };
    getExtension.mockReturnValue(ext);
    (changeCallback as () => void)(); // typescript does not see through the indirect call

    expect(await futureE4E).toEqual({ e4e: e4eMock });
    expect(spyValidate).toHaveBeenCalled();
  });
});
