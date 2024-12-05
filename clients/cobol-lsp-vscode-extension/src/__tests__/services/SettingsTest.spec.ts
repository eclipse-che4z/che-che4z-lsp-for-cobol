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
import * as path from "path";
import * as vscode from "vscode";
import { lspConfigHandler, SettingsService } from "../../services/Settings";
import { SettingsUtils } from "../../services/util/SettingsUtils";
import { getTabSettings } from "../../services/SmartTabSettings";
import {
  DIALECT_REGISTRY_SECTION,
  DialectInfo,
  DialectRegistry,
} from "../../services/DialectRegistry";

import { asMutable } from "../../test/suite/testHelper";
import {
  SETTINGS_COMPILE_OPTIONS,
  SETTINGS_CPY_LOCAL_PATH,
  SETTINGS_DIALECT,
} from "../../constants";
import * as extension from "../../extension";

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
  test("Evaluate fileBasenameNoExtension", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file:///program",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program"));
  });

  test("Evaluate fileBasenameNoExtension", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file:///program.cbl",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program"));
  });

  test("Evaluate fileBasenameNoExtension with extension and dots", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["copybook/${fileBasenameNoExtension}"]),
    });

    const paths = await SettingsService.getCopybookLocalPath(
      "file:///program.file.cbl",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/copybook/program.file"));
  });

  test("Evaluate fileDirname", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["${fileDirname}/copybooks"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file://" + makePath("/toplevel/program"),
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/toplevel") + "/copybooks");
  });

  test("Evaluate fileDirnameBasename", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["${fileDirnameBasename}/copybooks"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file:///toplevel/program",
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws/toplevel/copybooks"));
  });

  test("Evaluate workspaceFolder", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["${workspaceFolder}/copybooks"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file://" + makePath("/toplevel/program"),
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws") + "/copybooks");
  });

  test("Evaluate workspaceFolder with name", async () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest
        .fn()
        .mockReturnValue(["${workspaceFolder:workspace}/copybooks"]),
    });
    const paths = await SettingsService.getCopybookLocalPath(
      "file://" + makePath("/toplevel/program"),
      "COBOL",
    );
    expect(paths[0]).toEqual(makefsPath("/tmp-ws") + "/copybooks");
  });

  test("Get local settings for a dialect", async () => {
    const tracking = jest.fn().mockReturnValue(["copybook"]);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    await SettingsService.getCopybookLocalPath("PROGRAM", "COBOL");
    expect(tracking).toHaveBeenCalledWith("paths-local");
  });

  test("Get local settings for dialect", async () => {
    const tracking = jest.fn().mockReturnValue(["copybook"]);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    await SettingsService.getCopybookLocalPath("PROGRAM", "MAID");
    expect(tracking).toHaveBeenCalledWith("maid.paths-local");
  });

  test("Get native build enable settings", () => {
    const tracking = jest.fn();
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.serverRuntime();
    expect(tracking).toHaveBeenCalledWith("cobol-lsp.serverRuntime");
  });
});

test("getWorkspaceFoldersPath return an array of paths", () => {
  asMutable(vscode.workspace).workspaceFolders = [
    { uri: { path: "/ws-vscode" } } as vscode.WorkspaceFolder,
  ];
  const paths = SettingsUtils.getWorkspaceFoldersPath();
  expect(paths).toStrictEqual(["/ws-vscode"]);
});

describe("SettingsService returns correct tab settings", () => {
  test("Returns default tab settings for boolean value", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(true),
    });

    const tabSettings = getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(72);
  });

  test("Max position is the last threshold position for array", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue([1, 3, 5, 7, 25]),
    });

    const tabSettings = getTabSettings();
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

    const tabSettings = getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(40);
    expect(tabSettings.defaultRule.regex).toBeUndefined();
    expect(tabSettings.defaultRule.stops[3]).toBe(40);
    expect(tabSettings.rules.length).toBe(2);
  });

  test("Returns default tab settings for invalid configuration", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("invalid configuration"),
    });

    const tabSettings = getTabSettings();
    expect(tabSettings.defaultRule.maxPosition).toBe(72);
  });
});

