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
import { Uri } from "vscode";
import * as path from "path";

enum CopybookFolderKind {
  "local",
  "downloaded-dsn",
  "downloaded-uss",
}

export async function resolveCopybookHandler(
  documentUri: string,
  copybookName: string,
  dialectType: string,
): Promise<string | undefined> {
  let result: string | undefined;
  result = searchCopybook(documentUri, copybookName, dialectType);
  // check in subfolders under .copybooks (copybook downloaded from MF)
  if (!result) {
    result = searchCopybookInWorkspace(
      copybookName,
      await CopybookURI.createPathForCopybookDownloaded(
        documentUri,
        dialectType,
      ),
      SettingsService.getCopybookExtension(documentUri),
    );
  }
  return result;
}

function searchCopybook(
  documentUri: string,
  copybookName: string,
  dialectType: string,
) {
  let result: string | undefined;
  for (let i = 0; i < Object.values(CopybookFolderKind).length; i++) {
    const folderKind = Object.values(CopybookFolderKind)[i];
    const targetFolder = getTargetFolderForCopybook(
      folderKind,
      documentUri,
      dialectType,
    );
    const allowedExtensions = resolveAllowedExtensions(folderKind, documentUri);
    result = searchCopybookInWorkspace(
      copybookName,
      targetFolder,
      allowedExtensions,
    );
    if (result) {
      return result;
    }
  }
  return result;
}

function getTargetFolderForCopybook(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
  dialectType: string,
) {
  let result: string[] = [];
  const profile = SettingsService.getProfileName()!;
  switch (folderKind) {
    case CopybookFolderKind[CopybookFolderKind.local]:
      result = SettingsService.getCopybookLocalPath(documentUri, dialectType);
      break;
    case CopybookFolderKind[CopybookFolderKind["downloaded-dsn"]]:
      result = SettingsService.getDsnPath(documentUri, dialectType).map(
        (dnsPath) => CopybookURI.createDatasetPath(profile, dnsPath),
      );
      break;
    case CopybookFolderKind[CopybookFolderKind["downloaded-uss"]]:
      result = SettingsService.getUssPath(documentUri, dialectType).map(
        (dnsPath) => CopybookURI.createDatasetPath(profile, dnsPath),
      );
      break;
  }
  return result;
}

function resolveAllowedExtensions(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
) {
  switch (folderKind) {
    case "downloaded-dsn":
    case "downloaded-uss":
      return [""];
    default:
      return SettingsService.getCopybookExtension(documentUri);
  }
}
export function downloadCopybookHandler(
  this: any,
  cobolFileName: string,
  copybookNames: string[],
  dialectType: string,
  quietMode: boolean,
): string {
  return this.downloadCopybooks(
    cobolFileName,
    copybookNames.map(
      (copybookName) => new CopybookName(copybookName, dialectType),
    ),
    quietMode,
  );
}
