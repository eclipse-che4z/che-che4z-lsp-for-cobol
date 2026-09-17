/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import { VirtualFilesystemResourceService } from "../VirtualFilesystemResourceService";
import { LibDefinition } from "../ProcessorGroupsLoader";
import { SettingsService } from "../Settings";
import { getVariablesFromUri } from "../util/FSUtils";
import { isSchemeQualifiedPath } from "../util/Utils";
import { outputChannel } from "../util/OutputChannel";
import CopybookLib from "./CopybookLib";
import * as vscode from "vscode";

export const virtualCopybooks = new VirtualFilesystemResourceService();

/**
 * Resolves copybooks under a scheme-qualified paths-local entry (e.g.
 * "zowe-uss:/profile/path") - a vscode.FileSystemProvider registered by
 * another extension, rather than the local filesystem. Unlike LocalPathLib,
 * the evaluated path is always treated as a single literal directory: no
 * glob segments are supported.
 */
export default class VirtualPathLib implements CopybookLib {
  constructor(private path: string) {}

  static create(config: LibDefinition) {
    if (typeof config === "string" && isSchemeQualifiedPath(config)) {
      return new VirtualPathLib(config);
    }
  }

  private getUri(documentUri: vscode.Uri): vscode.Uri | undefined {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.path,
      variables,
    );

    try {
      return vscode.Uri.parse(evaluatedPath, true);
    } catch (e) {
      const message = e instanceof Error ? e.message : String(e);
      outputChannel.error(
        `Invalid copybook path URI "${evaluatedPath}": ${message}`,
      );
      return undefined;
    }
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    dialect: string,
  ) {
    const uri = this.getUri(documentUri);
    if (!uri) {
      return;
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    try {
      return await virtualCopybooks.searchDirectory(
        uri,
        copybookName,
        allowedExtensions ?? [],
      );
    } catch (e) {
      const message = e instanceof Error ? e.message : String(e);
      outputChannel.error(
        `Unable to resolve copybook "${copybookName}": ${message}`,
      );
      return undefined;
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    dialect: string,
  ): Promise<string[]> {
    const uri = this.getUri(documentUri);
    if (!uri) {
      return [];
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    try {
      const files = await virtualCopybooks.listDirectory(
        uri,
        allowedExtensions ?? [],
      );
      return files.map((copybook) => copybook.filename);
    } catch (e) {
      outputChannel.error(
        `Unable to load copybooks completions: ${JSON.stringify(e)}`,
      );
      return [];
    }
  }
}
