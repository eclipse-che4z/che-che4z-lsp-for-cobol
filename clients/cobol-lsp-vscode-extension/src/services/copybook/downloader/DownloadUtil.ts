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
  PROVIDE_PROFILE_MSG,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../../constants";
import { hasMember } from "../../util/Utils";
import { registerExceptionEvent } from "../../reporter";
import { Memoize } from "../../util/Memoize";

const getProfileStatusCached = new Memoize(
  testZoweAccess,
  undefined,
  (profileName: string) => profileName,
);

export const getProfileStatus = getProfileStatusCached.execute;

async function testZoweAccess(
  profileName: string,
  remoteLocation: MainframeRemoteLocation,
  retry: boolean,
) {
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
    return "valid-profile";
  } catch (err) {
    if (isNotFoundError(err)) return "valid-profile";
    if (isPermissionError(err)) return "valid-profile";
    if (isProfileNotConfiguredError(err)) {
      const message = PROVIDE_PROFILE_MSG.replace(
        PROFILE_NAME_PLACEHOLDER,
        profileName,
      );
      void showQueueLockedDialog(profileName, message);
      return "locked-profile";
    }
    if (isInvalidCredentials(err)) {
      if (retry)
        return await testZoweAccess(profileName, remoteLocation, false);
      else {
        const message = DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(
          PROFILE_NAME_PLACEHOLDER,
          profileName,
        );
        void showQueueLockedDialog(profileName, message);
        return "locked-profile";
      }
    }

    // unknown type of error, register it and assume profile is ok
    registerExceptionEvent(
      "InvalidCredentialsException",
      JSON.stringify(err),
      ["copybook", "COBOL", "invalid-credentials-check"],
      "There is an issue with zowe api layer",
    );
    return "valid-profile";
  }
}

/**
 * Returns true if provided credentials are correct but
 * selected dataset or uss folder doesn't exist.
 */
function isNotFoundError(e: unknown) {
  return hasMember(e, "code") && e.code === "FileNotFound";
}

/**
 * Returns true if provided credentials are correct but user doesn't
 * have permission to access selected dataset (ISRZ002)
 * or uss directory (EDC5111I).
 */
function isPermissionError(e: unknown) {
  return (
    hasMember(e, "message") &&
    typeof e.message === "string" &&
    (e.message.includes("EDC5111I Permission denied") ||
      e.message.includes("ISRZ002 Authorization failed"))
  );
}

function isProfileNotConfiguredError(err: unknown) {
  return (
    hasMember(err, "message") &&
    typeof err.message === "string" &&
    err.message.includes(
      "Zowe Explorer Profiles Cache error: Could not find profile named",
    )
  );
}

/**
 * Checks if the error returned by Zowe Explorer is caused
 * by invalid credentials. Error with status code 401 is returned
 * in that case.
 */
function isInvalidCredentials(e: unknown) {
  return (
    hasMember(e, "message") &&
    typeof e.message === "string" &&
    e.message.includes(
      "Rest API failure with HTTP(S) status 401\nThis operation requires authentication.",
    )
  );
}

async function showQueueLockedDialog(profileName: string, message: string) {
  const action = await vscode.window.showErrorMessage(
    message,
    UNLOCK_DOWNLOAD_QUEUE_MSG,
  );

  if (action === UNLOCK_DOWNLOAD_QUEUE_MSG) {
    getProfileStatusCached.invalidateCache(profileName, null!, false);
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
