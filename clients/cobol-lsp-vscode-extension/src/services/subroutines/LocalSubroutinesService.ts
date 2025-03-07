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
import { COBOL_EXT_ARRAY_CASE_INSENSITIVE } from "../../constants";
import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";
import { getChannel } from "../../extension";

const localSubroutines = new LocalFilesystemResourceService();

export async function listLocalSubroutines(): Promise<string[]> {
  const directoryPaths = SettingsService.getSubroutineLocalPath() ?? [];
  const workspaceFolders = vscode.workspace.workspaceFolders ?? [];
  const absoluteDirectoryPaths = SettingsService.prepareLocalSearchUris(
    directoryPaths,
    workspaceFolders,
  );

  const results = await Promise.allSettled([
    ...absoluteDirectoryPaths.map(async (directoryPath) => {
      return await localSubroutines.listDirectory(
        directoryPath,
        COBOL_EXT_ARRAY_CASE_INSENSITIVE,
      );
    }),
  ]);

  const subroutines: string[] = [];

  results.forEach((result) => {
    if (result.status === "fulfilled") {
      result.value.forEach((subroutine) => subroutines.push(subroutine));
    } else {
      getChannel().appendLine(
        `Unable to load subroutines completions: ${result.reason}`,
      );
    }
  });

  return subroutines;
}
