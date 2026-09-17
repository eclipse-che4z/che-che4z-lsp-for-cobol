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
 *   Broadcom - initial API and implementation
 */

import * as vscode from "vscode";
import { ResolvedProfile } from "../../type/e4eApi";
import { TAR_PREFIX } from "../../constants";
import { SEPARATOR } from "../../provider/TarCopybookFileSystemProvider";

async function safeActivate(ext: vscode.Extension<unknown>) {
  try {
    return await ext.activate();
  } catch (_) {
    // ignored
  }
}

async function extractApi<T>(
  ext: vscode.Extension<unknown>,
  validate: (api: unknown) => api is T,
): Promise<T | undefined> {
  const api = ext.isActive ? ext.exports : await safeActivate(ext);
  if (!validate(api)) return undefined;
  return api;
}

function asAPI<T>(api: T | undefined) {
  if (api) return { api };
  return undefined;
}

export async function getExtensionApi<T>(
  extName: string,
  validate: (api: unknown) => api is T,
): Promise<
  undefined | { api: T } | { futureApi: Promise<undefined | { api: T }> }
> {
  const ext = vscode.extensions.getExtension(extName);
  if (ext) {
    return asAPI<T>(await extractApi(ext, validate));
  }
  return {
    futureApi: new Promise((res, _) => {
      const extAdded = vscode.extensions.onDidChange(() => {
        const ext = vscode.extensions.getExtension(extName);
        if (!ext) return;
        extAdded.dispose();
        void extractApi<T>(ext, validate).then((api) => res(asAPI<T>(api)));
      });
    }),
  };
}

/**
 * This class collects utility methods for general purpose activities
 */
export class Utils {
  /**
   * This method provides a quick way to verify if the input is null or undefined.
   * The idea is to have something similar to the util library {@link node.isNullOrUndefined} that is deprecated.
   * @param content the string value target of the validation
   * @return true if the content is not null or undefined, false otherwise
   */
  public static isNullOrUndefined(content: string): boolean {
    return content === null || content === undefined;
  }
  /**
   * Based on below refrences
   *  Ref : https://stackoverflow.com/questions/6344936/validation-of-unc-path-using-javascript
   *  Ref : https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-dtyp/62e862f4-2a51-452e-8eeb-dc4ff5ee33cc?redirectedfrom=MSDN
   */
  private static UNC_PATH_REGEX =
    // eslint-disable-next-line no-control-regex, no-useless-escape
    /^\\\\([^\\:\|\[\]\/";<>+=,?* _]+)\\([\u0020-\u0021\u0023-\u0029\u002D-\u002E\u0030-\u0039\u0040-\u005A\u005E-\u007B\u007E-\u00FF]{1,80})(((?:\\[\u0020-\u0021\u0023-\u0029\u002D-\u002E\u0030-\u0039\u0040-\u005A\u005E-\u007B\u007E-\u00FF]{1,255})+?|)(?:\\((?:[\u0020-\u0021\u0023-\u0029\u002B-\u002E\u0030-\u0039\u003B\u003D\u0040-\u005B\u005D-\u007B]{1,255}){1}(?:\:(?=[\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]|\:)(?:([\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]+(?!\:)|[\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]*)(?:\:([\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]+)|))|)))|)$/;

  public static async getZoweExplorerAPI() {
    return getExtensionApi<IApiRegisterClient>(
      "Zowe.vscode-extension-for-zowe",
      (api: unknown): api is IApiRegisterClient => !!api,
    );
  }

  /**
   * Checks is a path is a UNC path
   * @param path to be checked
   * @returns true if passed path is UNC path, false otherwise
   */
  public static isUNCPath(path: string) {
    return this.UNC_PATH_REGEX.test(path);
  }

  public static profileAsString(profile: ResolvedProfile) {
    return `${profile.instance}.${profile.profile}`;
  }
}

export function hasMember<
  M extends PropertyKey,
  T extends object = { [K in M]: unknown },
>(e: unknown, m: M): e is T {
  return typeof e === "object" && e !== null && m in e;
}

export function asPartialProfile(s: string): Partial<ResolvedProfile> {
  const idx = s.indexOf("@");
  if (idx === -1)
    return { instance: whitespaceAsUndefined(s), profile: undefined };
  else
    return {
      instance: whitespaceAsUndefined(s.substring(0, idx)),
      profile: whitespaceAsUndefined(s.substring(idx + 1)),
    };
}

function whitespaceAsUndefined(s: string) {
  for (const c of s) if (c !== " ") return s;
  return undefined;
}

export function asArray<T>(input: T | T[]): T[] {
  if (Array.isArray(input)) {
    return input;
  }
  return [input];
}

/**
 * Checks if a passed path is a tar file location i.e. it starts with 'tar:' case insensitively
 * @param input The string to process, e.g., 'tar:FILE_PATH::INTERNAL_PATH'
 * @returns a boolean indicating if the specified path is a tar file location
 */
export function isTarPath(input: string) {
  return input.toUpperCase().startsWith(TAR_PREFIX);
}

// Requires at least 2 characters before ":" so a Windows drive letter
// ("C:\foo" or "C:/foo", always exactly one letter) is never mistaken for a
// URI scheme. No "//" is required after ":" since schemes with no
// authority (e.g. "zowe-uss:/profile/path") are valid and expected here.
const schemeQualifiedPathRegex = /^[a-zA-Z][a-zA-Z0-9+.-]+:\//;

/**
 * Checks if a passed local copybook path is a scheme-qualified URI (e.g.
 * "zowe-uss:/profile/path") rather than a plain local filesystem path.
 * @param input The string to process
 * @returns a boolean indicating if the specified path is scheme-qualified
 */
export function isSchemeQualifiedPath(input: string) {
  return schemeQualifiedPathRegex.test(input);
}

/**
 * Extracts the text between 'tar:' and '::' and the text after '::'
 * from a structured string.
 * @param input The string to process, e.g., 'tar:FILE_PATH::INTERNAL_PATH'
 * @returns An object containing the extracted file path and internal path.
 */
export function extractTarPath(input: string): {
  tarPath: string;
  internalPath: string;
} {
  // 1. Find the start index for the file path (after 'tar:')
  const tarPrefixIndex = input.toUpperCase().indexOf(TAR_PREFIX);
  if (tarPrefixIndex != 0) {
    throw new Error("String must start with 'tar:'.");
  }
  const filePathStartIndex = tarPrefixIndex + TAR_PREFIX.length;

  // 2. Find the index of the separator '::'
  const separatorIndex = input.indexOf(SEPARATOR, filePathStartIndex);
  let tarPath;
  let internalPath;

  if (separatorIndex === -1) {
    tarPath = input.substring(filePathStartIndex, input.length);
    internalPath = "**";
  } else {
    tarPath = input.substring(filePathStartIndex, separatorIndex);
    internalPath = input.substring(separatorIndex + SEPARATOR.length);
  }
  return { tarPath, internalPath };
}

/**
 * returns IProfileLoaded from a passed profile name
 * @param profileName
 * @param explorerAPI
 * @returns IProfileLoaded
 */
export function loadProfile(
  profileName: string,
  explorerAPI: IApiRegisterClient,
): IProfileLoaded {
  return explorerAPI
    .getExplorerExtenderApi()
    .getProfilesCache()
    .loadNamedProfile(profileName);
}
