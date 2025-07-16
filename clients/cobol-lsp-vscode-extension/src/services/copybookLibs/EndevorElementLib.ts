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
import { ENVIRONMENT } from "../../constants";
import { EndevorConfigModel, LibDefinition } from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { EndevorLib } from "./EndevorLib";
import { outputChannel } from "../util/OutputChannel";

export class EndevorElementLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorConfigModel) {
    super(config.profile);
  }

  static create(config: LibDefinition) {
    if (hasMember(config, ENVIRONMENT)) {
      return new EndevorElementLib(config);
    }
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: Uri,
    _dialect: string,
  ) {
    const profile = await this.getProfile(documentUri);

    if (!this.configCheck(documentUri)) {
      return;
    }

    if (profile) {
      const elements = await externalApis.e4eDownloader?.getElements(profile, {
        use_map: this.config.use_map === false ? false : true,
        environment: this.config.environment,
        stage: this.config.stage,
        system: this.config.system,
        subsystem: this.config.subsystem,
        type: this.config.type,
      });

      if (elements instanceof Error) {
        return;
      }

      copybookName = copybookName.toUpperCase();
      const foundElement = elements?.find(
        (e) => e.element.toUpperCase() == copybookName,
      );

      if (foundElement) {
        return async () =>
          externalApis.e4eDownloader?.downloadElementE4E(profile, foundElement);
      }
    }
  }

  async listCopybooks(documentUri: Uri, _dialect: string): Promise<string[]> {
    if (!this.configCheck(documentUri)) {
      return [];
    }

    const profile = await this.getProfile(documentUri);

    if (profile) {
      const list = await externalApis.e4eDownloader?.getElements(profile, {
        use_map: this.config.use_map === false ? false : true,
        environment: this.config.environment,
        stage: this.config.stage,
        system: this.config.system,
        subsystem: this.config.subsystem,
        type: this.config.type,
      });

      if (list instanceof Error) {
        outputChannel.error(
          list,
          this.config,
          `Unable to list copybooks from Endevor dataset`,
        );
        return [];
      }
      return list?.map((m) => m.element) ?? [];
    }
    return [];
  }
}
