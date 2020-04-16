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

import {SETTINGS_SECTION_LOCATION} from "../../constants";

export class SettingsParser {
    private static isValidJSON(json: string): boolean {
        return (json !== undefined && json.trim().length > 0);
    }

    public resolveLocations(json: string): string[] {
        if (SettingsParser.isValidJSON(json)) {
            const locations: string[] = JSON.parse(json)[SETTINGS_SECTION_LOCATION];
            return (locations !== undefined) ? locations : [];
        }
        return [];
    }

}
