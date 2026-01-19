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

import { DATASET } from "../../constants";
import * as vscode from "vscode";
import CopybookLib from "./CopybookLib";
import { LibDefinition } from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { ZoweLib } from "./ZoweLib";
import { zoweSemaphore } from "../copybook/ZoweThrottling";

export class DatasetLib extends ZoweLib implements CopybookLib {
  constructor(
    private dsn: string,
    profile?: string,
  ) {
    super(profile);
  }

  static create(config: LibDefinition) {
    if (typeof config === "object" && DATASET in config) {
      return new DatasetLib(config.dataset, config.profile);
    }
  }

  async accessCheck(profile: string): Promise<void> {
    await zoweSemaphore.locked(() =>
      vscode.workspace.fs.stat(
        vscode.Uri.from({
          scheme: "zowe-ds",
          path: `/${profile}/${this.dsn}`,
          query: "fetch=true",
        }),
      ),
    );
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<vscode.Uri | undefined> {
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return;
    }

    const member = await externalApis.dsnService?.hasMember(
      profile,
      this.dsn,
      copybookName,
      [],
    );

    if (member) {
      return vscode.Uri.from({
        scheme: "zowe-ds",
        path: `/${profile}/${this.dsn}/${member.name}${member.extension ? member.extension : ""}`,
      });
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<string[]> {
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return [];
    }

    const members = await externalApis.dsnService?.getAllMembers(
      profile,
      this.dsn,
    );

    return members?.map((m) => m.name) ?? [];
  }
}
