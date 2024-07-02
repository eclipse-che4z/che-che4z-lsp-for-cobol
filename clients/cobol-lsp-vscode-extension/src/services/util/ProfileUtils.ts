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

import * as vscode from "vscode";
import { SettingsService } from "../Settings";

export class ProfileUtils {
  public static getProfileNameForCopybook(
    cobolFileName: string,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    if (!zoweExplorerApi) {
      return undefined;
    }
    return ProfileUtils.getValidProfileForCopybookDownload(
      cobolFileName,
      zoweExplorerApi,
    );
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

  private static getValidProfileForCopybookDownload(
    programUri: string,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    const profileFromDoc = ProfileUtils.getProfileFromDocument(
      programUri,
      zoweExplorerApi,
    );
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  public static getProfileFromDocument(
    programUri: string,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    const uri = vscode.Uri.parse(programUri);
    if (uri.scheme === "zowe-ds" || uri.scheme === "zowe-uss") {
      const profile = uri.path.split("/")[1];
      if (!profile) return undefined;
      return profile;
    }

    if (uri.scheme !== "file") return;

    if (!zoweExplorerApi) return;
    const eeApi = zoweExplorerApi.getExplorerExtenderApi();

    const fsPath = uri.fsPath;

    const openedFile =
      eeApi.ussFileProvider.openFiles[fsPath] ||
      eeApi.datasetProvider.openFiles[fsPath];

    return openedFile?.profile.name;
  }
}
