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
import { SettingsService } from "../Settings";
import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";

export const localCopybooks = new LocalFilesystemResourceService();

export async function listLocalCopybooks(
  documentUri: string,
  dialect: string,
  outputChannel?: vscode.OutputChannel,
): Promise<string[]> {
  const directoryPaths = await SettingsService.getCopybookLocalPath(
    documentUri,
    dialect,
    false,
  );
  const workspaceFolders = vscode.workspace.workspaceFolders ?? [];
  const searchDirectoryUris = SettingsService.prepareLocalSearchUris(
    directoryPaths,
    workspaceFolders,
  );

  const allowedExtensions =
    await SettingsService.getCopybookExtension(documentUri);

  const results = await Promise.allSettled(
    searchDirectoryUris.map(async (directoryUri) =>
      localCopybooks.listDirectory(directoryUri, allowedExtensions ?? []),
    ),
  );

  const copybooks: string[] = [];

  results.forEach((result) => {
    if (result.status === "fulfilled") {
      result.value.forEach((copybook) => copybooks.push(copybook.filename));
    } else {
      outputChannel?.appendLine(
        `Unable to load copybooks completions: ${result.reason}`,
      );
    }
  });

  return copybooks;
}

export async function searchLocalCopybooks(
  documentUri: string,
  copybookName: string,
  dialect: string,
): Promise<vscode.Uri | undefined> {
  const directoryPaths = await SettingsService.getCopybookLocalPath(
    documentUri,
    dialect,
    false,
  );
  const workspaceFolders = vscode.workspace.workspaceFolders ?? [];
  const searchDirectoryUris = SettingsService.prepareLocalSearchUris(
    directoryPaths,
    workspaceFolders,
  );

  const allowedExtensions =
    await SettingsService.getCopybookExtension(documentUri);

  const results = await Promise.allSettled(
    searchDirectoryUris.map(async (directoryUri) =>
      localCopybooks.searchDirectory(
        directoryUri,
        copybookName,
        allowedExtensions ?? [],
      ),
    ),
  );

  for (const result of results) {
    if (result.status === "fulfilled" && result.value) {
      return result.value;
    }
  }
}
