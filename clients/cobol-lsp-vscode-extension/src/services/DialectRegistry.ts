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
import { SETTINGS_DIALECT_REGISTRY } from "../constants";

/**
 * Holds information about registered dialect
 */
export type DialectInfo = {
    name: string;
    path: string;
    description: string;
    extensionId: string;
    snippetPath: string;
};

const dialectInfoes: Map<string, DialectInfo> = new Map();

/**
 * DialectRegistry provides read/write dialect settings functionality
 */
 export class DialectRegistry {

    /**
     * Gets registered dialect infoes
     * @returns list of dialect info structures
     */
    public static getDialects(): DialectInfo[] {
        return Array.from(dialectInfoes.values());
    }

    /**
     * Clears the registry
     */
    public static clear() {
        dialectInfoes.clear();
        vscode.workspace.getConfiguration().update(SETTINGS_DIALECT_REGISTRY, []);
    }

    /**
     * Registers dialect in the system
     * @param name of a dialect
     * @param path to jar file
     * @param description of a dialect
     * @param extensionId is an extension id
     * @param snippets is a spippet map for a dialect
     */
    public static register(name: string, path: string, description: string, extensionId: string, snippetPath: string) {
        const dialectInfo: DialectInfo = {
            name: name,
            path: path,
            description: description,
            extensionId: extensionId,
            snippetPath: snippetPath
        };
        dialectInfoes.set(dialectInfo.name, dialectInfo);
        vscode.workspace.getConfiguration().update(SETTINGS_DIALECT_REGISTRY, Array.from(dialectInfoes.values()));
    }

    /**
     * Unregisters dialect from the system
     * @param name of a dialect
     */
    public static unregister(name: string) {
        dialectInfoes.delete(name);
        vscode.workspace.getConfiguration().update(SETTINGS_DIALECT_REGISTRY, Array.from(dialectInfoes.values()));
    }

 }
