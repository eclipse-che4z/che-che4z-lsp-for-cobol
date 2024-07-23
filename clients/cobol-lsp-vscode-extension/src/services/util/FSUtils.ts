/*
 * Copyright (c) 2020 Broadcom.
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

import * as fs from "fs";
import * as path from "path";
import { globSync, hasMagic } from "glob";
import { Uri } from "vscode";
import * as vscode from "vscode";
import { Utils } from "./Utils";
/**
 * This method scans the list of folders as given input and find the required entity name within the folder.
 * If found returns its URI representation
 * @param copybookName name of the entity asked by the server
 * @param copybookFolders list of folders from where to search the copybook
 * @param extensions list of possible copybooks extensions
 */
export function searchCopybookInExtensionFolder(
  copybookName: string,
  copybookFolders: string[] | undefined,
  extensions: string[] | undefined,
  storagePath: string,
): string | undefined {
  if (!copybookFolders || !extensions) return undefined;
  const extensionFolder = cleanWorkspaceFolderName(storagePath);
  for (const p of copybookFolders) {
    for (const ext of extensions) {
      const searchResult = globSearch(extensionFolder, p, copybookName, ext);
      if (searchResult) {
        return vscode.Uri.file(searchResult).toString();
      }
    }
  }
  return undefined;
}

export const backwardSlashRegex = new RegExp("\\\\", "g");

export function cleanWorkspaceFolderName(workspaceFolderPath: string) {
  return workspaceFolderPath.replace(/\/(.*:)/, "$1");
}

export function normalizePath(folder: string): string {
  return vscode.Uri.file(folder).fsPath;
}

function globSearch(
  workspaceFolder: string,
  resource: string,
  copybookName: string,
  ext: string,
): string | undefined {
  const pathName: string = path.isAbsolute(resource)
    ? resource
    : path.normalize(path.join(workspaceFolder, resource));
  const segments = pathName.split(path.sep);
  const cwdSegments: string[] = [];
  for (const s of segments) {
    if (!hasMagic(s)) {
      cwdSegments.push(s);
    } else {
      break;
    }
  }
  // One must use forward-slashes only in glob expressions
  const cwd = path
    .resolve("/", ...cwdSegments)
    .replace(backwardSlashRegex, "/");
  const normalizePathName = pathName.replace(backwardSlashRegex, "/");
  let pattern =
    normalizePathName === cwd && !Utils.isUNCPath(normalizePathName)
      ? ""
      : normalizePathName.replace(cwd.endsWith("/") ? cwd : cwd + "/", "");
  const suffix =
    (pattern.length === 0 || pattern.endsWith("/") ? "" : "/") +
    copybookName +
    ext;
  pattern = pattern + suffix;
  const result = globSync(pattern, { cwd, dot: true });
  // TODO report the case with more then one copybook fit the pattern.
  return result[0]
    ? normalizePath(fs.realpathSync.native(path.resolve(cwd, result[0])))
    : undefined;
}

export function getProgramNameFromUri(
  uri: string,
  includeExt: boolean = false,
): string {
  const fullPath = Uri.parse(uri, true).fsPath;
  if (includeExt) {
    return path.basename(fullPath);
  }
  return path.basename(fullPath, path.extname(fullPath));
}
