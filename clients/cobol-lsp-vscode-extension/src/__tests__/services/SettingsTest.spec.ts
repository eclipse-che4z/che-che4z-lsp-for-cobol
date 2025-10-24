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
} from "../../dialect/DialectRegistry";

import { asMutable } from "../../test/suite/testHelper";
import {
  SETTINGS_COMPILE_OPTIONS,
  SETTINGS_CPY_LOCAL_PATH,
  SETTINGS_DIALECT,
} from "../../constants";

function makefsPath(p: string): string {
  return path.join(process.platform == "win32" ? "a:" : "", p);
}

describe("SettingsService evaluate variables", () => {
  beforeAll(() => {
    (vscode.workspace.workspaceFolders as vscode.WorkspaceFolder[]) = [
      {
        uri: vscode.Uri.file(makefsPath("/tmp-ws")),
        name: "workspace",
        index: 0,
      },
    ];
  });

  test("Get native build enable settings", () => {
    const tracking = jest.fn();
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.serverRuntime();
    expect(tracking).toHaveBeenCalledWith("cobol-lsp.serverRuntime");
  });

  test("Get java home settings", () => {
    const tracking = jest.fn();
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: tracking,
    });
    SettingsService.getJavaHome();
    expect(tracking).toHaveBeenCalledWith("cobol-lsp.java.home");
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
    expect(SettingsService.getUssPath("dialect")).toHaveLength(0);
  });

  test("returns configured array when dialect configuration is provided", () => {
    vscode.workspace.getConfiguration = mockConfigurationFetch(
      "dialect.paths-uss",
      ["configured-dialect-settings"],
    );
    const configuredValue = SettingsService.getUssPath("dialect");
    expect(configuredValue).toHaveLength(1);
    expect(configuredValue[0]).toBe("configured-dialect-settings");
  });

  test("returns configured array for COBOL configuration", () => {
    vscode.workspace.getConfiguration = mockConfigurationFetch("paths-uss", [
      "configured-cobol-settings",
    ]);
    const configuredValue = SettingsService.getUssPath(
      SettingsService.DEFAULT_DIALECT,
    );
    expect(configuredValue).toHaveLength(1);
    expect(configuredValue[0]).toBe("configured-cobol-settings");
  });
});

describe("SettingService lspConfigHandler", () => {
  describe("dialects registry configuration", () => {
    const dialect: DialectInfo = {
      name: "testDialect",
      protocolVersion: 2,
      description: "test-dialect",
      extensionId: "",
      snippetUri: vscode.Uri.file(""),
      isCopyStatement: undefined,
    };

    beforeAll(() => {
      DialectRegistry.registerV2(
        dialect.extensionId,
        dialect.name,
        dialect.description,
        dialect.snippetUri,
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
    let configurationProperties: Record<string, unknown> = {};

    beforeAll(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: (key: string) => configurationProperties[key],
      } as unknown as vscode.WorkspaceConfiguration);
    });

    describe("local copybooks path is configured", () => {
      beforeAll(() => {
        configurationProperties = {
          "cobol-lsp.cpy-manager.paths-local": ["local-copybooks"],
        };
      });

      test("returns empty array - server should not need to know local copybook paths", async () => {
        const result = await lspConfigHandler({
          items: [
            {
              section: SETTINGS_CPY_LOCAL_PATH,
              scopeUri: "file:///workspace/program.cob",
            },
          ],
        });

        expect(result).toEqual(expect.arrayContaining([]));
      });
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
});

describe("SettingsService for analysis", () => {
  test("returns severity for defined ERROR setting", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("ERROR"),
    });

    const severity = SettingsService.getUnreachableCodeSeverity();
    expect(severity).toBe(vscode.DiagnosticSeverity.Error);
  });

  test("returns undefined severity for undefined setting", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(undefined),
    });

    const severity = SettingsService.getUnreachableCodeSeverity();
    expect(severity).toBeUndefined();
  });

  test("returns default Max VM Count for undefined setting", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(undefined),
    });

    const count = SettingsService.getMaxVMCount();
    expect(count).toBe(50000);
  });

  test("returns Max VM Count", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(25000),
    });

    const count = SettingsService.getMaxVMCount();
    expect(count).toBe(25000);
  });
});
