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
  private folderContentCache: Record<string, ResourceDirectory> = {};

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
    directoryUri: vscode.Uri,
    allowedExtensions: string[],
  ): Promise<ResourceCacheItem[]> {
    const sanitizedExtensions = sanitizeExtensions(allowedExtensions);

    const cacheKey = generateCacheKey(directoryUri, sanitizedExtensions);
    if (typeof this.folderContentCache[cacheKey] !== "undefined") {
      return this.folderContentCache[cacheKey].resources;
    }

    const entries = await vscode.workspace.fs.readDirectory(directoryUri);

    const resources: ResourceCacheItem[] = [];
    entries.forEach(([name, type]) => {
      if ((type & vscode.FileType.File) === 0) {
        return;
      }
      const resourceUri = vscode.Uri.joinPath(directoryUri, name);
      const { filename, extension } = getVariablesFromUri(resourceUri);
      if (sanitizedExtensions.includes(extension.toUpperCase())) {
        resources.push({ filename: filename.toUpperCase(), uri: resourceUri });
      }
    });

    const fileWatcher = vscode.workspace.createFileSystemWatcher(
      new vscode.RelativePattern(directoryUri, "*"),
    );
    fileWatcher.onDidCreate(this.invalidateCachedPath(cacheKey));
    fileWatcher.onDidDelete(this.invalidateCachedPath(cacheKey));

    this.folderContentCache[cacheKey] = {
      resources,
      fileWatcher,
    };

    return resources;
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
