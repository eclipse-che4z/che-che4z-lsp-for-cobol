/*
 * Copyright (c) 2023 Broadcom.
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
import { SettingsService } from "../Settings";
import {
  DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
  PROFILE_NAME_PLACEHOLDER,
  PROVIDE_PROFILE_MSG,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../constants";
import { hasMember } from "../util/Utils";
import { registerExceptionEvent } from "../reporter";
import { Memoize } from "../util/Memoize";
import { outputChannel } from "./OutputChannel";

export function getProfileNameForCopybook(
  documentUri: vscode.Uri,
): string | undefined {
  return getValidProfileForCopybookDownload(documentUri);
}

function getValidProfileForCopybookDownload(
  documentUri: vscode.Uri,
): string | undefined {
  const profileFromDoc = getProfileFromDocument(documentUri);
  const passedProfile = SettingsService.getProfileName();
  if (!passedProfile && profileFromDoc) {
    return profileFromDoc;
  }
  return passedProfile;
}

function getProfileFromDocument(documentUri: vscode.Uri): string | undefined {
  if (documentUri.scheme === "zowe-ds" || documentUri.scheme === "zowe-uss") {
    const profile = documentUri.path.split("/")[1];
    if (!profile) return undefined;
    return profile;
  }
}

const getProfileStatusCached = new Memoize(
  (profileName: string, check: () => Promise<void>) =>
    testZoweAccess(profileName, check, true),
  undefined,
  (profileName: string) => profileName,
);

export const getProfileStatus = getProfileStatusCached.execute;
export const clearProfiles = getProfileStatusCached.clearCache;

async function testZoweAccess(
  profileName: string,
  check: () => Promise<void>,
  retry: boolean,
) {
  try {
    await check();
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
      if (retry) return await testZoweAccess(profileName, check, false);
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
    outputChannel.error(
      `Unknown error while validating ZOWE profile ${profileName}: ${JSON.stringify(err)}`,
    );
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

// This is broken with ZE version 3.2.2 but works fine with 3.2.1
// https://github.com/zowe/zowe-explorer-vscode/issues/3760
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
    getProfileStatusCached.invalidateCache(profileName, null!);
  }
}
