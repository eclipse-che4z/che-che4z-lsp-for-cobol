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

import CopybookLib from "./CopybookLib";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { LibDefinition } from "../ProcessorGroupsLoader";
import { USS } from "../../constants";
import * as vscode from "vscode";
import { externalApis } from "../ExternalAPIsService";
import { ZoweLib } from "./ZoweLib";
import { zoweSemaphore } from "../copybook/ZoweThrottling";

export class UssPathLib extends ZoweLib implements CopybookLib {
  constructor(
    private uss: string,
    profile?: string,
  ) {
    super(profile);
  }

  static create(config: LibDefinition) {
    if (typeof config === "object" && USS in config) {
      return new UssPathLib(config.uss, config.profile);
    }
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    dialect: string,
  ): Promise<vscode.Uri | undefined> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.uss,
      variables,
    );

    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return;
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    const member = await externalApis.ussService?.hasMember(
      profile,
      evaluatedPath,
      copybookName,
      allowedExtensions,
    );

    if (member) {
      return vscode.Uri.from({
        scheme: "zowe-uss",
        path: `/${profile}${evaluatedPath}/${member.name}${member.extension ? member.extension : ""}`,
      });
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    dialect: string,
  ): Promise<string[]> {
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return [];
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.uss,
      variables,
    );

    const members = await externalApis.ussService?.getAllMembers(
      profile,
      evaluatedPath,
      allowedExtensions,
    );

    return members?.map((m) => m.name) ?? [];
  }

  async accessCheck(profile: string, documentUri: vscode.Uri): Promise<void> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.uss,
      variables,
    );
    await zoweSemaphore.locked(() =>
      vscode.workspace.fs.stat(
        vscode.Uri.from({
          scheme: "zowe-uss",
          path: `/${profile}${evaluatedPath}`,
          query: "fetch=true",
        }),
      ),
    );
  }
}
