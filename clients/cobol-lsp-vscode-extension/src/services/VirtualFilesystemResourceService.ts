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

import * as vscode from "vscode";
import { getVariablesFromUri } from "./util/FSUtils";
import { Memoize } from "./util/Memoize";

interface ResourceCacheItem {
  filename: string;
  uri: vscode.Uri;
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

function generateCacheKey(directoryUri: vscode.Uri, extensions: string[]) {
  return `${directoryUri.toString()}|${extensions.join(",")}`;
}

/**
 * Lists copybook directories on a vscode.FileSystemProvider (e.g. a
 * third-party extension's virtual filesystem) via readDirectory, since
 * vscode.workspace.findFiles only searches providers that also implement
 * search - unlike LocalFilesystemResourceService, no glob segments are
 * supported: a directory path is always treated as a single literal
 * directory.
 */
export class VirtualFilesystemResourceService {
  private fileWatchers = new Map<string, vscode.FileSystemWatcher>();

  private directoryCache = new Memoize<
    [directoryUri: vscode.Uri, sanitizedExtensions: string[]],
    ResourceCacheItem[]
  >(
    async (directoryUri, sanitizedExtensions) => {
      const entries = await vscode.workspace.fs.readDirectory(directoryUri);

      const resources: ResourceCacheItem[] = [];
      entries.forEach(([name, type]) => {
        if ((type & vscode.FileType.File) === 0) {
          return;
        }
        const resourceUri = vscode.Uri.joinPath(directoryUri, name);
        const { filename, extension } = getVariablesFromUri(resourceUri);
        if (sanitizedExtensions.includes(extension.toUpperCase())) {
          resources.push({
            filename: filename.toUpperCase(),
            uri: resourceUri,
          });
        }
      });

      return resources;
    },
    undefined,
    (directoryUri, sanitizedExtensions) =>
      generateCacheKey(directoryUri, sanitizedExtensions),
  );

  private ensureWatcher(
    directoryUri: vscode.Uri,
    sanitizedExtensions: string[],
    cacheKey: string,
  ) {
    if (this.fileWatchers.has(cacheKey)) {
      return;
    }
    const fileWatcher = vscode.workspace.createFileSystemWatcher(
      new vscode.RelativePattern(directoryUri, "*"),
    );
    const invalidate = () =>
      this.directoryCache.invalidateCache(directoryUri, sanitizedExtensions);
    fileWatcher.onDidCreate(invalidate);
    fileWatcher.onDidDelete(invalidate);
    this.fileWatchers.set(cacheKey, fileWatcher);
  }

  public clearCache() {
    this.fileWatchers.forEach((watcher) => {
      watcher.dispose();
    });
    this.fileWatchers.clear();
    this.directoryCache.clearCache();
  }

  public async listDirectory(
    directoryUri: vscode.Uri,
    allowedExtensions: string[],
  ): Promise<ResourceCacheItem[]> {
    const sanitizedExtensions = sanitizeExtensions(allowedExtensions);
    const cacheKey = generateCacheKey(directoryUri, sanitizedExtensions);

    this.ensureWatcher(directoryUri, sanitizedExtensions, cacheKey);

    return (
      (await this.directoryCache.execute(directoryUri, sanitizedExtensions)) ??
      []
    );
  }

  public async searchDirectory(
    directoryUri: vscode.Uri,
    fileName: string,
    allowedExtensions: string[],
  ): Promise<vscode.Uri | undefined> {
    const allFiles = await this.listDirectory(directoryUri, allowedExtensions);
    const upperCaseFilename = fileName.toUpperCase();
    return allFiles.find((f) => f.filename === upperCaseFilename)?.uri;
  }
}
