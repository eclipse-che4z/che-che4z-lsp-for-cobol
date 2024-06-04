/*
 * Copyright (c) 2020 Broadcom.
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
import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../../services/Settings";
import { SettingsUtils } from "../../services/util/SettingsUtils";

const fsPath = "tmp-ws";
beforeAll(() => {
  (vscode.workspace.workspaceFolders as any) = [
    { uri: { fsPath: makefsPath(fsPath), path: makePath(fsPath) } } as any,
  ];
});

jest.mock("vscode", () => ({
  Uri: {
    parse: jest.fn().mockImplementation((str: string) => {
      return {
        fsPath: str.substring("file://".length),
      };
    }),
  },
  workspace: {},
}));

function makefsPath(p: string): string {
  return path.join(process.platform == "win32" ? "a:" : "", p);
}
function makePath(p: string): string {
  return (process.platform == "win32" ? "/a:" : "") + p;
}

describe("SettingsService evaluate variables", () => {
  beforeAll(() => {
    (vscode.workspace.workspaceFolders as vscode.WorkspaceFolder[]) = [
      {
        uri: {
          path: makePath("/tmp-ws"),
          scheme: "",
          authority: "",
          query: "",
          fragment: "",
          fsPath: makefsPath("/tmp-ws"),
          with: function (): vscode.Uri {
            throw new Error("Function not implemented.");
          },
          toJSON: function () {
            throw new Error("Function not implemented.");
          },
        },
        name: "workspace",
        index: 0,
      },
    ];
  });
  test("Evaluate fileBasenameNoExtension", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });
    const paths = SettingsService.getCopybookLocalPath(
      "file:///program",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program"));
  });

  test("Evaluate fileBasenameNoExtension", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });
    const paths = SettingsService.getCopybookLocalPath(
      "file:///program.cbl",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program"));
  });

  test("Evaluate fileBasenameNoExtension with extension and dots", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });

    const paths = SettingsService.getCopybookLocalPath(
      "file:///program.file.cbl",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program.file"));
  });

  test("Get local settings for a dialect", () => {
    const tracking = jest.fn().mockReturnValue(["copybook"]);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.getCopybookLocalPath("PROGRAM", "COBOL");
    expect(tracking).toBeCalledWith("paths-local");
  });

  test("Get local settings for dialect", () => {
    const tracking = jest.fn().mockReturnValue(["copybook"]);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.getCopybookLocalPath("PROGRAM", "MAID");
    expect(tracking).toBeCalledWith("maid.paths-local");
  });

  test("Get native build enable settings", () => {
    const tracking = jest.fn();
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.serverRuntime();
    expect(tracking).toBeCalledWith("cobol-lsp.serverRuntime");
  });
});

test("getWorkspaceFoldersPath return an array of paths", () => {
  (vscode.workspace.workspaceFolders as any) = [
    { uri: { path: "/ws-vscode" } } as any,
  ];
  const paths = SettingsUtils.getWorkspaceFoldersPath();
  expect(paths).toStrictEqual(["/ws-vscode"]);
});
test("json validation", () => {
  expect(SettingsUtils.isValidJSON(undefined)).toBeFalsy();
  expect(SettingsUtils.isValidJSON("{}")).toBeTruthy();
});

describe("SettingsService returns correct tab settings", () => {
  test("Returns default tab settigs for boolean value", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(true),
    });

    const tabSettings = SettingsService.getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(72);
  });

  test("Max position is the last threashold position for array", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue([1, 3, 5, 7, 25]),
    });

    const tabSettings = SettingsService.getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(25);
  });

  test("Different rules for different divisions with default rule", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue({
        default: [1, 2, 3, 40],
        anchors: {
          "DATA +DIVISON": [1, 7, 8, 15, 40, 52],
          "PROCEDURE +DIVISON": [1, 7, 8, 15, 40, 45, 50],
        },
      }),
    });

    const tabSettings = SettingsService.getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(40);
    expect(tabSettings.defaultRule.regex).toBeUndefined();
    expect(tabSettings.defaultRule.stops[3]).toBe(40);
    expect(tabSettings.rules.length).toBe(2);
  });
});

describe("SettingsService returns correct Copybook Configuration Values", () => {
  const mockConfigurationFetch = (settings: string, configuredValue: any) =>
    jest.fn().mockReturnValue({
      get: (args: String) => {
        if (settings === args) {
          return configuredValue;
        }
      },
    });

  test("returns empty array when dialect configuration is not provided", () => {
    vscode.workspace.getConfiguration = mockConfigurationFetch(
      "dialect.paths-uss",
      undefined,
    );
    expect(SettingsService.getUssPath("doc-uri", "dialect")).toHaveLength(0);
  });

  test("returns configured array when dialect configuration is provided", () => {
    vscode.workspace.getConfiguration = mockConfigurationFetch(
      "dialect.paths-uss",
      ["configured-dialect-settings"],
    );
    const configuredValue = SettingsService.getUssPath("doc-uri", "dialect");
    expect(configuredValue).toHaveLength(1);
    expect(configuredValue[0]).toBe("configured-dialect-settings");
  });

  test("returns configured array for COBOL configuration", () => {
    vscode.workspace.getConfiguration = mockConfigurationFetch("paths-uss", [
      "configured-cobol-settings",
    ]);
    const configuredValue = SettingsService.getUssPath(
      "doc-uri",
      SettingsService.DEFAULT_DIALECT,
    );
    expect(configuredValue).toHaveLength(1);
    expect(configuredValue[0]).toBe("configured-cobol-settings");
  });
});
describe("SettingsService prepares local search folders", () => {
  test("returns all paths are transformed into absolutes", () => {
    const paths = [makefsPath("/absolute"), "relative"];
    expect(
      SettingsService.prepareLocalSearchFolders(paths, [
        makefsPath("/workspacePath"),
      ]),
    ).toEqual([makefsPath("/absolute"), makefsPath("/workspacePath/relative")]);
  });
  test("all workspace paths concatanated into relative paths", () => {
    const paths = [makefsPath("/absolute"), "relative"];
    expect(
      SettingsService.prepareLocalSearchFolders(paths, [
        makefsPath("/workspacePath"),
        makefsPath("/workspacePath2"),
      ]),
    ).toEqual([
      makefsPath("/absolute"),
      makefsPath("/workspacePath/relative"),
      makefsPath("/workspacePath2/relative"),
    ]);
  });
});
