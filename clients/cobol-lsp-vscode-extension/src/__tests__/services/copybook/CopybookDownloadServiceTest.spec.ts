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

import anything = jasmine.anything;
import * as fs from "fs-extra";
import * as path from "path";
import * as Path from "path";
import * as vscode from "vscode";
import {
  C4Z_FOLDER,
  COPYBOOKS_FOLDER,
  DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
  INSTALL_ZOWE,
  PROFILE_NAME_PLACEHOLDER,
  PROVIDE_PROFILE_MSG,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
  ZOWE_EXT_MISSING_MSG,
} from "../../../constants";
import {
  CopybookDownloadService,
  CopybookName,
} from "../../../services/copybook/CopybookDownloadService";
import { CopybookProfile } from "../../../services/copybook/DownloadQueue";
import { TelemetryService } from "../../../services/reporter/TelemetryService";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import clearAllMocks = jest.clearAllMocks;
import { SettingsService } from "../../../services/Settings";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { Utils } from "../../../services/util/Utils";

const profile = "zoweProfile";
const wrongCredProfile = "wrongCredProfile";
const copybookProfile = new CopybookProfile(
  "filename",
  "copybook",
  SettingsService.DEFAULT_DIALECT,
  profile,
  false,
);
const downloadQueueLockedErrorMsg = DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(
  PROFILE_NAME_PLACEHOLDER,
  wrongCredProfile,
);

(vscode.workspace.workspaceFolders as any) = [
  { uri: { fsPath: "/projects" } } as any,
];
vscode.window.showInformationMessage = () =>
  Promise.resolve("Download Copybooks");
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
  get: jest.fn().mockReturnValue(undefined),
});
(vscode.ProgressLocation as any) = { Notification: "notify" };

Utils.getZoweExplorerAPI = jest.fn();
const getContentMock = jest.fn();
const getUSSContentsMock = jest.fn();
const getZoweExplorerMock = (
  forError: boolean = false,
  mentionedError?: any,
) => {
  const error = new Error("Error");
  (error as any).mDetails = {
    errorCode: 401,
  };
  const allMemberMock = forError
    ? jest.fn().mockRejectedValue(mentionedError ? mentionedError : error)
    : jest.fn().mockReturnValue({
        apiResponse: {
          items: [
            {
              member: "copybook",
            },
            { member: "DATASET2" },
          ],
        },
      });
  const allUSSFilemembers = forError
    ? jest.fn().mockRejectedValue(mentionedError ? mentionedError : error)
    : jest.fn().mockReturnValue({
        apiResponse: {
          items: [
            { name: "uss_copybook" },
            { name: "uss_withExt.cpy" },
            { name: "USS_DATASET2" },
          ],
        },
      });
  return jest.fn().mockReturnValue({
    getExplorerExtenderApi: jest.fn().mockReturnValue({
      getProfilesCache: jest.fn().mockReturnValue({
        loadNamedProfile: jest.fn().mockReturnValue({
          profile: { encoding: undefined, name: "profile" },
        }),
      }),
    }),
    getMvsApi: jest.fn().mockReturnValue({
      allMembers: allMemberMock,
      getContents: getContentMock,
    }),
    getUssApi: jest.fn().mockReturnValue({
      fileList: allUSSFilemembers,
      getContents: getUSSContentsMock,
    }),
  });
};
beforeEach(() => {
  jest.clearAllMocks();
});

jest.mock("../../../services/reporter/TelemetryService");

