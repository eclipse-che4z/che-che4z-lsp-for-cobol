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
    documentUri: vscode.Uri,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    if (!zoweExplorerApi) {
      return undefined;
    }
    return ProfileUtils.getValidProfileForCopybookDownload(
      documentUri,
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
    documentUri: vscode.Uri,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    const profileFromDoc = ProfileUtils.getProfileFromDocument(
      documentUri,
      zoweExplorerApi,
    );
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  public static getProfileFromDocument(
    documentUri: vscode.Uri,
    zoweExplorerApi: IApiRegisterClient | undefined,
  ): string | undefined {
    if (documentUri.scheme === "zowe-ds" || documentUri.scheme === "zowe-uss") {
      const profile = documentUri.path.split("/")[1];
      if (!profile) return undefined;
      return profile;
    }

    if (documentUri.scheme !== "file") return;

    if (!zoweExplorerApi) return;
    const eeApi = zoweExplorerApi.getExplorerExtenderApi();

    const fsPath = documentUri.fsPath;

    const openedFile =
      (eeApi.ussFileProvider.openFiles &&
        eeApi.ussFileProvider.openFiles[fsPath]) ||
      (eeApi.datasetProvider.openFiles &&
        eeApi.datasetProvider.openFiles[fsPath]);

    return openedFile?.profile.name;
  }
}
