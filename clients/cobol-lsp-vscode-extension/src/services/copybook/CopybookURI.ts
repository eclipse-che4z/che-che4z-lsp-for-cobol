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
import * as path from "node:path";
import { COPYBOOKS_FOLDER, ZOWE_FOLDER } from "../../constants";
import { SettingsService } from "../Settings";
import { getProgramNameFromUri } from "../util/FSUtils";
import { ProfileUtils } from "../util/ProfileUtils";

/**
 * This class is responsible to identify from which source resolve copybooks required by the server.
 */
export class CopybookURI {
  public static createCopybookPath(
    profileName: string,
    dataset: string,
    copybook: string,
    downloadFolder: string,
  ): string {
    const copybookDirPath = path.join(
      downloadFolder,
      ZOWE_FOLDER,
      COPYBOOKS_FOLDER,
      profileName,
      dataset,
    );
    return path.join(copybookDirPath, copybook);
  }

  public static createDatasetPath(
    profileName: string,
    dataset: string,
    downloadFolder: string,
  ): string {
    return path.join(
      downloadFolder,
      ZOWE_FOLDER,
      COPYBOOKS_FOLDER,
      profileName,
      dataset,
    );
  }
  /**
   * This method produce an array with element that following the schema
   * "file://[EXTENSION_FOLDER]/.zowe/.copybooks/PROFILE/DATASET" or
   * "file://[EXTENSION_FOLDER]/.zowe/.copybooks/PROFILE/USS"
   * @param profile represent a name of a folder within the .copybooks folder that have the same name as the
   * connection name needed to download copybooks from mainframe.
   */
  public static async createPathForCopybookDownloaded(
    documentUri: string,
    dialectType: string,
    downloadFolder: string,
  ): Promise<string[]> {
    const filename = getProgramNameFromUri(documentUri, true);
    const profile = await ProfileUtils.getProfileNameForCopybook(filename);

    let result: string[] = [];
    const datasets: string[] = SettingsService.getDsnPath(
      documentUri,
      dialectType,
    );
    if (profile && datasets) {
      result = Object.assign([], datasets);
      result.forEach(
        (value, index) =>
          (result[index] = path.join(downloadFolder, profile, value)),
      );
    }

    const ussPaths: string[] = SettingsService.getUssPath(
      documentUri,
      dialectType,
    );
    const baseIndex = result.length;
    if (profile && ussPaths) {
      Object.assign([], ussPaths).forEach(
        (value, index) =>
          (result[index + baseIndex] = path.join(
            downloadFolder,
            profile,
            value,
          )),
      );
    }
    return result;
  }
}
