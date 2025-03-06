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
import { createFileSearchPattern, getVariablesFromUri } from "./util/FSUtils";

interface ResourceDirectory {
  resources: string[];
  fileWatcher: vscode.FileSystemWatcher;
}

function generateCacheKey(localPath: vscode.Uri, allowedExtensions: string[]) {
  const uniqueSortedExtensions = allowedExtensions
    .sort()
    .filter(
      (extension, index, sortedExtensions) =>
        extension !== sortedExtensions[index - 1],
    );
  return `${localPath.toString()}|${uniqueSortedExtensions.join(",")}`;
}
export class LocalFilesystemResourceService {
  private folderContentCache: Record<string, ResourceDirectory> = {};

  private invalidateCachedPath(cacheKey: string) {
    return () => {
      if (this.folderContentCache[cacheKey]) {
        this.folderContentCache[cacheKey].fileWatcher.dispose();
        delete this.folderContentCache[cacheKey];
      }
    };
  }

  public async listDirectory(
    localPath: vscode.Uri,
    allowedExtensions: string[],
  ): Promise<string[]> {
    const cacheKey = generateCacheKey(localPath, allowedExtensions);
    if (typeof this.folderContentCache[cacheKey] !== "undefined") {
      return this.folderContentCache[cacheKey].resources;
    }

    const searchPattern = createFileSearchPattern(localPath, "*");

    const files = await vscode.workspace.findFiles(searchPattern);

    // Filter files by extensions - it would be nicer to filter the extensions
    // directly in the search glob pattern, but that's not possible if
    // we want to filter files with no extensions and files with specific
    // extensions by same pattern.
    const resources: string[] = [];
    files.forEach((resourceUri) => {
      const { filename, extension } = getVariablesFromUri(resourceUri);
      if (allowedExtensions.includes(extension)) {
        resources.push(filename);
      }
    });

    const fileWatcher = vscode.workspace.createFileSystemWatcher(searchPattern);
    fileWatcher.onDidCreate(this.invalidateCachedPath(cacheKey));
    fileWatcher.onDidDelete(this.invalidateCachedPath(cacheKey));

    this.folderContentCache[cacheKey] = {
      resources,
      fileWatcher,
    };

    return resources;
  }
}
