/*
 * Copyright (c) 2023 Broadcom.
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

import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../Settings";
import { Utils } from "./Utils";

export class ProfileUtils {
  public static async getProfileNameForCopybook(
    cobolFileName: string,
  ): Promise<string | undefined> {
    const zoweExplorerApi = await Utils.getZoweExplorerAPI();
    if (!zoweExplorerApi) {
      return undefined;
    }
    return ProfileUtils.getValidProfileForCopybookDownload(cobolFileName);
  }

  public static getAvailableProfiles(zoweExplorerApi: IApiRegisterClient) {
    let availableProfiles: string[] = [];
    if (!zoweExplorerApi) return availableProfiles;
    zoweExplorerApi.registeredApiTypes().forEach((profileType) => {
      availableProfiles = availableProfiles.concat(
        zoweExplorerApi
          .getExplorerExtenderApi()
          .getProfilesCache()
          .getProfiles(profileType)
          ?.map((ele) => ele.name),
      );
    });
    return availableProfiles;
  }

  private static async getValidProfileForCopybookDownload(
    programName: string,
  ): Promise<string | undefined> {
    const profileFromDoc = await ProfileUtils.getProfileFromDocument(
      programName,
    );
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  private static async getProfileFromDocument(
    programName: string,
  ): Promise<string | undefined> {
    const vscodeOpenedDoc = vscode.workspace.textDocuments.find((doc) =>
      doc.fileName.endsWith(programName),
    );
    if (!vscodeOpenedDoc) return;

    const zoweExplorerApi = await Utils.getZoweExplorerAPI();
    const allOpenedFilesThroughZoweExplorer = zoweExplorerApi
      ? {
          ...zoweExplorerApi.getExplorerExtenderApi().ussFileProvider.openFiles,
          ...zoweExplorerApi.getExplorerExtenderApi().datasetProvider.openFiles,
        }
      : [];

    const cobolLsDocPath = vscode.Uri.parse(vscodeOpenedDoc.fileName).fsPath;
    for (const [path, profile] of Object.entries(
      allOpenedFilesThroughZoweExplorer,
    )) {
      if (cobolLsDocPath === vscode.Uri.parse(path).fsPath) {
        return profile.profile.name;
      }
    }
    return undefined;
  }
}
