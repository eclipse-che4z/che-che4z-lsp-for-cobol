/**
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/

 * SPDX-License-Identifier: EPL-2.0

 * Contributors:
 *  Broadcom, Inc. - initial API and implementation
 */

import * as fs from "fs";
import * as urlUtil from "url";
import * as path from "path";
import { ClientConfiguration } from "../clientConfiguration";

const COPYBOOK_PATH_SETTING = "remote-copyboooks";

export function getChildFiles(copybookFolders: string[]) {
    const result: any[] = [];
    for (const p of copybookFolders) {
        const absPath = path.resolve(p);
        fs.readdirSync(absPath).forEach((file) => {
            result.push(new urlUtil.URL("file://" + absPath + path.sep + file).href);
        });
    }
    return result;
}

export function getRootUri(rootPath: string, ...args: string[]) {
    return new urlUtil.URL("file://" + path.join(rootPath, ...args)).href;
}

export function getCopybooks(clientConfiguration: ClientConfiguration) {
    let copybookConfig = clientConfiguration.getConfiguration(COPYBOOK_PATH_SETTING) as string[];
    return getChildFiles(copybookConfig);
}