describe("Test fetchCopybook against bad and correct configurations", () => {
  it("downloadCopybookFromMFUsingZowe is correctly invokes USS API's", async () => {
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    SettingsService.getCopybookFileEncoding = jest.fn().mockReturnValue("1147");
    await (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe(
      "HLQ.DSN1",
      copybookProfile,
      true,
    );
    expect(getUSSContentsMock).toBeCalledWith(`HLQ.DSN1/copybook`, {
      binary: true,
      file: Path.join(
        CopybookURI.createDatasetPath(profile, "HLQ.DSN1"),
        "copybook",
      ),
      returnEtag: true,
    });
  });

  it("downloadCopybookFromMFUsingZowe is correctly invoked", async () => {
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    await (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe(
      "HLQ.DSN1",
      copybookProfile,
    );
    expect(getContentMock).toBeCalledWith(`HLQ.DSN1(copybook)`, {
      binary: true,
      file: Path.join(
        CopybookURI.createDatasetPath(profile, "HLQ.DSN1"),
        "copybook",
      ),
      returnEtag: true,
    });
  });

  it("Given a copybook name that is a valid member on MF, the fetchCopybook correctly invoke download from MF", async () => {
    (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe =
      jest.fn();
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    const result = await (CopybookDownloadService as any).fetchCopybook(
      "HLQ.DSN1",
      copybookProfile,
    );
    expect(result).toBe(true);
  });

  it("Given a copybook name that is a valid USS member on MF, the fetchCopybook correctly invoke download from MF", async () => {
    const ussCopybookProfile = new CopybookProfile(
      "filename",
      "uss_copybook",
      SettingsService.DEFAULT_DIALECT,
      profile,
      false,
    );
    (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe =
      jest.fn();
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    const result = await (CopybookDownloadService as any).fetchCopybook(
      "HLQ.DSN1",
      ussCopybookProfile,
      true,
    );
    expect(result).toBe(true);
  });

  it("Given a copybook name with extension that is a valid USS member on MF, the fetchCopybook correctly invoke download from MF", async () => {
    const ussCopybookProfile = new CopybookProfile(
      "filename",
      "uss_withExt",
      SettingsService.DEFAULT_DIALECT,
      profile,
      false,
    );
    (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe =
      jest.fn();
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    const result = await (CopybookDownloadService as any).fetchCopybook(
      "HLQ.DSN1",
      ussCopybookProfile,
      true,
    );
    expect(result).toBe(true);
  });

  it("checks if handleCopybook can't find copybook, it shows a popup to update settings", async () => {
    const err = new Error("Error");
    Utils.getZoweExplorerAPI = getZoweExplorerMock(true, err);
    vscode.window.showErrorMessage = jest.fn();
    const spyOnErrorMessage = jest.spyOn(vscode.window, "showErrorMessage");
    spyOnErrorMessage.mockResolvedValue("Change settings" as any);
    const result = await (CopybookDownloadService as any).fetchCopybook(
      "TEST",
      copybookProfile,
    );
    expect(result).toBeFalsy();
    expect(spyOnErrorMessage).toBeCalledWith(err.message);
    expect(vscode.window.showErrorMessage).toBeCalledWith(err.message);
  });
});
describe("Receiving an error from zowe api layer, copybooks are not retrivied and user is correctly notified", () => {
  describe("Suite of tests related to handleCopybook", () => {
    it("handleCopybook delete copybook from its internal queue if the copybook is a valid member on MF", async () => {
      (CopybookDownloadService as any).fetchCopybook = jest
        .fn()
        .mockReturnValue(true);

      const errorQueue: Set<string> = new Set();
      errorQueue.add("copybook");
      const progress = { report: jest.fn(), increment: jest.fn() };
      await (CopybookDownloadService as any).handleCopybook(
        progress,
        "DSNAME1",
        copybookProfile,
        errorQueue,
      );
      expect(errorQueue.size).toBe(0);
    });
  });

  describe("Suite of tests related to handleCopybooks", () => {
    const progress = { report: jest.fn(), increment: jest.fn() };
    vscode.window.showErrorMessage = jest.fn();

    it("handleCopybooks shows progress report", async () => {
      (CopybookDownloadService as any).needsUserNotification = jest
        .fn()
        .mockReturnValue(true);
      const handleCopybook = ((CopybookDownloadService as any).handleCopybook =
        jest.fn());
      SettingsService.getDsnPath = jest.fn().mockReturnValue(["dataset"]);
      await (CopybookDownloadService as any).handleCopybooks(
        [copybookProfile],
        new Set(),
        progress,
      );
      expect(progress.report).toBeCalledWith({
        message: "Looking in dataset. 1 copybook(s) left.",
      });

      expect(handleCopybook).toBeCalledWith(
        progress,
        "dataset",
        copybookProfile,
        new Set(),
        false,
      );
    });

    it("handleCopybooks throws error incase download fails", async () => {
      (CopybookDownloadService as any).needsUserNotification = jest
        .fn()
        .mockReturnValue(true);
      (CopybookDownloadService as any).handleCopybook = jest
        .fn()
        .mockRejectedValue(new Error("error"));
      await (CopybookDownloadService as any).handleCopybooks(
        [copybookProfile],
        new Set(),
        progress,
      );
      expect(vscode.window.showErrorMessage).toBeCalledWith("Error: error");
    });
  });

  describe("Suite of tests related to handleQueue", () => {
    const cbd = new CopybookDownloadService();

    beforeEach(() => {
      clearAllMocks();
      SettingsService.getDsnPath = jest.fn().mockReturnValue(["dataset"]);
      SettingsService.getUssPath = jest
        .fn()
        .mockReturnValue(["/test/uss/path"]);
      vscode.window.showErrorMessage = jest.fn();
    });
    it("handleQueue popup ZoweError", async () => {
      const error = new Error("Error");
      (CopybookDownloadService as any).handleCopybooks = jest
        .fn()
        .mockRejectedValue(error);
      await (cbd as any).handleQueue(copybookProfile, new Set(), null);
      expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
        "Error: Error",
      );
    });

    it("handleQueue triggers call for USS copybook download", async () => {
      (CopybookDownloadService as any).handleCopybooks = jest
        .fn()
        .mockReturnValue({});
      const errSet = new Set();
      errSet.add("copybook");
      await (cbd as any).handleQueue(copybookProfile, new Set(), null);
      expect(
        (CopybookDownloadService as any).handleCopybooks,
      ).toHaveBeenLastCalledWith([copybookProfile], errSet, null, true);
    });
  });
});

describe("Test the creation of folders that contains copybooks downloaded from MF against correct configuration in settings provided by the user", () => {
  function setupScenario() {
    const testFolder = path.join(
      __dirname,
      C4Z_FOLDER,
      COPYBOOKS_FOLDER,
      "profile",
      "dataset",
    );
    const copybookURIPath = path.join(testFolder, "copybook" + ".cpy");
    const copybooksDownloadService: CopybookDownloadService =
      new CopybookDownloadService();

    (CopybookURI.createCopybookPath as any) = jest
      .fn()
      .mockReturnValue(copybookURIPath);
    (CopybookURI.createDatasetPath as any) = jest
      .fn()
      .mockReturnValue(testFolder);
    return { copybookURIPath, copybooksDownloadService };
  }

  function cleanupScenario() {
    fs.remove(path.join(__dirname, C4Z_FOLDER));
  }

  test("With a valid configuration of dataset, zoweExplorerAPI is invoked with correct params", async () => {
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    setupScenario();
    await (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe(
      "dataset",
      "copybook",
      "profile",
    );
    cleanupScenario();
  });
});

describe("Test downloadCopybook user interaction", () => {
  const copybooksDownloadService = new CopybookDownloadService();
  SettingsService.getDsnPath = jest.fn().mockReturnValue(["dataset"]);
  const queuePush = jest.fn();

  beforeEach(() => {
    (CopybookDownloadService as any).checkWorkspace = jest
      .fn()
      .mockReturnValue(true);
    (copybooksDownloadService as any).queue.push = queuePush;
    (copybooksDownloadService as any).lockedProfile = new Set([
      wrongCredProfile,
    ]);
    vscode.window.showErrorMessage = jest.fn().mockResolvedValue(undefined);
    (CopybookDownloadService as any).isEligibleForCopybookDownload = jest
      .fn()
      .mockReturnValue(true);
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
  });

  it("test zowe install is required for copybook download", async () => {
    Utils.getZoweExplorerAPI = jest.fn().mockResolvedValue(undefined);
    (CopybookDownloadService as any).checkWorkspace = jest
      .fn()
      .mockReturnValue(false);
    (CopybookDownloadService as any).isEligibleForCopybookDownload = jest
      .fn()
      .mockReturnValue(true);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      ZOWE_EXT_MISSING_MSG,
      INSTALL_ZOWE,
    );
    expect(queuePush).not.toBeCalled();
  });

  test("check download fails when ZE is not installed", async () => {
    (CopybookDownloadService as any).checkWorkspace = jest
      .fn()
      .mockReturnValue(false);
    Utils.getZoweExplorerAPI = jest.fn().mockReturnValue(undefined);
    (CopybookDownloadService as any).isEligibleForCopybookDownload = jest
      .fn()
      .mockReturnValue(true);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      "Zowe Explorer version 1.15.0 or higher is required to download copybooks from the mainframe.",
      "Install Zowe Explorer",
    );
    expect(queuePush).not.toBeCalled();
  });

  test("check workspace fail", async () => {
    (CopybookDownloadService as any).checkWorkspace = jest
      .fn()
      .mockReturnValue(false);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).not.toBeCalled();
    expect(queuePush).not.toBeCalled();
  });

  test("check profile not found", async () => {
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue([]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue(undefined);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe.",
      "Change settings",
    );
    expect(queuePush).not.toBeCalled();
  });

  test("check profile not found with user interaction", async () => {
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue([]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue(undefined);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      PROVIDE_PROFILE_MSG,
      anything(),
    );
    expect(queuePush).not.toBeCalled();
  });

  test("check good path", async () => {
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue(["profile"]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue("profile");
    await copybooksDownloadService.downloadCopybooks("fileName", [
      new CopybookName("copybook", "dialect"),
    ]);
    expect(vscode.window.showErrorMessage).not.toBeCalled();
    expect(queuePush).toBeCalledWith(
      "fileName",
      "copybook",
      "dialect",
      "profile",
      true,
    );
  });

  test("check locked profile", async () => {
    ProfileUtils.getAvailableProfiles = jest
      .fn()
      .mockReturnValue([wrongCredProfile]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue(wrongCredProfile);
    await copybooksDownloadService.downloadCopybooks("fileName", [
      new CopybookName("copybook", "dialect"),
    ]);
    expect(vscode.window.showErrorMessage).not.toBeCalled();
    expect(queuePush).not.toBeCalled();
  });

  test("check locked profile and user kept it locked", async () => {
    ProfileUtils.getAvailableProfiles = jest
      .fn()
      .mockReturnValue([wrongCredProfile]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue(wrongCredProfile);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      downloadQueueLockedErrorMsg,
      anything(),
    );
    expect(queuePush).not.toBeCalled();
    expect((copybooksDownloadService as any).lockedProfile).toContain(
      wrongCredProfile,
    );
  });

  test("queue locked and user unlocked it", async () => {
    ProfileUtils.getAvailableProfiles = jest
      .fn()
      .mockReturnValue([wrongCredProfile]);
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue(wrongCredProfile);
    vscode.window.showErrorMessage = jest
      .fn()
      .mockResolvedValue(UNLOCK_DOWNLOAD_QUEUE_MSG);
    await copybooksDownloadService.downloadCopybooks(
      "fileName",
      [new CopybookName("copybook", "dialect")],
      false,
    );
    expect(vscode.window.showErrorMessage).toBeCalledWith(
      downloadQueueLockedErrorMsg,
      anything(),
    );
    expect(queuePush).toBeCalledWith(
      "fileName",
      "copybook",
      "dialect",
      wrongCredProfile,
      false,
    );
    expect((copybooksDownloadService as any).lockedProfile).not.toContain(
      wrongCredProfile,
    );
  });
});

describe("Test copybook download process", () => {
  it("checks copybook download Service is called within the scope of vscode progress bar", async () => {
    const cbd = new CopybookDownloadService();
    vscode.window.withProgress = jest.fn();
    (vscode.ProgressLocation as any) = { Notification: "notify" };
    await (cbd as any).run(copybookProfile, new Set(), 1234);
    expect(vscode.window.withProgress).toBeCalled();
  });

  it("checks copybook download Service calls the handle queue to resolve copybook", async () => {
    const cbd = new CopybookDownloadService();
    const createErrorMessageForCopybooks = ((
      CopybookDownloadService as any
    ).createErrorMessageForCopybooks = jest.fn());
    const handleQueue = ((cbd as any).handleQueue = jest.fn());
    const telementryRegisterEvent = ((TelemetryService as any).registerEvent =
      jest.fn());
    const telemetryMessage = (TelemetryService.calculateTimeElapsed = jest
      .fn()
      .mockReturnValue("1234"));
    (cbd as any).queue.push = jest.fn();
    const progress = { report: jest.fn() };
    const errors = new Set();
    errors.add("test");
    await (cbd as any).process(progress, copybookProfile, errors, 1234);
    expect(handleQueue).toBeCalledWith(copybookProfile, errors, progress);
    expect(telemetryMessage).toBeCalled();
    expect(telementryRegisterEvent).toBeCalledWith(
      "Download copybooks from MF",
      ["copybook", "COBOL", "experiment-tag"],
      "total time to search copybooks on MF",
      new Map().set("time elapsed", "1234"),
    );
  });
});
