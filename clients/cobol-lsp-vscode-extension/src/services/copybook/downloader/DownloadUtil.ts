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
import {
  DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
  INVALID_CREDENTIALS_ERROR_MSG,
  PROFILE_NAME_PLACEHOLDER,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../../constants";
import { ZoweExplorerDownloader } from "./ZoweExplorerDownloader";
import { SettingsService } from "../../Settings";
import { hasMember } from "../../util/Utils";
import { registerExceptionEvent } from "../../reporter";

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
    } catch (_error) {
      return false;
    }
  }

  /**
   * returns true if the passed profile has invalid credentials, false otherwise
   * @param profileName
   * @param explorerAPI
   * @param remoteLocation DSN or USS that is used to test mainframe access
   * @returns true if the passed profile has invalid credentials, false otherwise
   */
  public static async checkForInvalidCredProfile(
    profileName: string,
    explorerAPI: IApiRegisterClient,
    remoteLocation: MainframeRemoteLocation,
  ): Promise<boolean> {
    if (
      ZoweExplorerDownloader.profileStore.get(profileName) === "valid-profile"
    ) {
      return false;
    }

    try {
      const profile = this.loadProfile(profileName, explorerAPI);
      if (remoteLocation.uss) {
        await explorerAPI.getUssApi(profile).fileList(remoteLocation.uss);
      } else if (remoteLocation.dsn) {
        await explorerAPI.getMvsApi(profile).allMembers(remoteLocation.dsn);
      }
    } catch (error) {
      if (this.checkForInvalidCredentials(error, profileName)) {
        return true;
      }
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

  private static checkForInvalidCredentials(
    e: unknown,
    profileName: string,
  ): boolean {
    if (this.isNotFoundError(e) || this.isPermissionError(e)) {
      // Cannot access the dataset, but credentials are working fine
      return false;
    }

    if (this.isInvalidCredentials(e)) {
      ZoweExplorerDownloader.profileStore.set(profileName, "locked-profile");
      const errorMessage = INVALID_CREDENTIALS_ERROR_MSG.replace(
        PROFILE_NAME_PLACEHOLDER,
        profileName,
      );
      vscode.window.showErrorMessage(errorMessage);
      return true;
    }

    registerExceptionEvent(
      "InvalidCredentialsException",
      JSON.stringify(e),
      ["copybook", "COBOL", "invalid-credentials-check"],
      "There is an issue with zowe api layer",
    );
    return true;
  }

  /**
   * checks if a zowe profile is locked due to invalid credentials
   * @param profileName
   * @returns True is zowe profile is locked, false otherwise
   */
  public static async isProfileLocked(profileName: string): Promise<boolean> {
    const profileStatus = ZoweExplorerDownloader.profileStore.get(profileName);
    if (profileStatus === "valid-profile" || !profileStatus) {
      return false;
    }

    const shouldUnlock = await this.showQueueLockedDialog(profileName);
    if (shouldUnlock) {
      ZoweExplorerDownloader.profileStore.delete(profileName);
    }

    return shouldUnlock;
  }

  /**
   * checks if copybook download configurations are present
   * @param documentUri
   * @param dialects
   * @returns first configured remote location if if copybook download
   * configurations are present, null otherwise
   */
  public static areCopybookDownloadConfigurationsPresent(
    documentUri: string,
    dialects: string[],
  ): MainframeRemoteLocation | null {
    const uniqueDialects = new Set(
      dialects.map((dialect) => dialect?.toUpperCase()).filter(Boolean),
    );

    for (const dialect of uniqueDialects) {
      const dsnPath = SettingsService.getDsnPath(documentUri, dialect);
      const ussPath = SettingsService.getUssPath(documentUri, dialect);
      if ((dsnPath?.length ?? 0) > 0) {
        return { dsn: dsnPath[0] };
      }
      if ((ussPath?.length ?? 0) > 0) {
        return { uss: ussPath[0] };
      }
    }

    return null;
  }

  private static async showQueueLockedDialog(
    profileName: string,
  ): Promise<boolean> {
    const action = await vscode.window.showErrorMessage(
      DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(
        PROFILE_NAME_PLACEHOLDER,
        profileName,
      ),
      UNLOCK_DOWNLOAD_QUEUE_MSG,
    );

    return action === UNLOCK_DOWNLOAD_QUEUE_MSG;
  }

  /**
   * Checks if the error returned by Zowe Explorer is caused
   * by invalid credentials. Error with status code 401 is returned
   * in that case.
   */
  private static isInvalidCredentials(e: unknown) {
    return (
      hasMember(e, "mDetails") &&
      hasMember(e.mDetails, "errorCode") &&
      e.mDetails.errorCode === 401
    );
  }

  /**
   * Returns true if provided credentials are correct but user doesn't
   * have permission to access selected dataset (ISRZ002)
   * or uss directory (EDC5111I).
   */
  private static isPermissionError(e: unknown) {
    return (
      hasMember(e, "mDetails") &&
      hasMember(e.mDetails, "errorCode") &&
      e.mDetails.errorCode === 500 &&
      hasMember(e, "message") &&
      typeof e.message === "string" &&
      (e.message.includes("EDC5111I Permission denied") ||
        e.message.includes("ISRZ002 Authorization failed"))
    );
  }

  /**
   * Returns true if provided credentials are correct but
   * selected dataset or uss folder doesn't exist.
   */
  private static isNotFoundError(e: unknown) {
    return (
      hasMember(e, "mDetails") &&
      hasMember(e.mDetails, "errorCode") &&
      e.mDetails.errorCode === 404
    );
  }
}

export type MainframeRemoteLocation =
  | {
      dsn: string;
      uss?: never;
    }
  | {
      uss: string;
      dsn?: never;
    };
