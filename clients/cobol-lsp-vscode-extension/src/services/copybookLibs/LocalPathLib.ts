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

import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";
import { LibDefinition } from "../ProcessorGroupsLoader";
import { SettingsService } from "../Settings";
import { getVariablesFromUri } from "../util/FSUtils";
import { outputChannel } from "../util/OutputChannel";
import CopybookLib from "./CopybookLib";
import * as vscode from "vscode";

export const localCopybooks = new LocalFilesystemResourceService();

export default class LocalPathLib implements CopybookLib {
  constructor(private path: string) {}

  static create(config: LibDefinition) {
    if (typeof config === "string") {
      return new LocalPathLib(config);
    }
  }

  private getUris(documentUri: vscode.Uri) {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.path,
      variables,
    );

    return SettingsService.prepareLocalSearchUris(
      [evaluatedPath],
      vscode.workspace.workspaceFolders ?? [],
    );
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    dialect: string,
  ) {
    const uris = this.getUris(documentUri);

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );
    const promises = uris.map(async (uri) => {
      return await localCopybooks.searchDirectory(
        uri,
        copybookName,
        allowedExtensions ?? [],
      );
    });

    const results = await Promise.allSettled(promises);
    for (const result of results) {
      if (result.status === "fulfilled" && result.value) {
        return result.value;
      }
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    dialect: string,
  ): Promise<string[]> {
    const uris = this.getUris(documentUri);

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    const results = await Promise.allSettled(
      uris.map(async (directoryUri) =>
        localCopybooks.listDirectory(directoryUri, allowedExtensions ?? []),
      ),
    );

    const copybooks: string[] = [];

    results.forEach((result) => {
      if (result.status === "fulfilled") {
        result.value.forEach((copybook) => copybooks.push(copybook.filename));
      } else {
        outputChannel.error(
          `Unable to load copybooks completions: ${JSON.stringify(result.reason)}`,
        );
      }
    });

    return copybooks;
  }
}
