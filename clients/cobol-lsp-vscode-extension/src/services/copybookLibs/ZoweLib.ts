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
import { externalApis, missingExtension } from "../ExternalAPIsService";

import {
  getProfileNameForCopybook,
  getProfileStatus,
} from "../util/ProfileUtils";

export abstract class ZoweLib {
  constructor(protected profile?: string) {}

  protected getProfile(documentUri: vscode.Uri) {
    return this.profile ?? getProfileNameForCopybook(documentUri) ?? "profile";
  }

  async configCheck(documentUri: vscode.Uri) {
    const profile = this.getProfile(documentUri);

    if (!externalApis.dsnService) {
      missingExtension(documentUri, "Zowe Explorer is not installed");
      return false;
    }

    const profileStatus = await getProfileStatus(profile, () =>
      this.accessCheck(profile, documentUri),
    );
    if (profileStatus === "locked-profile") {
      return false;
    }

    return true;
  }

  abstract accessCheck(profile: string, documentUri: vscode.Uri): Promise<void>;
}
