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
import {URL} from "url";
import {CopybookResolver} from "./CopybookResolver";
import {SettingsUtils} from "./util/SettingsUtils";

/**
 * This class implement the resolution of paths defined into the configuration file in a list
 * of URIs that are present on the filesystem
 */
export class LocalCopybookResolver implements CopybookResolver {

    /**
     * This function construct an URI from a valid resource provided from the setting configuration
     * @param resource represent the file to search within the workspace folder list
     * @return an URI representation of the file or undefined if not found
     */
    private static getURIFromResource(resource: string): URL {
        for (const workspaceFolder of SettingsUtils.getWorkspacesURI()) {
            const uri: URL = new URL(path.join(workspaceFolder, resource));
            if (fs.existsSync(uri)) {
                return uri;
            }
        }
    }

    /**
     * @param list the provided list of physical path defined by the user
     * @return a list of resolved URIs, empty array if the input list doesn't contains any valid/found URIs
     */
    public resolve(list: string[]): string[] {
        if (list === undefined) {
            return [];
        }
        return this.resolveURIList(list).filter(uri => uri !== "");
    }

    private  resolveURIList(list: string[]): string[] {
        const result: Set<string> = new Set<string>();
        list.filter(resource => resource !== "*").forEach(resource => {
            const URI: URL = LocalCopybookResolver.getURIFromResource(resource);
            if (URI !== undefined) {
                result.add(URI.href);
            }
        });
        return [...result];
    }
}
