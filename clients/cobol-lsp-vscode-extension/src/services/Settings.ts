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

import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";
import { PATHS_LOCAL_KEY, PATHS_USS, PATHS_ZOWE, SERVER_PORT, SETTINGS_CPY_SECTION, SETTINGS_SUBROUTINE_LOCAL_KEY } from "../constants";

/**
 * New file (e.g .gitignore) will be created or edited if exits, under project folder
 * (e.g. workspace/.c4z) with given  pattern
 * @param folderPath
 * @param fileName
 * @param pattern
 */
export function createFileWithGivenPath(folderPath: string, fileName: string, pattern: string): void {
    if (!vscode.workspace.workspaceFolders || !vscode.workspace.workspaceFolders[0]) {
        return;
    }
    const ws = vscode.workspace.workspaceFolders[0];

    const ch4zPath = path.join(ws.uri.fsPath, folderPath);
    const filePath = path.join(ch4zPath, fileName);
    try {
        if (fs.existsSync(filePath)) {
            const notFound = fs.readFileSync(filePath).toString().split("\n")
                .filter(e => e.trim().length > 0)
                .map(e => e.trim()).every(v => v !== pattern);
            if (notFound) {
                fs.appendFileSync(filePath, "\n" + pattern);
            }
        } else {
            fs.mkdirSync(ch4zPath, { recursive: true });
            fs.writeFileSync(filePath, pattern);
        }
    } catch (e) {
        vscode.window.showErrorMessage("File error: " + e.toString());
    }

}

/**
 * SettingsService provides read/write configurstion settings functionality
 */
export class SettingsService {
    /**
     * Get list of local subroutine path
     * @returns a list of local subroutine path
     */
    public static getSubroutineLocalPath(): string[] {
        return vscode.workspace.getConfiguration().get(SETTINGS_SUBROUTINE_LOCAL_KEY);
    }

    /**
     * Get copybook local path based on program file name
     * @param cobolProgramName is a program file name
     * @returns a list of local path
     */
    public static getCopybookLocalPath(cobolProgramName: string): string[] {
        const pathList: string[] = vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_LOCAL_KEY);
        return SettingsService.evaluateVariable(pathList, "program_name", cobolProgramName);
    }

    /**
     * Get Lsp Port from configuration
     * @returns lsp port number
     */
    public static getLspPort(): number | undefined {
        return +vscode.workspace.getConfiguration().get(SERVER_PORT);
    }

    /**
     * Determine if dsn path exists in the configurstion 
     * @returns true if path exists and false otherwise
     */
    public static hasDsnPath(): boolean {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).has(PATHS_ZOWE)        
    }

    /**
     * Get list of dsn path
     * @returns a list of dsn path
     */
    public static getDsnPath(): string[] {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_ZOWE);        
    }

    /**
     * Set list of dsn path to the configuration
     * @param paths is a list of new values
     */
    public static setDsnPath(paths: string[]) {
        vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).update(PATHS_ZOWE, paths);
    }

    /**
     * Determine if uss path exists in the configurstion 
     * @returns true if path exists and false otherwise
     */
    public static hasUssPath(): boolean {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).has(PATHS_USS)        
    }

    /**
     * Get list of uss path
     * @returns a list of uss path
     */
    public static getUssPath(): string[] {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_USS)
    }

    /**
     * Get profile name
     * @returns a profile name
     */
    public static getProfileName(): string {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("profiles")
    }

    /**
     * Determine if confuguration is invalid
     * @returns true if configurstion is invalid and false otherwise
     */
    public static isConfigurationInvalid() {
        return !SettingsService.hasDsnPath() &&
            !SettingsService.hasUssPath();
    }

    private static evaluateVariable(dataList: string[], variable: string, value: string): string[] {
        const result: string[] = [];
        dataList.forEach(d => result.push(d.replace("$" + variable, value)))
        return result;
    }
}