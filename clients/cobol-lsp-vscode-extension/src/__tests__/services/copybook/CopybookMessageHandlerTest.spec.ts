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

import { SettingsService } from "../../../services/Settings";
import * as vscode from "vscode";
import { Utils } from "../../../services/util/Utils";
import path = require("path");
import { globSync } from "glob";
import * as fs from "fs";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";

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
  return { fsPath: x, toString: jest.fn().mockReturnValue("file://" + x) };
});

describe("Test the copybook message handler", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  const downloaderNoApi = new CopybookDownloadService("/storagePath");
  it("checks local present copybooks are resolved", async () => {
    SettingsService.getCopybookExtension = jest.fn().mockReturnValue([".cpy"]);
    SettingsService.getCopybookLocalPath = jest
      .fn()
      .mockReturnValue(["/configured/path/from/setting"]);

    expect(
      await downloaderNoApi.resolveCopybookHandler(
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
      await downloaderNoApi.resolveCopybookHandler(
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe(
      "file://" +
        path.resolve(
          "/storagePath",
          "zowe",
          "copybooks",
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
      await downloaderNoApi.resolveCopybookHandler(
        "cobolFileName",
        "copybookName",
        "dialectType",
      ),
    ).toBe(
      "file://" +
        path.resolve(
          "/storagePath",
          "zowe",
          "copybooks",
          "testProfile",
          "configured",
          "path",
          "copybookName",
        ),
    );
  });
  const filename = "cobolFileName";
  const group = "group";
  const profile = { profile: "profile", instance: "instance" };
  const datasetFirst = {
    pgms: [
      {
        program: filename,
        pgroup: group,
      },
    ],
    pgroups: [
      {
        name: group,
        libs: [
          {
            dataset: "dataset",
          },
          {
            use_map: false,
            environment: "environment",
            stage: "stage",
            system: "system",
            subsystem: "subsystem",
            type: "type",
          },
        ],
      },
    ],
  };
  const endevorFirst = {
    pgms: [
      {
        program: filename,
        pgroup: group,
      },
    ],
    pgroups: [
      {
        name: group,
        libs: [
          {
            use_map: false,
            environment: "environment",
            stage: "stage",
            system: "system",
            subsystem: "subsystem",
            type: "type",
          },
          {
            dataset: "dataset",
          },
        ],
      },
    ],
  };

  const unreachable = jest.fn();
  const listMembers = jest.fn(async () => ["copybook"]);
  const listElements = jest.fn(
    async () =>
      [
        ["copybook", "abcdef0123456789"],
        ["copybook2", "0123456789abcdef"],
      ] as [string, string][],
  );

  it("checks E4E downloaded member copybooks are resolved", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ENDEVOR_PROCESSOR"),
    });
    const downloader = new CopybookDownloadService("/storagePath", undefined, {
      isEndevorElement(uri: string) {
        return uri === filename;
      },
      onDidChangeElement: unreachable,
      listMembers,
      listElements,
      getMember: unreachable,
      getElement: unreachable,
      async getProfileInfo(uri) {
        return uri === filename ? profile : Error("fail");
      },
      async getConfiguration(uri, options) {
        return uri === filename && options.type === "COBOL"
          ? datasetFirst
          : Error("fail");
      },
    });
    const target = await downloader.resolveCopybookHandler(
      "cobolFileName",
      "copybook",
      "dialectType",
    );
    expect(unreachable).not.toHaveBeenCalled();
    expect(listMembers).toHaveBeenCalledWith(profile, { dataset: "dataset" });
    expect(listElements).toHaveBeenCalledWith(profile, {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
    });
    expect(target).toEqual(
      "file://" +
        path.resolve(
          "/storagePath",
          "e4e",
          "copybooks",
          "instance.profile",
          "dataset",
          "copybook",
        ),
    );
  });
  it("checks E4E downloaded element copybooks are resolved", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ENDEVOR_PROCESSOR"),
    });
    const downloader = new CopybookDownloadService("/storagePath", undefined, {
      isEndevorElement(uri: string) {
        return uri === filename;
      },
      onDidChangeElement: unreachable,
      listMembers,
      listElements,
      getMember: unreachable,
      getElement: unreachable,
      async getProfileInfo(uri) {
        return uri === filename ? profile : Error("fail");
      },
      async getConfiguration(uri, options) {
        return uri === filename && options.type === "COBOL"
          ? endevorFirst
          : Error("fail");
      },
    });
    const target = await downloader.resolveCopybookHandler(
      "cobolFileName",
      "copybook",
      "dialectType",
    );
    expect(unreachable).not.toHaveBeenCalled();
    expect(listMembers).toHaveBeenCalledWith(profile, { dataset: "dataset" });
    expect(listElements).toHaveBeenCalledWith(profile, {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
    });
    expect(target).toEqual(
      "file://" +
        path.resolve(
          "/storagePath",
          "e4e",
          "copybooks",
          "instance.profile",
          "environment",
          "stage",
          "system",
          "subsystem",
          "type",
          "copybook",
        ),
    );
  });
  it("checks E4E downloaded element copybooks are not resolved due to settings", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ZOWE"),
    });
    const downloader = new CopybookDownloadService("/storagePath", undefined, {
      isEndevorElement: unreachable,
      onDidChangeElement: unreachable,
      listMembers: unreachable,
      listElements: unreachable,
      getMember: unreachable,
      getElement: unreachable,
      getProfileInfo: unreachable,
      getConfiguration: unreachable,
    });
    await downloader.resolveCopybookHandler(
      "cobolFileName",
      "copybook",
      "dialectType",
    );
    expect(unreachable).not.toHaveBeenCalled();
  });
});