describe("SettingsService returns correct Copybook Configuration Values", () => {
  const mockConfigurationFetch = (settings: string, configuredValue: unknown) =>
    jest.fn().mockReturnValue({
      get: (args: string) => {
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

describe("SettingService lspConfigHandler", () => {
  describe("dialects registry configuration", () => {
    const dialect: DialectInfo = {
      name: "testDialect",
      uri: vscode.Uri.file(""),
      description: "test-dialect",
      snippetPath: "",
      extensionId: "",
    };

    beforeAll(() => {
      DialectRegistry.register(
        dialect.extensionId,
        dialect.name,
        dialect.uri,
        dialect.description,
        dialect.snippetPath,
      );
    });

    afterAll(() => {
      DialectRegistry.clear();
    });

    test("returns dialects configuration", async () => {
      const result = await lspConfigHandler({
        items: [{ section: DIALECT_REGISTRY_SECTION }],
      });

      expect(result).toEqual(expect.arrayContaining([[dialect]]));
    });
  });

  describe("enabled dialects section", () => {
    beforeAll(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => [],
      } as unknown as vscode.WorkspaceConfiguration);
    });

    test("return empty array in default configuration", async () => {
      const result = await lspConfigHandler({
        items: [{ section: SETTINGS_DIALECT }],
      });

      expect(result).toEqual(expect.arrayContaining([[]]));
    });
  });

  describe("compiler options section", () => {
    beforeAll(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => undefined,
      } as unknown as vscode.WorkspaceConfiguration);
    });

    test("returns undefined in default configuration", async () => {
      const result = await lspConfigHandler({
        items: [
          {
            section: SETTINGS_COMPILE_OPTIONS,
            scopeUri: "file:///workspace/program.cob",
          },
        ],
      });

      expect(result).toEqual(expect.arrayContaining([undefined]));
    });
  });

  describe("setting local copybook path section", () => {
    beforeAll(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => ["local-copybooks"],
      } as unknown as vscode.WorkspaceConfiguration);
    });

    test("returns local copybook path setting", async () => {
      const result = await lspConfigHandler({
        items: [
          {
            section: SETTINGS_CPY_LOCAL_PATH,
            scopeUri: "file:///workspace/program.cob",
          },
        ],
      });

      expect(result).toEqual(expect.arrayContaining([["local-copybooks"]]));
    });
  });

  describe("unknown section", () => {
    test("returns matching vscode configuration item", async () => {
      const configurationValue = { random: "configuration" };

      let configKey: string | undefined;
      vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockImplementation((key: string) => {
          configKey = key;
          return configurationValue;
        }),
      });

      const result = await lspConfigHandler({
        items: [{ section: "unknown.config.section" }],
      });

      expect(result).toEqual(expect.arrayContaining([configurationValue]));
      expect(configKey).toEqual("unknown.config.section");
    });
  });

  describe("Invalid configuration provided", () => {
    let outputChannelMock: jest.SpyInstance;
    beforeAll(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => ["correct-path", 2, false],
      } as unknown as vscode.WorkspaceConfiguration);

      outputChannelMock = jest.fn();
      jest.spyOn(extension, "getChannel").mockReturnValue({
        appendLine: outputChannelMock,
      } as unknown as vscode.OutputChannel);
    });

    test("returns empty setting instead of wrong configuration", async () => {
      const result = await lspConfigHandler({
        items: [
          {
            section: SETTINGS_CPY_LOCAL_PATH,
            scopeUri: "file:///workspace/program.cob",
          },
        ],
      });

      expect(result).toEqual(expect.arrayContaining([]));
      expect(outputChannelMock).toHaveBeenCalledWith(
        "Invalid settings: cobol-lsp.cpy-manager.paths-local - Invalid value 2 supplied to : Array<string>/1: string\nInvalid value false supplied to : Array<string>/2: string",
      );
    });
  });
});
