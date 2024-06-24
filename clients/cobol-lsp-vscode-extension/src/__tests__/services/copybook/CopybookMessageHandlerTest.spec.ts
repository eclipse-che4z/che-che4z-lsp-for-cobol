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
import * as vscode from "vscode";
import { Utils } from "../../../services/util/Utils";
import { E4ECopybookService } from "../../../services/copybook/E4ECopybookService";
import {
  e4eMock,
  e4eResponseMock,
  e4eResponseMockDataSetPrior,
} from "../../../__mocks__/getE4EMock.utility";
import path = require("path");
import { globSync } from "glob";
import * as fs from "fs";

vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
  get: jest.fn().mockReturnValue("testProfile"),
});

Utils.getZoweExplorerAPI = jest.fn();
jest.mock("glob");
jest.mock("url", () => {
  return {
    URL: jest.fn().mockImplementation((x) => {
      return { href: x };
    }),
  };
});
(globSync as any) = jest.fn().mockImplementation((x: any) => [x]);
(fs.realpathSync.native as any) = jest.fn().mockImplementation((x: any) => x);
(vscode.Uri.file as any) = jest.fn().mockImplementation((x: any) => {
  return { fsPath: x };
});

const outputChannel: vscode.OutputChannel = {
  name: "COBOL Language Support",
  append: jest.fn(),
  appendLine: jest.fn(),
  replace: jest.fn(),
  clear: jest.fn(),
  show: jest.fn(),
  hide: jest.fn(),
  dispose: jest.fn(),
};

describe("Test the copybook message handler", () => {
  it("checks local present copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest
      .fn()
      .mockReturnValue(["/configured/path/from/setting"]);

    expect(
      await resolveCopybookHandler(
        "/storagePath",
        outputChannel,
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe(
      "file://" +
        path.resolve(
          "/configured",
          "path",
          "from",
          "setting",
          "copybookName.cpy",
        ),
    );
  });

  it("checks downloaded copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest.fn().mockReturnValue([]);
    SettingsService.getDsnPath = jest
      .fn()
      .mockReturnValue(["/configured/path"]);
    expect(
      await resolveCopybookHandler(
        "/storagePath",
        outputChannel,
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe(
      "file://" +
        path.resolve(
          "/storagePath",
          ".zowe",
          ".copybooks",
          "testProfile",
          "configured",
          "path",
          "copybookName",
        ),
    );
  });

  it("checks USS downloaded copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest.fn().mockReturnValue([]);
    SettingsService.getDsnPath = jest.fn().mockReturnValue([]);
    SettingsService.getUssPath = jest
      .fn()
      .mockReturnValue(["/configured/path"]);

    expect(
      await resolveCopybookHandler(
        "/storagePath",
        outputChannel,
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe(
      "file://" +
        path.resolve(
          "/storagePath",
          ".zowe",
          ".copybooks",
          "testProfile",
          "configured",
          "path",
          "copybookName",
        ),
    );
  });
  it("checks E4E downloaded member copybooks are resolved", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ENDEVOR_PROCESSOR"),
    });
    (vscode.workspace.workspaceFolders as any) = undefined;
    (globSync as any) = jest.fn().mockImplementation((x: any) => [x]);
    E4ECopybookService.getE4EAPI = jest.fn().mockResolvedValue(e4eMock);
    e4eMock.isEndevorElement = jest.fn().mockResolvedValue(true);
    const spyAsString = jest.spyOn(Utils, "profileAsString");
    const spyGetEnvironmentPath = jest.spyOn(CopybookURI, "getEnviromentPath");
    E4ECopybookService.getE4EClient = jest
      .fn()
      .mockResolvedValue(e4eResponseMockDataSetPrior);
    const target = await resolveCopybookHandler(
      "/storagePath",
      outputChannel,
      "cobolFileName",
      "copybook",
      "dialectType",
    );
    expect(target).toEqual(
      "file://" +
        path.resolve(
          "/storagePath",
          ".e4e",
          ".copybooks",
          "instance.profile",
          "dataset",
          "copybook",
        ),
    );
    expect(spyAsString).toHaveBeenCalled();
    expect(spyGetEnvironmentPath).not.toHaveBeenCalled();
  });
  it("checks E4E downloaded element copybooks are resolved", async () => {
    (vscode.workspace.workspaceFolders as any) = undefined;
    (fs.realpathSync.native as any) = jest
      .fn()
      .mockImplementation((x: any) => x);
    (vscode.Uri.file as any) = jest.fn().mockImplementation((x: any) => {
      return { fsPath: x };
    });
    E4ECopybookService.getE4EAPI = jest.fn().mockResolvedValue(e4eMock);
    e4eMock.isEndevorElement = jest.fn().mockResolvedValue(true);

    const spyGetEnvironmentPath = jest.spyOn(CopybookURI, "getEnviromentPath");
    E4ECopybookService.getE4EClient = jest
      .fn()
      .mockResolvedValue(e4eResponseMock);
    const target = await resolveCopybookHandler(
      "/storagePath",
      outputChannel,
      "cobolFileName",
      "copybook",
      "dialectType",
    );
    expect(target).toEqual(
      "file://" +
        path.resolve(
          "/storagePath",
          ".e4e",
          ".copybooks",
          "instance.profile",
          "environment",
          "stage",
          "system",
          "subsystem",
          "type",
          "copybook",
        ),
    );
    expect(spyGetEnvironmentPath).toHaveBeenCalled();
  });
});
