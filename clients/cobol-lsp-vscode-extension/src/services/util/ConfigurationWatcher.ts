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

import * as vscode from "vscode";
import { SERVER_TYPE, SETTINGS_DIALECT } from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";
import { SettingsService } from "../Settings";

export class ConfigurationWatcher {

    public static watchConfigurationChanges() {
        vscode.workspace.onDidChangeConfiguration(async event => {
            if (event.affectsConfiguration(SETTINGS_DIALECT)) {
                await this.validateDialectAndServerTypeCompatibility();
            }

            if (event.affectsConfiguration(SERVER_TYPE)) {
                await this.handleServerTypeConfigurationChange();
            }
        });
    }

    public static async validateDialectAndServerTypeCompatibility() {
        const [configName, configValue] = await this.validateAndGetUpdatedValuesAsPerCompatibility();
        if (configName && configValue) {
            await vscode.workspace.getConfiguration().update(configName as string, configValue);
        }
    }

    private static async validateAndGetUpdatedValuesAsPerCompatibility() {
        const configuredDialects = SettingsService.getDialects();
        const disableDialectOptions = `Disable ${configuredDialects} dialect(s).`;
        const switchToJavaOption = `Switch to JAVA server type`;
        if (this.isConflictingConfiguration(configuredDialects)) {
            const selection = await vscode.window.showInformationMessage("COBOL dialect support requires JAVA, but you have configured NATIVE server type", switchToJavaOption, disableDialectOptions);
            if (selection === switchToJavaOption) {
                TelemetryService.registerEvent("Native Build disabled for dialect support", ["COBOL", "native build", "settings"],
                    "Native build disabled by user for dialect support");
                return [SERVER_TYPE, "JAVA"];
            }
            if (selection === disableDialectOptions) {
                TelemetryService.registerEvent("Native Build continued at the cost of no dialect support", ["COBOL", "native build", "settings"],
                    "Native Build continued at the cost of no dialect support");
                return [SETTINGS_DIALECT, []];
            }
        }
        return [];
    }

    private static async handleServerTypeConfigurationChange() {
        const newServerType = this.getServerType();
        const [configName, configValue] = await this.validateAndGetUpdatedValuesAsPerCompatibility();

        if (configName === SETTINGS_DIALECT) {
            await vscode.workspace.getConfiguration().update(configName as string, configValue);
        }

        if (newServerType === "NATIVE" && configValue === "JAVA") {
            return Promise.resolve(vscode.workspace.getConfiguration().update(configName as string, configValue));
        }
        await this.restartVsCode();
    }

    private static async restartVsCode() {
        const selection = await vscode.window.showInformationMessage("Restart the vscode to enforce server type settings change", "Ok", "Later");
        if (typeof selection === "undefined" || selection === "Later") {
            return;
        }
        if (selection === "Ok") {
            TelemetryService.registerEvent("Server type modified by user", ["COBOL", "native build enabled", "settings"],
                `Server type modified by user to ${this.getServerType()}`);
            await vscode.commands.executeCommand("workbench.action.reloadWindow");
        }
    }

    private static getServerType() {
        return SettingsService.isNativeServerTypeConfigured() ? "NATIVE" : "JAVA";
    }

    private static isConflictingConfiguration(configuredDialects: string[]) {
        return SettingsService.isNativeServerTypeConfigured() && configuredDialects.length > 0;
    }
}
