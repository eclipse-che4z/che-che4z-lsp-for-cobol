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

import { loadProcessorGroupCopybookPathsConfig } from "../ProcessorGroups";
import { SettingsService } from "../Settings";
import { searchCopybookInExtensionFolder } from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import { Uri } from "vscode";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";
import {
  DATASET,
  E4E_FOLDER,
  ENVIRONMENT,
  USE_MAP,
  USSFILE,
} from "../../constants";
import { EndevorType } from "../../type/e4eApi";
import { CopybookDownloaderForDsn } from "./downloader/CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "./downloader/CopybookDownloaderForUss";

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
  e4eDownloader?: CopybookDownloaderForE4E,
  dsnDownloader?: CopybookDownloaderForDsn,
  ussDownloader?: CopybookDownloaderForUss,
): Promise<Uri | undefined> {
  let result: Uri | undefined;

  const procGroupResult = await searchCopybookinProcessorGroups(
    documentUri,
    copybookName,
    dialectType,
    storagePath,
    e4eDownloader,
    dsnDownloader,
    ussDownloader,
  );
  if (procGroupResult && typeof procGroupResult != "boolean")
    return procGroupResult;
  else if (procGroupResult) return;

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
    case CopybookFolderKind[CopybookFolderKind["downloaded-dsn"]]: {
      result = SettingsService.getDsnPath(documentUri, dialectType).map(
        (dnsPath) =>
          CopybookURI.createDatasetPath([profile], dnsPath, storagePath).fsPath,
      );
      break;
    }
    case CopybookFolderKind[CopybookFolderKind["downloaded-uss"]]:
      result = SettingsService.getUssPath(documentUri, dialectType).map(
        (dnsPath) =>
          CopybookURI.createDatasetPath([profile], dnsPath, storagePath).fsPath,
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
async function searchCopybookinProcessorGroups(
  documentUri: string,
  copybookName: string,
  dialectType: string,
  storagePath: string,
  e4eDownloader?: CopybookDownloaderForE4E,
  dsnDownloader?: CopybookDownloaderForDsn,
  ussDownloader?: CopybookDownloaderForUss,
): Promise<boolean | Uri> {
  let result: Uri | undefined;
  const pgConfigs = await loadProcessorGroupCopybookPathsConfig(
    { scopeUri: documentUri },
    [],
    dialectType,
  );
  let shouldFound = false;
  if (Array.isArray(pgConfigs) && pgConfigs.length > 0) {
    for (const config of pgConfigs) {
      let folders: string = "";
      if (typeof config === "string") {
        folders = config;
      } else if (
        typeof config === "object" &&
        ENVIRONMENT in config &&
        e4eDownloader
      ) {
        const profile = await e4eDownloader.getProfileInfo(config.profile);
        config.use_map = config.use_map ? config.use_map : true;
        if (!profile) continue;
        const has = await e4eDownloader.hasElement(
          profile,
          config as EndevorType,
          copybookName,
        );
        if (!has) continue;
        folders = CopybookURI.createDatasetPath(
          CopybookURI.getEnviromentPath(config as EndevorType, profile),
          config.use_map ? USE_MAP : "",
          storagePath,
          E4E_FOLDER,
        ).fsPath;
        shouldFound = true;
      } else if (typeof config === "object" && DATASET in config) {
        const has = await dsnDownloader?.hasMember(
          config.profile ? config.profile : SettingsService.getProfileName()!,
          config.dataset,
          copybookName,
        );
        if (!has) continue;
        folders = CopybookURI.createDatasetPath(
          config.profile
            ? [config.profile]
            : [SettingsService.getProfileName()!],
          config.dataset,
          storagePath,
        ).fsPath;
        shouldFound = true;
      } else if (typeof config === "object" && USSFILE in config) {
        const has = await ussDownloader?.hasMember(
          config.profile ? config.profile : SettingsService.getProfileName()!,
          config.ussFile,
          copybookName,
        );
        if (!has) continue;
        folders = CopybookURI.createDatasetPath(
          config.profile
            ? [config.profile]
            : [SettingsService.getProfileName()!],
          config.ussFile,
          storagePath,
        ).fsPath;
        shouldFound = true;
      }

      result = searchCopybookInExtensionFolder(
        copybookName,
        folders ? [folders] : [],
        await SettingsService.getCopybookExtension(documentUri),
        storagePath,
      );
      if (typeof config === "string" && !result) continue;

      if (result) return result;
      if (shouldFound) return true;
    }
  }
  return false;
}
