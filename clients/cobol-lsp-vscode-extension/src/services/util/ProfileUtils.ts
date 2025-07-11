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
  ): string | undefined {
    return ProfileUtils.getValidProfileForCopybookDownload(documentUri);
  }

  private static getValidProfileForCopybookDownload(
    documentUri: vscode.Uri,
  ): string | undefined {
    const profileFromDoc = ProfileUtils.getProfileFromDocument(documentUri);
    const passedProfile = SettingsService.getProfileName();
    if (!passedProfile && profileFromDoc) {
      return profileFromDoc;
    }
    return passedProfile;
  }

  public static getProfileFromDocument(
    documentUri: vscode.Uri,
  ): string | undefined {
    if (documentUri.scheme === "zowe-ds" || documentUri.scheme === "zowe-uss") {
      const profile = documentUri.path.split("/")[1];
      if (!profile) return undefined;
      return profile;
    }
  }
}
