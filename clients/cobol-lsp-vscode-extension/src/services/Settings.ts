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
import { DACO_DIALECT, IDMS_DIALECT, PATHS_LOCAL_KEY, PATHS_USS, PATHS_ZOWE, SERVER_PORT, SETTINGS_CPY_SECTION, SETTINGS_SUBROUTINE_LOCAL_KEY, SETTINGS_DIALECT } from "../constants";
import cobolSnippets = require("../services/snippetcompletion/cobolSnippets.json");
import dacoSnippets = require("../services/snippetcompletion/dacoSnippets.json");
import idmsSnippets = require("../services/snippetcompletion/idmsSnippets.json");

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

    public static readonly DEFAULT_DIALECT = "COBOL";
    /**
     * Get list of local subroutine path
     * @returns a list of local subroutine path
     */
    public static getSubroutineLocalPath(): string[] {
        return vscode.workspace.getConfiguration().get(SETTINGS_SUBROUTINE_LOCAL_KEY);
    }

    /**
     * Get copybook local path based on program file name
     * @param cobolFileName is a program file name
     * @param dialectType name of the cobol dialect type
     * @returns a list of local path
     */
    public static getCopybookLocalPath(cobolFileName: string, dialectType: string): string[] {
        return SettingsService.getCopybookConfigValues(PATHS_LOCAL_KEY, cobolFileName, dialectType);
    }

    /**
     * Get Lsp Port from configuration
     * @returns lsp port number
     */
    public static getLspPort(): number | undefined {
        return +vscode.workspace.getConfiguration().get(SERVER_PORT);
    }

    /**
     * Get list of dsn path
     * @param cobolFileName is a program file name
     * @param dialectType name of the cobol dialect type
     * @returns a list of dsn path
     */
    public static getDsnPath(cobolFileName: string, dialectType: string): string[] {
        return SettingsService.getCopybookConfigValues(PATHS_ZOWE, cobolFileName, dialectType);
    }

    /**
     * Get list of uss path
     * @param cobolFileName is a program file name
     * @param dialectType name of the cobol dialect type
     * @returns a list of uss path
     */
    public static getUssPath(cobolFileName: string, dialectType: string): string[] {
        return SettingsService.getCopybookConfigValues(PATHS_USS, cobolFileName, dialectType);
    }

    /**
     * Get profile name
     * @returns a profile name
     */
    public static getProfileName(): string {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("profiles")
    }

    private static evaluateVariable(dataList: string[], variable: string, value: string): string[] {
        const result: string[] = [];
        if (dataList) {
            dataList.forEach(d => result.push(d.replace(`$\{${variable}\}`, value)))
        }
        return result;
    }

    /**
     * Return the code page for the copybook file encoding supplied by user
     * @returns string
     */
    public static getCopybookFileEncoding() {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("copybook-file-encoding")
    }

    /**
     * Return the dialect type supplied by user
     * @returns Map of snippets
     */
     public static getSnippetsForUserDialect(): Map<any, any>{
        const dialectList: string[] =  vscode.workspace.getConfiguration().get(SETTINGS_DIALECT);
        const cobolMap = new Map(Object.entries(cobolSnippets));
        let finalSnippetMap = cobolMap;
        if(dialectList.includes(IDMS_DIALECT)){
            var idmsMap: Map<any,any> = new Map(Object.entries(idmsSnippets));
            finalSnippetMap = new Map([...cobolMap, ...idmsMap])

            if(dialectList.includes(DACO_DIALECT)){
                var dacoMap: Map<any,any> = new Map(Object.entries(dacoSnippets));
                finalSnippetMap = new Map([...cobolMap, ...idmsMap, ...dacoMap])
            }
        }
       else
            if(dialectList.includes(DACO_DIALECT)){
                var dacoMap: Map<any,any> = new Map(Object.entries(dacoSnippets));
                finalSnippetMap = new Map([...cobolMap, ...dacoMap])
            }

        return finalSnippetMap;

    }
    private static getCopybookConfigValues(section: string, cobolFileName: string, dialectType: string) {
        const programFile = cobolFileName.replace(/\.[^/.]+$/, "");
        if (dialectType !== SettingsService.DEFAULT_DIALECT) {
            const pathList: string[] = vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(`${dialectType.toLowerCase()}.${section}`);
            if (pathList && pathList.length > 0) {
                return SettingsService.evaluateVariable(pathList, "fileBasenameNoExtension", programFile);
            }
        }
        const pathList: string[] = vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(section);
        return SettingsService.evaluateVariable(pathList, "fileBasenameNoExtension", programFile);
    }

}
