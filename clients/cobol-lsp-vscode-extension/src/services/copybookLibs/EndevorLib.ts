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
import { ResolvedProfile } from "../../type/e4eApi";
import { externalApis, missingExtension } from "../ExternalAPIsService";

export abstract class EndevorLib {
  constructor(protected profile?: string) {}

  protected configCheck(documentUri: vscode.Uri) {
    if (!externalApis.e4eDownloader) {
      missingExtension(documentUri, "Explorer for Endevor is not installed");
      return false;
    }

    return true;
  }

  protected async getProfile(
    documentUri: vscode.Uri,
  ): Promise<ResolvedProfile | undefined> {
    if (this.profile) {
      return await externalApis.e4eDownloader?.getProfileInfo(this.profile);
    } else {
      return await externalApis.e4eDownloader?.getProfileForUri(documentUri);
    }
  }
}
