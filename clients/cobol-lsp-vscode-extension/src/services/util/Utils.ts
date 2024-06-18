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
import { E4E, ResolvedProfile } from "../../type/e4eApi";

/**
 * This class collects utility methods for general purpose activities
 */
const nameof = <T>(name: keyof T) => name;
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
    /^\\\\([^\\:\|\[\]\/";<>+=,?* _]+)\\([\u0020-\u0021\u0023-\u0029\u002D-\u002E\u0030-\u0039\u0040-\u005A\u005E-\u007B\u007E-\u00FF]{1,80})(((?:\\[\u0020-\u0021\u0023-\u0029\u002D-\u002E\u0030-\u0039\u0040-\u005A\u005E-\u007B\u007E-\u00FF]{1,255})+?|)(?:\\((?:[\u0020-\u0021\u0023-\u0029\u002B-\u002E\u0030-\u0039\u003B\u003D\u0040-\u005B\u005D-\u007B]{1,255}){1}(?:\:(?=[\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]|\:)(?:([\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]+(?!\:)|[\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]*)(?:\:([\u0001-\u002E\u0030-\u0039\u003B-\u005B\u005D-\u00FF]+)|))|)))|)$/;

  public static async getZoweExplorerAPI(): Promise<
    IApiRegisterClient | undefined
  > {
    const extension = vscode.extensions.getExtension(
      "Zowe.vscode-extension-for-zowe",
    );
    if (!extension) {
      return undefined;
    }

    try {
      await extension.activate();
      return extension.exports as IApiRegisterClient;
    } catch {
      return undefined;
    }
  }

  /**
   * Checks is a path is a UNC path
   * @param path to be checked
   * @returns true if passed path is UNC path, false otherwise
   */
  public static isUNCPath(path: string) {
    return this.UNC_PATH_REGEX.test(path);
  }
  public static validateE4E(e4e: any): e4e is E4E {
    const valid =
      e4e instanceof Object &&
      nameof<E4E>("listElements") in e4e &&
      nameof<E4E>("getElement") in e4e &&
      nameof<E4E>("listMembers") in e4e &&
      nameof<E4E>("getMember") in e4e &&
      nameof<E4E>("isEndevorElement") in e4e &&
      nameof<E4E>("getProfileInfo") in e4e &&
      nameof<E4E>("getConfiguration") in e4e &&
      nameof<E4E>("onDidChangeElement") in e4e;
    if (!valid) throw Error("incompatible interface");
    return valid;
  }

  public static profileAsString(profile: ResolvedProfile) {
    return `${profile.instance}.${profile.profile}`;
  }
}
