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
import * as vscode from "vscode";
import { SettingsService } from "../Settings";
import {
  getProgramNameFromUri,
  searchCopybookInExtensionFolder,
} from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import { CopybookName } from "./CopybookDownloadService";
import * as path from "path";
import {
  COPYBOOKS_FOLDER,
  DATASET,
  E4E_FOLDER,
  E4E_SCHEME,
  ENVIRONMENT,
  USE_MAP,
  ZOWE_FOLDER,
} from "../../constants";
import { E4ECopybookService } from "./E4ECopybookService";
import { Utils } from "../util/Utils";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";

enum CopybookFolderKind {
  "local",
  "downloaded-dsn",
  "downloaded-uss",
}

export async function resolveCopybookHandler(
  storagePath: string,
  outputChannel: vscode.OutputChannel,
  documentUri: string,
  copybookName: string,
  dialectType: string,
): Promise<string | undefined> {
  let result: string | undefined;

  if (await E4ECopybookService.getE4EClient(documentUri)) {
    result = await getE4ECopyBookLocation(
      copybookName,
      documentUri,
      storagePath,
      outputChannel,
    );
    return result;
  }
  result = await searchCopybook(
    documentUri,
    copybookName,
    dialectType,
    storagePath,
  );
  // check in subfolders under .copybooks (copybook downloaded from MF)
  if (!result) {
    result = searchCopybookInExtensionFolder(
      copybookName,
      await CopybookURI.createPathForCopybookDownloaded(
        documentUri,
        dialectType,
        path.join(storagePath, ZOWE_FOLDER, COPYBOOKS_FOLDER),
      ),
      SettingsService.getCopybookExtension(documentUri),
      storagePath,
    );
  }
  return result;
}

async function searchCopybook(
  documentUri: string,
  copybookName: string,
  dialectType: string,
  storagePath: string,
) {
  let result: string | undefined;

  for (let i = 0; i < Object.values(CopybookFolderKind).length; i++) {
    const folderKind = Object.values(CopybookFolderKind)[i];
    const targetFolder = getTargetFolderForCopybook(
      folderKind,
      documentUri,
      dialectType,
      storagePath,
    );
    const allowedExtensions = resolveAllowedExtensions(folderKind, documentUri);
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

function getTargetFolderForCopybook(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
  dialectType: string,
  storagePath: string,
) {
  let result: string[] = [];
  const profile = SettingsService.getProfileName()!;
  switch (folderKind) {
    case CopybookFolderKind[CopybookFolderKind.local]:
      result = SettingsService.getCopybookLocalPath(documentUri, dialectType);
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

function resolveAllowedExtensions(
  folderKind: string | CopybookFolderKind,
  documentUri: string,
) {
  switch (folderKind) {
    case "downloaded-dsn":
    case "downloaded-uss":
    case E4E_SCHEME:
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

async function getE4ECopyBookLocation(
  copybookName: string,
  documentUri: string,
  storagePath: string,
  outputChannel: vscode.OutputChannel,
) {
  const config = await E4ECopybookService.getE4EClient(
    documentUri,
    outputChannel,
  );
  if (!config) {
    throw Error;
  }
  const first = config.elements[copybookName];
  if (!first) return;
  let use_map;
  let instance;
  if (DATASET in first) {
    instance = Utils.profileAsString(config.profile);
    use_map = first.dataset;
  } else if (ENVIRONMENT in first) {
    use_map = first.use_map ? USE_MAP : "";
    instance = CopybookURI.getEnviromentPath(first, config.profile);
  } else return;
  const allowedExtensions = resolveAllowedExtensions(E4E_SCHEME, documentUri);
  const targetFolder = [
    CopybookURI.createDatasetPath(instance, use_map, storagePath, E4E_FOLDER),
  ];

  return searchCopybookInExtensionFolder(
    copybookName,
    targetFolder,
    allowedExtensions,
    storagePath,
  );
}
