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
import { searchCopybookInExtensionFolder } from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import { Uri } from "vscode";

enum CopybookFolderKind {
  "local",
  "downloaded-dsn",
  "downloaded-uss",
}

export async function searchCopybook(
  documentUri: string,
  copybookName: string,
  dialectType: string,
  storagePath: string,
): Promise<Uri | undefined> {
  let result: Uri | undefined;

  for (let i = 0; i < Object.values(CopybookFolderKind).length; i++) {
    const folderKind = Object.values(CopybookFolderKind)[i];
    const targetFolder = await getTargetFolderForCopybook(
      folderKind,
      documentUri,
      dialectType,
      storagePath,
    );
    const allowedExtensions = await resolveAllowedExtensions(
      folderKind,
      documentUri,
    );
    result = searchCopybookInExtensionFolder(
      copybookName,
      targetFolder,
      allowedExtensions,
      storagePath,
    );
    if (result) {
      return result;
    }
  }
  return result;
}

async function getTargetFolderForCopybook(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
  dialectType: string,
  storagePath: string,
): Promise<string[]> {
  let result: string[] = [];
  const profile = SettingsService.getProfileName()!;
  switch (folderKind) {
    case CopybookFolderKind[CopybookFolderKind.local]:
      result = await SettingsService.getCopybookLocalPath(
        documentUri,
        dialectType,
      );
      break;
    case CopybookFolderKind[CopybookFolderKind["downloaded-dsn"]]:
      result = SettingsService.getDsnPath(documentUri, dialectType).map(
        (dnsPath) =>
          CopybookURI.createDatasetPath(profile, dnsPath, storagePath),
      );
      break;
    case CopybookFolderKind[CopybookFolderKind["downloaded-uss"]]:
      result = SettingsService.getUssPath(documentUri, dialectType).map(
        (dnsPath) =>
          CopybookURI.createDatasetPath(profile, dnsPath, storagePath),
      );
      break;
  }
  return result;
}

async function resolveAllowedExtensions(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
): Promise<string[] | undefined> {
  switch (folderKind) {
    case "downloaded-dsn":
    case "downloaded-uss":
      return [""];
    default:
      return SettingsService.getCopybookExtension(documentUri);
  }
}
