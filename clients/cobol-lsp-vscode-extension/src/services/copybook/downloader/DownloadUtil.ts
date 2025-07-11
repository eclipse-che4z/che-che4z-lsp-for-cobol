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
  PROFILE_NAME_PLACEHOLDER,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../../constants";
import { ZoweExplorerDownloader } from "./ZoweExplorerDownloader";
import { SettingsService } from "../../Settings";
import { hasMember } from "../../util/Utils";
import { registerExceptionEvent } from "../../reporter";
import { EndevorType } from "../../../type/e4eApi";
import { EndevorConfigModel } from "../../ProcessorGroupsLoader";

/**
 * Utility class for downloading copybooks
 */
export class DownloadUtil {
  /**
   * returns true if the passed profile has invalid credentials, false otherwise
   * @param profileName
   * @param remoteLocation DSN or USS that is used to test mainframe access
   * @returns true if the passed profile has invalid credentials, false otherwise
   */
  public static async checkForInvalidCredProfile(
    profileName: string,
    remoteLocation: MainframeRemoteLocation,
    retry = true,
  ): Promise<boolean> {
    if (
      ZoweExplorerDownloader.profileStore.get(profileName) === "valid-profile"
    ) {
      return false;
    }

    try {
      if (remoteLocation.uss) {
        await vscode.workspace.fs.stat(
          vscode.Uri.parse(
            `zowe-uss:/${profileName}/${remoteLocation.uss}?fetch=true`,
          ),
        );
      } else if (remoteLocation.dsn) {
        await vscode.workspace.fs.stat(
          vscode.Uri.parse(
            `zowe-ds:/${profileName}/${remoteLocation.dsn}?fetch=true`,
          ),
        );
      }
    } catch (error) {
      // TODO: This retry mechanism should be removed once this ZE bug is fixed
      // https://github.com/zowe/zowe-explorer-vscode/issues/3662
      if (retry) {
        return await this.checkForInvalidCredProfile(
          profileName,
          remoteLocation,
          false,
        );
      }
      if (this.checkForInvalidCredentials(error, profileName)) {
        return true;
      }
    }

    ZoweExplorerDownloader.profileStore.set(profileName, "valid-profile");
    return false;
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
      hasMember(e, "message") &&
      typeof e.message === "string" &&
      e.message.includes(
        "Rest API failure with HTTP(S) status 401\nThis operation requires authentication.",
      )
    );
  }

  /**
   * Returns true if provided credentials are correct but user doesn't
   * have permission to access selected dataset (ISRZ002)
   * or uss directory (EDC5111I).
   */
  private static isPermissionError(e: unknown) {
    return (
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
    return hasMember(e, "code") && e.code === "FileNotFound";
  }
  public static endevorConfigToType(config: EndevorConfigModel): EndevorType {
    return {
      use_map: config.use_map === false ? false : true,
      environment: config.environment,
      stage: config.stage,
      system: config.system,
      subsystem: config.subsystem,
      type: config.type,
    };
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
