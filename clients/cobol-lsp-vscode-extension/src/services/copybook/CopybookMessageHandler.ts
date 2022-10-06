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

import {SettingsService} from "../Settings";
import {searchInWorkspace} from "../util/FSUtils";
import {CopybookURI} from "./CopybookURI";
import {CopybookName} from "./CopybookDownloadService";

export function resolveCopybookHandler(cobolFileName: string, copybookName: string, dialectType: string): string {
    let result: string;
    result = searchInWorkspace(copybookName,
        SettingsService.getCopybookLocalPath(cobolFileName, dialectType), SettingsService.getCopybookExtension());
    // check in subfolders under .copybooks (copybook downloaded from MF)
    if (!result) {
        result = searchInWorkspace(
            copybookName,
            CopybookURI.createPathForCopybookDownloaded(
                cobolFileName,
                dialectType),
            SettingsService.getCopybookExtension());
    }
    return result;
}

export function downloadCopybookHandler(cobolFileName: string, copybookNames: string[], dialectType: string, quietMode: boolean): string {

    return this.downloadCopybooks(
        cobolFileName,
        copybookNames.map(copybookName => new CopybookName(copybookName, dialectType)),
        quietMode);

}
