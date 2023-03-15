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

import { SettingsService } from "../Settings";
import { searchCopybookInWorkspace } from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import { CopybookName } from "./CopybookDownloadService";

enum CopybookFolderKind {
    "local", "downloaded-dsn", "downloaded-uss"
}

export function resolveCopybookHandler(cobolFileName: string, copybookName: string, dialectType: string): string {
    let result: string;
    result = searchCopybook(cobolFileName, copybookName, dialectType);
    // check in subfolders under .copybooks (copybook downloaded from MF)
    if (!result) {
        result = searchCopybookInWorkspace(
            copybookName,
            CopybookURI.createPathForCopybookDownloaded(
                cobolFileName,
                dialectType),
            SettingsService.getCopybookExtension());
    }
    return result;
}

function searchCopybook(cobolFileName: string, copybookName: string, dialectType: string) {
    let result: string;
    for (let i = 0; i < Object.values(CopybookFolderKind).length; i++) {
        const folderKind = Object.values(CopybookFolderKind)[i];
        const targetFolder = getTargetFolderForCopybook(folderKind, cobolFileName, dialectType);
        const allowedExtensions = resolveAllowedExtensions(folderKind);
        result = searchCopybookInWorkspace(copybookName, targetFolder, allowedExtensions);
         if (result) {
            return result;
        }
    }
    return result;
}

function getTargetFolderForCopybook(folderKind: string | CopybookFolderKind, cobolFileName: string, dialectType: string) {
    let result: string[];
    switch (folderKind) {
        case CopybookFolderKind[CopybookFolderKind.local]:
            result = SettingsService.getCopybookLocalPath(cobolFileName.replace(/\.[^/.]+$/, ""), dialectType);
            break;
        case CopybookFolderKind[CopybookFolderKind["downloaded-dsn"]]:
            result = SettingsService.getDsnPath(cobolFileName, dialectType).map(dnsPath => CopybookURI.createDatasetPath(SettingsService.getProfileName(), dnsPath));
            break;
        case CopybookFolderKind[CopybookFolderKind["downloaded-uss"]]:
            result = SettingsService.getUssPath(cobolFileName, dialectType).map(dnsPath => CopybookURI.createDatasetPath(SettingsService.getProfileName(), dnsPath));
            break;
    }
    return result || [];
}

function resolveAllowedExtensions(folderKind: string | CopybookFolderKind) {
    switch(folderKind) {
        case "downloaded-dsn":
        case "downloaded-uss":
            return [""];
        default:
            return SettingsService.getCopybookExtension();
    }

}
export function downloadCopybookHandler(cobolFileName: string, copybookNames: string[], dialectType: string, quietMode: boolean): string {

    return this.downloadCopybooks(
        cobolFileName,
        copybookNames.map(copybookName => new CopybookName(copybookName, dialectType)),
        quietMode);

}
