/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import { SettingsService } from "../../../../engine/services/settings";
import * as vscode from "../__mocks__/vscode";

describe("SettingsService test suite", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should fall back to 'legacy' for an invalid value", () => {
    vscode.workspace.getConfiguration().get = jest
      .fn()
      .mockReturnValue("invalid");

    const version = SettingsService.getApiVersion();

    expect(version).toBe("legacy");
    expect(vscode.window.showErrorMessage).toHaveBeenCalled();
  });

  it("should treat 'new' as 'new'", () => {
    vscode.workspace.getConfiguration().get = jest.fn().mockReturnValue("new");

    const version = SettingsService.getApiVersion();

    expect(version).toBe("new");
    expect(vscode.window.showErrorMessage).not.toHaveBeenCalled();
  });

  it("should treat 'legacy' as 'legacy'", () => {
    vscode.workspace.getConfiguration().get = jest
      .fn()
      .mockReturnValue("legacy");

    const version = SettingsService.getApiVersion();

    expect(version).toBe("legacy");
    expect(vscode.window.showErrorMessage).not.toHaveBeenCalled();
  });

  it("should default to 'legacy' when nothing is configured", () => {
    vscode.workspace.getConfiguration().get = jest
      .fn()
      .mockImplementation((_key: string, defaultValue: string) => defaultValue);

    const version = SettingsService.getApiVersion();

    expect(version).toBe("legacy");
    expect(vscode.window.showErrorMessage).not.toHaveBeenCalled();
  });
});
