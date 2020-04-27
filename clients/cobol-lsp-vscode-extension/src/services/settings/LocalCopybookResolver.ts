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
import {CopybookResolver} from "./CopybookResolver";
import * as path from "path";

function fileExist(element: string): boolean {
    return fs.existsSync(path.normalize(element));
}

function resolveURIList(list: string[]): string[] {
    const result: Set<string> = new Set<string>();

    list.filter(element => element !== "*" && fileExist(element)).forEach(location => {
        result.add(decodeURI(location));
    });
    return [...result];
}

/**
 * This class implement the resolution of paths defined into the configuration file in a list
 * of URIs that are present on the filesystem
 */
export class LocalCopybookResolver implements CopybookResolver {
    private static parse(list: string[]): string[] {
        if (list === undefined) {
            return [];
        }
        return resolveURIList(list).filter(uri => uri !== "");
    }

    /**
     * @param list the provided list of physical path defined by the user
     * @return a list of resolved URIs, empty array if the input list doesn't contains any valid/found URIs
     */
    public resolve(list: string[]): string[] {
        return LocalCopybookResolver.parse(list);
    }

}
