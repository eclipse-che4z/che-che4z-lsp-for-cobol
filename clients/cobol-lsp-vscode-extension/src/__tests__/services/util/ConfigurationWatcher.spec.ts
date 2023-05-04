/*
 * Copyright (c) 2023 Broadcom.
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
import { SettingsService } from "../../../services/Settings";
import { ConfigurationWatcher } from "../../../services/util/ConfigurationWatcher";
jest.mock("../../../services/reporter/TelemetryService");

jest.mock("vscode", () => ({
  commands: {
    executeCommand: jest.fn(),
  },
  window: {
    showInformationMessage: jest.fn(),
  },
  workspace: {
    getConfiguration: jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValueOnce(undefined).mockReturnValue("JAVA"),
      update: jest.fn(),
    }),
    onDidChangeConfiguration: jest
      .fn()
      .mockReturnValue("onDidChangeConfiguration"),
  },
}));

describe("Tests ConfigurationWatcher utility", () => {
  afterEach(() => {
    jest.clearAllMocks();
  });

  it("Test serverRuntime value is changed, then ask to restart", async () => {
    SettingsService.serverRuntime = jest
      .fn()
      .mockReturnValueOnce(undefined)
      .mockReturnValue("NATIVE");
    vscode.window.showInformationMessage = jest.fn().mockReturnValue("Ok");
    const configurationWatcher = new ConfigurationWatcher();
    await (
      configurationWatcher as any
    ).handleServerRuntimeConfigurationChange();
    expect(vscode.commands.executeCommand).toBeCalled();
  });

  it("Test serverRuntime is changed but value remain unchanged, then do not ask to restart", async () => {
    SettingsService.serverRuntime = jest
      .fn()
      .mockReturnValueOnce(undefined)
      .mockReturnValue("JAVA");
    vscode.window.showInformationMessage = jest.fn().mockReturnValue("Ok");
    const configurationWatcher = new ConfigurationWatcher();
    await (
      configurationWatcher as any
    ).handleServerRuntimeConfigurationChange();
    expect(vscode.commands.executeCommand).not.toBeCalled();
  });
});
