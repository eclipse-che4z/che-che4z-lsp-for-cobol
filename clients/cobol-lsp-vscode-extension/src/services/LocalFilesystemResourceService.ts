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

interface ResourceCacheItem {
  filename: string;
  uri: vscode.Uri;
}

interface ResourceDirectory {
  resources: ResourceCacheItem[];
  fileWatcher: vscode.FileSystemWatcher;
}

function sanitizeExtensions(extensions: string[]) {
  return extensions
    .map((extension) => {
      if (extension.startsWith(".") || extension === "") {
        return extension.toUpperCase();
      }
      return `.${extension.toUpperCase()}`;
    })
    .sort()
    .filter(
      (extension, index, sortedExtensions) =>
        extension !== sortedExtensions[index - 1],
    );
}

function generateCacheKey(localPath: vscode.Uri, extensions: string[]) {
  return `${localPath.toString()}|${extensions.join(",")}`;
}
export class LocalFilesystemResourceService {
  private folderContentCache: Record<string, ResourceDirectory> = {};
  private fileChangeWatchers: ((changedFile: vscode.Uri) => void)[] = [];

  private invalidateCachedPath(cacheKey: string) {
    return () => {
      if (this.folderContentCache[cacheKey]) {
        this.folderContentCache[cacheKey].fileWatcher.dispose();
        delete this.folderContentCache[cacheKey];
      }
    };
  }

  public clearCache() {
    Object.values(this.folderContentCache).forEach((v) => {
      v.fileWatcher.dispose();
    });
    this.folderContentCache = {};
  }

  public async listDirectory(
    localPath: vscode.Uri,
    allowedExtensions: string[],
  ): Promise<ResourceCacheItem[]> {
    const sanitizedExtensions = sanitizeExtensions(allowedExtensions);

    const cacheKey = generateCacheKey(localPath, sanitizedExtensions);
    if (typeof this.folderContentCache[cacheKey] !== "undefined") {
      return this.folderContentCache[cacheKey].resources;
    }

    const searchPattern = createFileSearchPattern(localPath, "*");

    const files = await vscode.workspace.findFiles(searchPattern);

    // Filter files by extensions - it would be nicer to filter the extensions
    // directly in the search glob pattern, but that's not possible if
    // we want to filter files with no extensions and files with specific
    // extensions by same pattern.
    const resources: ResourceCacheItem[] = [];
    files.forEach((resourceUri) => {
      const { filename, extension } = getVariablesFromUri(resourceUri);
      if (sanitizedExtensions.includes(extension.toUpperCase())) {
        resources.push({ filename: filename.toUpperCase(), uri: resourceUri });
      }
    });

    const fileWatcher = vscode.workspace.createFileSystemWatcher(searchPattern);
    fileWatcher.onDidCreate(this.invalidateCachedPath(cacheKey));
    fileWatcher.onDidDelete(this.invalidateCachedPath(cacheKey));
    fileWatcher.onDidChange((changedFile) => {
      this.fileChangeWatchers.forEach((watcher) => watcher(changedFile));
    });

    this.folderContentCache[cacheKey] = {
      resources,
      fileWatcher,
    };

    return resources;
  }

  public registerFileChangeWatcher(watcher: (uri: vscode.Uri) => void) {
    this.fileChangeWatchers.push(watcher);
  }

  public async searchDirectory(
    localPath: vscode.Uri,
    fileName: string,
    allowedExtensions: string[],
  ): Promise<vscode.Uri | undefined> {
    const allFiles = await this.listDirectory(localPath, allowedExtensions);
    const upperCaseFilename = fileName.toUpperCase();
    return allFiles.find((f) => f.filename === upperCaseFilename)?.uri;
  }
}
