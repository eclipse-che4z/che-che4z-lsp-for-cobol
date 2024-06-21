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
import { E4ECopybookService } from "../../../services/copybook/E4ECopybookService";
import { e4eMock } from "../../../__mocks__/getE4EMock.utility";
import { Utils } from "../../../services/util/Utils";

describe("e4e copybook service tests", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  it("checks valid e4e api retrieved", async () => {
    const ext = { exports: { ...e4eMock }, activate: jest.fn() };
    vscode.extensions.getExtension = jest.fn().mockReturnValue(ext);

    const spyValidate = jest.spyOn(Utils, "validateE4E");
    const api = await E4ECopybookService.getE4EAPI();
    expect(spyValidate).toHaveBeenCalled();
    expect(api).toEqual(e4eMock);
  });

  it("check getE4EClient assembles client correctly / check getE4EClient returns already assembled client once called with same Uri ", async () => {
    E4ECopybookService.getE4EAPI = jest.fn().mockReturnValue(e4eMock);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ENDEVOR"),
    });
    await E4ECopybookService.getE4EClient("document-uri");
    const spyApi = jest.spyOn(E4ECopybookService, "getE4EAPI");
    expect(spyApi).toHaveBeenCalledTimes(1);
    await E4ECopybookService.getE4EClient("document-uri");
    expect(spyApi).toHaveBeenCalledTimes(1);
    await E4ECopybookService.getE4EClient("new-uri");
    expect(spyApi).toHaveBeenCalledTimes(2);
  });
  it("checks getE4EClient returns undefined when zowe settings is being used to retrieve copybooks", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("COBOL LS"),
    });
    expect(await E4ECopybookService.getE4EClient("document-uri")).toEqual(
      undefined,
    );
  });
});
