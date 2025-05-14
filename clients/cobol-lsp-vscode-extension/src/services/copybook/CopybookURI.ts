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
import { COPYBOOKS_FOLDER, E4E_FOLDER, ZOWE_FOLDER } from "../../constants";
import { SettingsService } from "../Settings";
import { ProfileUtils } from "../util/ProfileUtils";
import { EndevorType, ResolvedProfile } from "../../type/e4eApi.d";
import { Utils } from "../util/Utils";
import * as vscode from "vscode";

// Source can be only a single level directory, with no subdirectories
type CopybooksSource = typeof ZOWE_FOLDER | typeof E4E_FOLDER;

/**
 * This class is responsible to identify from which source resolve copybooks required by the server.
 */
export class CopybookURI {
  /**
   * Return copybooks dataset path including download folder
   * {downloadFolder}/{zowe/e4e}/copybooks/{profile}/{dataset}
   */
  public static createDatasetPath(
    profileName: string[],
    dataset: string,
    downloadFolder: vscode.Uri,
    source: CopybooksSource = ZOWE_FOLDER,
  ) {
    return vscode.Uri.joinPath(
      downloadFolder,
      ...this.createDatasetSubdirectories(profileName, source, dataset),
    );
  }

  public static createDatasetSubdirectories(
    profileName: string[],
    source: CopybooksSource,
    dataset: string,
  ): string[] {
    return [source, COPYBOOKS_FOLDER, ...profileName, dataset];
  }
  /**
   * This method produce an array with element that following the schema
   * "file://[EXTENSION_FOLDER]/zowe/copybooks/PROFILE/DATASET" or
   * "file://[EXTENSION_FOLDER]/zowe/copybooks/PROFILE/USS"
   * @param profile represent a name of a folder within the copybooks folder that have the same name as the
   * connection name needed to download copybooks from mainframe.
   */
  public static createPathForCopybookDownloaded(
    documentUri: string,
    dialectType: string,
    downloadFolder: string,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string[] {
    const profile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      zoweExplorerApi,
    );
    if (!profile) {
      return [];
    }

    const remotePaths = [
      ...SettingsService.getDsnPath(documentUri, dialectType),
      ...SettingsService.getUssPath(documentUri, dialectType),
    ];

    return remotePaths.map(
      (remote) =>
        vscode.Uri.joinPath(vscode.Uri.file(downloadFolder), profile, remote)
          .fsPath,
    );
  }

  public static getEnviromentPath(
    type: EndevorType,
    profile: ResolvedProfile,
  ): string[] {
    return [
      Utils.profileAsString(profile),
      type.environment,
      type.stage,
      type.system,
      type.subsystem,
      type.type,
    ];
  }
}
