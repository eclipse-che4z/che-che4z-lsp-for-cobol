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

import { Uri } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import {
  EndevorDatasetConfigModel,
  LibDefinition,
} from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { EndevorLib } from "./EndevorLib";
import { outputChannel } from "../util/OutputChannel";

export class EndevorMemberLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorDatasetConfigModel) {
    super(config.profile);
  }

  static create(config: LibDefinition) {
    if (hasMember(config, "dataset")) {
      return new EndevorMemberLib(config);
    }
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: Uri,
    _dialect: string,
  ) {
    if (!this.configCheck(documentUri)) {
      return;
    }

    const profile = await this.getProfile(documentUri);

    if (profile) {
      const members = await externalApis.e4eDownloader?.getMembers(
        profile,
        this.config.dataset,
      );

      if (members instanceof Error) {
        return;
      }

      copybookName = copybookName.toUpperCase();
      const foundMember = members?.find(
        (member) => member.member.toUpperCase() === copybookName,
      );

      if (foundMember) {
        return async () =>
          externalApis.e4eDownloader?.downloadDatasetE4E(profile, foundMember);
      }
    }
  }

  async listCopybooks(documentUri: Uri, _dialect: string): Promise<string[]> {
    if (!this.configCheck(documentUri)) {
      return [];
    }
    const profile = await this.getProfile(documentUri);
    if (profile) {
      const list = await externalApis.e4eDownloader?.getMembers(
        profile,
        this.config.dataset,
      );
      if (list instanceof Error) {
        outputChannel.error(
          list,
          this.config,
          `Unable to list copybooks from Endevor dataset`,
        );
        return [];
      }
      return list?.map((m) => m.member) ?? [];
    }
    return [];
  }
}
