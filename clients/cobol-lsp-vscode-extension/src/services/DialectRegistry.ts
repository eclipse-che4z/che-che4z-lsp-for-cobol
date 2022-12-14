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
import { sleep } from "../test/suite/testHelper";


/**
 * Holds information about registered dialect
 */
export type DialectInfo = {
    name: string;
    path: string;
    description: string;
    extensionId: string;
};

/**
 * DialectRegistry provides read/write dialect settings functionality
 */
 export class DialectRegistry {

    /**
     * Gets registered dialect infoes
     * @returns list of dialect info structures
     */
    public static getDialects(): DialectInfo[] {
        const result: DialectInfo[] = vscode.workspace.getConfiguration().get(SETTINGS_DIALECT_REGISTRY);
        if (result === undefined) {
            return [];
        }
        return result;
    }

    public static register(name: string, path: string, description: string, extensionId: string) {
        let result: DialectInfo[] = this.getDialects();
        const dialectInfo: DialectInfo = {
            name: name,
            path: path,
            description: description,
            extensionId: extensionId
        };
        result.push(dialectInfo);
        vscode.workspace.getConfiguration().update(SETTINGS_DIALECT_REGISTRY, result);
    }
 }

 /**
  * Provides activation dialects functionality
  */
 export class DialectActivator  {

    /**
     * Wait for dialects to register
     * @param neededDialects is a list of desired dialects
     * @param timeout is a timeout for waiting dialects in milliseconds
     */
    public static async waitForDialects(neededDialects: string[], timeout: number): Promise<string> {
        var time = timeout;
        var remainDialects = DialectActivator.getRemainDialects(neededDialects);
        while (remainDialects.size > 0) {
            await sleep(100);
            time -= 100;
            if (time < 0) {
                return "Following dialects was not registered in the system: " + DialectActivator.format(remainDialects);
            }
            remainDialects = DialectActivator.getRemainDialects(neededDialects);
        }
        return "";
    }

    private static format(dialects: Set<string>): string {
        return Array.from(dialects.values()).join(", ");
    }

    private static getRemainDialects(dialects: string[]): Set<string> {
        const registeredDialects: Set<string> = new Set<string>(DialectRegistry.getDialects().map(d => d.name));
        const neededDialects = new Set<string>(dialects);

        registeredDialects.forEach(d => neededDialects.delete(d));
        return neededDialects;
    }
 }