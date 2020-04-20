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

import {SETTINGS_SECTION_LOCAL} from "../../constants";
import {CopybookLocation} from "./CopybookLocation";
import {SettingsUtils} from "./util/SettingsUtils";

export class LocalCopybookResolver implements CopybookLocation {
    // add here logic related to the resolution of physical paths
    private static parse(list: string[]) {
        if (list !== undefined) {
            return this.createArrayResolvedLocations(list);
        }
        return [];
    }

    private static createArrayResolvedLocations(list: string[]) {
        const result: string[] = [];
        try {
            list.filter(element => element !== "*").forEach(location => {
                result.push(decodeURI(location));
            });
        } catch (e) {
            return [];
        }
        return result;
    }

    public resolveLocation(json: string): string[] {
        if (SettingsUtils.isValidJSON(json)) {
            return LocalCopybookResolver.parse(JSON.parse(json)[SETTINGS_SECTION_LOCAL]);
        }
        return [];
    }
}
