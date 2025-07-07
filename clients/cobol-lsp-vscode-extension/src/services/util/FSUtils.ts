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

import * as vscode from "vscode";

export const backwardSlashRegex = new RegExp("\\\\", "g");

export function cleanWorkspaceFolderName(workspaceFolderPath: string) {
  return workspaceFolderPath.replace(/\/(.*:)/, "$1");
}

export function normalizePath(folder: string): string {
  return vscode.Uri.file(folder).fsPath;
}

function hasMagic(input: string) {
  const pattern = /[*?{}[\]()!]/;
  return pattern.test(input);
}

export function createFileSearchPattern(
  directoryPath: vscode.Uri,
  fileName: string,
): vscode.RelativePattern {
  const segments = directoryPath.path
    .split("/")
    .filter((segment) => segment !== "");
  const baseSegments: string[] = [];
  const patternSegments: string[] = [];

  let target = baseSegments;
  for (const segment of segments) {
    if (hasMagic(segment)) {
      target = patternSegments;
    }
    target.push(segment);
  }

  const baseUri = vscode.Uri.from({
    ...directoryPath,
    path: "/" + baseSegments.join("/"),
  });

  let pattern = fileName;
  if (patternSegments.length > 0) {
    pattern = `${patternSegments.join("/")}/${pattern}`;
  }

  return new vscode.RelativePattern(baseUri, pattern);
}

export function createCaseInsensitivePattern(name: string) {
  return name
    .split("")
    .map((letter) => {
      const lc = letter.toLowerCase();
      const uc = letter.toUpperCase();
      if (lc === uc) {
        return lc;
      }
      return `[${lc}${uc}]`;
    })
    .join("");
}

export type SupportedVariables = {
  filename: string;
  dirName: string;
  dirBasename: string;
  extension: string;
};

export function getVariablesFromUri(
  uri: string | vscode.Uri,
  includeExt: boolean = false,
): SupportedVariables {
  const u = uri instanceof vscode.Uri ? uri : vscode.Uri.parse(uri, true);
  const p = vscode.Uri.joinPath(u, "..");
  const file = u.path.substring(u.path.lastIndexOf("/") + 1);
  const dot = file.lastIndexOf(".");

  return {
    filename: includeExt || dot <= 0 ? file : file.substring(0, dot),
    dirName: p.path,
    dirBasename: p.path.substring(p.path.lastIndexOf("/") + 1),
    extension: dot > 0 ? file.substring(dot) : "",
  };
}

export function splitFilename(filename: string): [string, string] | [string] {
  const lastDotIndex = filename.lastIndexOf(".");
  if (lastDotIndex > 0) {
    const name = filename.slice(0, lastDotIndex);
    const extension = filename.slice(lastDotIndex);

    return [name, extension];
  } else {
    return [filename];
  }
}
