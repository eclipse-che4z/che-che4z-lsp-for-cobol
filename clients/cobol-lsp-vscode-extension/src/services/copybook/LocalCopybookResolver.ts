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
import {URL} from "url";
import {CopybookResolver} from "./CopybookResolver";
import {getURIFromResource} from "../util/FSUtils";

/**
 * This class implement the resolution of paths defined into the configuration file in a list
 * of URIs that are present on the filesystem
 */
export class LocalCopybookResolver implements CopybookResolver {

    /**
     * @param list the provided list of physical path defined by the user or undefined
     * @return a list of resolved URIs, empty array if the input list doesn't contains any valid/found URIs
     */
    public resolve(list: string[] | undefined): string[] {
        return (list) ? this.resolveURIList(list).filter(uri => uri !== "") : [];
    }

    private resolveURIList(list: string[]): string[] {
        const result: Set<string> = new Set<string>();
        list.filter(resource => resource !== "*").forEach(resource => {
            const uris: URL[] = getURIFromResource(resource);
            uris.forEach(uri => {
                if (uri !== undefined) {
                    result.add(uri.href);
                }
            });
        });
        return [...result];
    }
}
