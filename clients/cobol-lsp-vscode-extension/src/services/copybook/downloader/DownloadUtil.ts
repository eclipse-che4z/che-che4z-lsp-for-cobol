/*
 * Copyright (c) 2024 Broadcom.
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
import { TelemetryService } from "../../reporter/TelemetryService";
import {
  INVALID_CREDENTIALS_ERROR_MSG,
  PROFILE_NAME_PLACEHOLDER,
} from "../../../constants";
import { ZoweExplorerDownloader } from "./ZoweExplorerDownloader";

/**
 * Utility class for downloading copybooks
 */
export class DownloadUtil {
  public static getRemoteCopybookName(members: string[], copybookName: string) {
    const copybookNameUpperCase = copybookName.toUpperCase();
    return members.find(
      (ele) =>
        DownloadUtil.getFilenameWithoutExtension(ele).toUpperCase() ===
        copybookNameUpperCase,
    );
  }

  /**
   * Retrieves a filename excluding extension for a passed file name
   * @param ele filename
   * @returns filename excluding extension
   */
  public static getFilenameWithoutExtension(ele: string) {
    return ele.substring(
      0,
      ele.lastIndexOf(".") !== -1 ? ele.lastIndexOf(".") : ele.length,
    );
  }

  /**
   * Checks if path exists
   * @param path path
   * @returns boolean
   */
  public static async checkPathExists(path: string): Promise<boolean> {
    try {
      await vscode.workspace.fs.stat(vscode.Uri.file(path));
      return true; // Path exists
    } catch (error) {
      return false;
    }
  }

  /**
   * returns true if the passed profile has invalid credentials, false otherwise
   * @param profileName
   * @param explorerAPI
   * @returns true if the passed profile has invalid credentials, false otherwise
   */
  public static async checkForInvalidCredProfile(
    profileName: string,
    explorerAPI: IApiRegisterClient,
  ): Promise<boolean> {
    if (
      ZoweExplorerDownloader.profileStore.get(profileName) === "valid-profile"
    ) {
      return false;
    }

    try {
      const profile = this.loadProfile(profileName, explorerAPI);
      await explorerAPI.getUssApi(profile).fileList("/");
    } catch (error) {
      this.checkForInvalidCredentials(error, profileName);
      return true;
    }

    ZoweExplorerDownloader.profileStore.set(profileName, "valid-profile");
    return false;
  }

  /**
   * returns IProfileLoaded from a passed profile name
   * @param profileName
   * @param explorerAPI
   * @returns IProfileLoaded
   */
  public static loadProfile(
    profileName: string,
    explorerAPI: IApiRegisterClient,
  ): IProfileLoaded {
    return explorerAPI
      .getExplorerExtenderApi()
      .getProfilesCache()
      .loadNamedProfile(profileName);
  }

  private static checkForInvalidCredentials(e: any, profileName: string) {
    if (this.isInvalidCredentials(e)) {
      ZoweExplorerDownloader.profileStore.set(profileName, "locked-profile");
      const errorMessage = INVALID_CREDENTIALS_ERROR_MSG.replace(
        PROFILE_NAME_PLACEHOLDER,
        profileName,
      );
      vscode.window.showErrorMessage(errorMessage);
    }

    TelemetryService.registerExceptionEvent(
      undefined,
      JSON.stringify(e),
      ["copybook", "COBOL", "experiment-tag"],
      "There is an issue with zowe api layer",
    );
  }

  private static isInvalidCredentials(e: any) {
    return e?.mDetails?.errorCode === 401;
  }
}
