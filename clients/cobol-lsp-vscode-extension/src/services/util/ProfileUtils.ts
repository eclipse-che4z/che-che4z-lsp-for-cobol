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
    return ProfileUtils.getValidProfileForCopybookDownload(
      cobolFileName,
      ProfileUtils.getAvailableProfiles(zoweExplorerApi),
    );
  }

  public static getAvailableProfiles(zoweExplorerApi: IApiRegisterClient) {
    let availableProfiles: string[] = [];
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

  private static getValidProfileForCopybookDownload(
    programName: string,
    availableProfiles: string[],
  ): string | undefined {
    const profileFromDoc = ProfileUtils.getProfileFromDocument(
      programName,
      availableProfiles,
    );
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  private static getProfileFromDocument(
    programName: string,
    availableProfiles: string[],
  ): string | undefined {
    for (const doc of vscode.workspace.textDocuments) {
      const openName = path.basename(doc.fileName);
      if (unescape(programName) === openName) {
        const profile = ProfileUtils.tryGetProfileFromDocumentPath(
          doc.fileName,
          availableProfiles,
        );
        if (profile) {
          return profile;
        }
      }
    }
    return undefined;
  }

  private static tryGetProfileFromDocumentPath(
    docPath: string,
    availableProfiles: string[],
  ): string | undefined {
    const segments: string[] = docPath.split(path.sep);
    if (segments.length < 2) {
      return undefined;
    }
    const profileName = segments[segments.length - 2];
    if (availableProfiles.indexOf(profileName) >= 0) {
      return profileName;
    }
    return undefined;
  }
}
