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
import {
    COPYBOOK_EXTENSIONS,
    PATHS_LOCAL_KEY,
    PATHS_USS,
    PATHS_ZOWE,
    SERVER_PORT,
    SERVER_RUNTIME,
    SETTINGS_CPY_SECTION,
    SETTINGS_DIALECT,
    SETTINGS_SUBROUTINE_LOCAL_KEY,
    SETTINGS_TAB_CONFIG,
} from "../constants";
import cobolSnippets = require("../services/snippetcompletion/cobolSnippets.json");
import { DialectRegistry, DIALECT_REGISTRY_SECTION } from "./DialectRegistry";
import { loadProcessorGroupConfig, loadProcessorGroupCopybookPaths } from "./ProcessorGroups";

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

export class TabRule {
    // tslint:disable-next-line:no-unnecessary-initializer
    public constructor(public stops: number[], public maxPosition: number, public regex: string | undefined = undefined) { }
}

export class TabSettings {
    public constructor(public rules: TabRule[], public defaultRule: TabRule) { }
}

export function configHandler(request: any): Array<any> {
    const result = new Array<any>();
    for (let item of request.items) {
        try {
            if (item.section === DIALECT_REGISTRY_SECTION) {
                const object = DialectRegistry.getDialects();
                result.push(object);
            } else {
                const object = loadProcessorGroupConfig(item, vscode.workspace.getConfiguration().get(item.section));
                result.push(object);
            }
        } catch (error) {
            console.log(error);
        }
    }
    return result;
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
        const pgPaths = loadProcessorGroupCopybookPaths(cobolFileName, dialectType);
        return [
            ...SettingsService.evaluateVariable(pgPaths, "fileBasenameNoExtension", cobolFileName),
            ...SettingsService.getCopybookConfigValues(PATHS_LOCAL_KEY, cobolFileName, dialectType)
        ];
    }

    public static getCopybookExtension(): string[] {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(COPYBOOK_EXTENSIONS);
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
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("profiles");
    }

    /**
     * Retrieves and parse tab settings configuration that can be boolean, array or an object
     * @returns a TabSettings object
     */
    public static getTabSettings(): TabSettings {
        const config = vscode.workspace.getConfiguration().get(SETTINGS_TAB_CONFIG);
        let settings = new TabSettings([], new TabRule([0, 6, 7, 11], 72));
        if (Array.isArray(config)) {
            const stops = config as number[];
            if (stops !== undefined && stops.length > 0) {
                const tabRule = new TabRule(stops, stops[stops.length - 1]);
                settings = new TabSettings([], tabRule);
            }
        } else if (typeof config === "object") {
            const obj = config as { default, anchors };
            let defaultRule = new TabRule([0, 6, 7, 11], 72);
            const stops = obj.default as number[];
            if (stops !== undefined && stops.length > 0) {
                defaultRule = new TabRule(stops, stops[stops.length - 1]);
            }
            let rules = [];
            const anchors = obj.anchors;
            if (obj.anchors !== undefined && Object.keys(anchors).length > 0) {
                const keys = Object.keys(anchors);
                const values = Object.values(anchors);
                for (let i = 0; i < keys.length; i++) {
                    const regex = keys[i] as string;
                    const stops = values[i] as number[];
                    if (regex !== undefined && stops !== undefined && stops.length > 0) {
                        rules.push(new TabRule(stops, stops[stops.length - 1], regex));
                    }
                }
            }
            settings = new TabSettings(rules, defaultRule);
        }
        return settings;
    }

    /**
     * Return the code page for the copybook file encoding supplied by user
     * @returns string
     */
    public static getCopybookFileEncoding() {
        return vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get("copybook-file-encoding");
    }

    /**
     * Return the dialect type supplied by user
     * @returns Map of snippets
     */
    public static async getSnippetsForCobol(): Promise<Map<any, any>> {
        const map: Map<any, any> = new Map<any, any>([...Object.entries(cobolSnippets)]);
        return map;
    }

    /**
     * Gets list of desired fialects
     * @returns a list of desired fialects
     */
    public static getDialects(): string[] {
        return vscode.workspace.getConfiguration().get(SETTINGS_DIALECT);
    }

    /**
     * Gives the configured runtime from settings.
     *
     * @returns returns configured runtime
     */
    public static serverRuntime(): string {
        return vscode.workspace.getConfiguration().get(SERVER_RUNTIME);
    }

    private static evaluateVariable(dataList: string[], variable: string, value: string): string[] {
        const result: string[] = [];
        if (dataList) {
            dataList.forEach(d => result.push(d.replace(`$\{${variable}\}`, value)))
        }
        return result;
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
