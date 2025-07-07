/*
 * Copyright (c) 2025 Broadcom.
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
import { ProfileUtils } from "../util/ProfileUtils";
import { externalApis, missingExtension } from "../ExternalAPIsService";
import {
  DownloadUtil,
  MainframeRemoteLocation,
} from "../copybook/downloader/DownloadUtil";
import { PROVIDE_PROFILE_MSG_PROC_GRUOPS } from "../../constants";

export abstract class ZoweLib {
  constructor(protected profile?: string) {}

  protected getProfile(documentUri: vscode.Uri) {
    return (
      this.profile ??
      ProfileUtils.getProfileNameForCopybook(
        documentUri,
        externalApis.explorerApi,
      ) ??
      "profile"
    );
  }

  async configCheck(documentUri: vscode.Uri) {
    const profile = this.getProfile(documentUri);

    if (!externalApis.dsnService) {
      missingExtension(documentUri, "Zowe Explorer is not installed");
      return false;
    }

    if (await DownloadUtil.isProfileLocked(profile)) {
      return false;
    }

    const availableProfiles = ProfileUtils.getAvailableProfiles(
      externalApis.explorerApi,
    );
    if (!availableProfiles.includes(profile)) {
      const msg = `${PROVIDE_PROFILE_MSG_PROC_GRUOPS} Provided invalid profile name: ${profile}`;
      vscode.window.showErrorMessage(msg);
      return false;
    }

    if (
      await DownloadUtil.checkForInvalidCredProfile(
        profile,
        this.credentialsTestLocation(),
      )
    ) {
      return false;
    }

    return true;
  }

  abstract credentialsTestLocation(): MainframeRemoteLocation;
}
