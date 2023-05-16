/*
 * Copyright (c) 2022 Broadcom.
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

import { resolveCopybookHandler } from "../../../services/copybook/CopybookMessageHandler";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { SettingsService } from "../../../services/Settings";
import { searchCopybookInWorkspace } from "../../../services/util/FSUtils";
import * as vscode from "vscode";
import { Utils } from "../../../services/util/Utils";

vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
  get: jest.fn().mockReturnValue("testProfile"),
});

Utils.getZoweExplorerAPI = jest.fn();

describe("Test the copybook message handler", () => {
  it("checks local present copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest
      .fn()
      .mockReturnValue("/configured/path/from/setting");
    (searchCopybookInWorkspace as any) = jest
      .fn()
      .mockReturnValue("copybook content");
    expect(
      await resolveCopybookHandler(
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe("copybook content");
  });

  it("checks downloaded copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest.fn().mockReturnValue("");
    SettingsService.getDsnPath = jest
      .fn()
      .mockReturnValue(["/configured/path"]);
    CopybookURI.createDatasetPath = jest
      .fn()
      .mockReturnValue(["/downloaded/copybook/path"]);
    (searchCopybookInWorkspace as any) = jest
      .fn()
      .mockReturnValueOnce("")
      .mockReturnValueOnce("Downloaded copybook content");
    expect(
      await resolveCopybookHandler(
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe("Downloaded copybook content");
  });

  it("checks USS downloaded copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest.fn().mockReturnValue("");
    SettingsService.getDsnPath = jest.fn().mockReturnValue([]);
    SettingsService.getUssPath = jest
      .fn()
      .mockReturnValue(["/configured/path"]);
    CopybookURI.createDatasetPath = jest
      .fn()
      .mockReturnValue(["/downloaded/copybook/path"]);
    (searchCopybookInWorkspace as any) = jest
      .fn()
      .mockReturnValueOnce("")
      .mockReturnValueOnce("")
      .mockReturnValue("Downloaded USS copybook content");
    expect(
      await resolveCopybookHandler(
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe("Downloaded USS copybook content");
  });
});
