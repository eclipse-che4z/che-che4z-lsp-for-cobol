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
    programUri: string,
  ): Promise<string | undefined> {
    const profileFromDoc = await ProfileUtils.getProfileFromDocument(
      programUri,
    );
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  private static async getProfileFromDocument(
    programUri: string,
  ): Promise<string | undefined> {
    const zoweExplorerApi = await Utils.getZoweExplorerAPI();
    if (!zoweExplorerApi) return;
    const eeApi = zoweExplorerApi.getExplorerExtenderApi();

    const uri = vscode.Uri.parse(programUri);
    if (uri.scheme !== "file") return;
    const fsPath = uri.fsPath;

    // TODO: `openFiles` is deprecated in vNext
    const openedFile =
      eeApi.ussFileProvider.openFiles[fsPath] ||
      eeApi.datasetProvider.openFiles[fsPath];

    return openedFile?.profile.name;
  }
}
