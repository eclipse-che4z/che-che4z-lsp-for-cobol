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

import * as vscode from "vscode";
import {gotoCopybookSettings} from "../commands/OpenSettingsCommand";
import {TelemetryService} from "../services/reporter/TelemetryService";

jest.mock("../services/reporter/TelemetryService");
jest.mock("vscode", () => ({
    commands: {
        executeCommand: jest.fn(),
    }}));

test("check gotoCopybookSettings calls telemetry services and vscode execute command with right parameters.", () => {
    expect(gotoCopybookSettings).toBeTruthy();
    gotoCopybookSettings();

    expect(TelemetryService.registerEvent).toBeCalledWith("Open copybook settings", ["COBOL", "copybook", "settings"], "The user invokes the open settings quick fix to see the copybook locations stored in the settings file");
    expect(vscode.commands.executeCommand).toBeCalledWith("workbench.action.openSettings", "broadcom-cobol-lsp.cpy-manager");
});
