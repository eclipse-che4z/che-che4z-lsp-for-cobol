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

import { DEFAULT_DIALECT, PROVIDE_PROFILE_MSG } from "../../../constants";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { Utils } from "../../../services/util/Utils";
import * as vscode from "vscode";
import {
  zoweExplorerErrorMock,
  zoweExplorerMock,
} from "../../../__mocks__/getZoweExplorerMock.utility";
import { DownloadUtil } from "../../../services/copybook/downloader/DownloadUtil";

jest.mock("../../../services/reporter/TelemetryService");
(vscode.workspace.workspaceFolders as any) = [
  { uri: { fsPath: "/projects" } } as any,
];
Utils.getZoweExplorerAPI = jest.fn().mockReturnValue(zoweExplorerMock);

describe("Tests copybook download service", () => {
  DownloadUtil.areCopybookDownloadConfigurationsPresent = jest
    .fn()
    .mockReturnValue(true);
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("checks the prerequisites are checked before invoking download", () => {
    beforeEach(() => {
      jest.clearAllMocks();
    });

    it("checks download fails when provided profile is not a valid profile", async () => {
      const downloadService = new CopybookDownloadService(
        "storage-path",
        {} as any as IApiRegisterClient,
      );
      (ProfileUtils as any).getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("unknown-profile");
      (ProfileUtils as any).getAvailableProfiles = jest
        .fn()
        .mockReturnValue("profile");
      (downloadService as any).processDownloadError = jest.fn();
      await downloadService.downloadCopybooks("document-uri", [
        { name: "copybook-name", dialect: DEFAULT_DIALECT },
      ]);
      expect((downloadService as any).processDownloadError).toBeCalledWith(
        `${PROVIDE_PROFILE_MSG} Provided invalid profile name: unknown-profile`,
      );
    });

    it("checks download fails when provided profile is not provided", async () => {
      const downloadService = new CopybookDownloadService(
        "storage-path",
        {} as any as IApiRegisterClient,
      );
      (CopybookDownloadService as any).checkWorkspace = jest
        .fn()
        .mockReturnValue(true);
      (ProfileUtils as any).getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("");
      (ProfileUtils as any).getAvailableProfiles = jest
        .fn()
        .mockReturnValue("profile");
      (downloadService as any).processDownloadError = jest.fn();
      await downloadService.downloadCopybooks("document-uri", [
        { name: "copybook-name", dialect: DEFAULT_DIALECT },
      ]);
      expect((downloadService as any).processDownloadError).toBeCalledWith(
        `${PROVIDE_PROFILE_MSG}`,
      );
    });

    it("checks profile with invalid credentials do not trigger download", async () => {
      vscode.window.showErrorMessage = jest.fn();
      const downloadService = new CopybookDownloadService(
        "storage-path",
        zoweExplorerErrorMock,
      );
      (ProfileUtils as any).getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("profile");
      (ProfileUtils as any).getAvailableProfiles = jest
        .fn()
        .mockReturnValue("profile");
      (downloadService as any).processDownloadError = jest.fn();
      DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(false);
      await downloadService.downloadCopybooks("document-uri", [
        { name: "copybook-name", dialect: DEFAULT_DIALECT },
      ]);
      expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
        "Incorrect credentials in Zowe profile profile.",
      );
    });

    it("checks no profile checks are done when download configurations are not configured", async () => {
      vscode.window.showErrorMessage = jest.fn();
      const downloadService = new CopybookDownloadService(
        "storage-path",
        zoweExplorerErrorMock,
      );
      (ProfileUtils as any).getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("profile");
      (ProfileUtils as any).getAvailableProfiles = jest
        .fn()
        .mockReturnValue("profile");
      (downloadService as any).processDownloadError = jest.fn();
      DownloadUtil.areCopybookDownloadConfigurationsPresent = jest
        .fn()
        .mockReturnValue(false);
      expect(
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]),
      ).toBe(undefined);
      expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
        "Incorrect credentials in Zowe profile profile.",
      );
    });

    it("checks locked profile do not trigger download", async () => {
      const downloadService = new CopybookDownloadService(
        "storage-path",
        zoweExplorerErrorMock,
      );
      (ProfileUtils as any).getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("profile");
      (ProfileUtils as any).getAvailableProfiles = jest
        .fn()
        .mockReturnValue("profile");
      DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(true);
      (downloadService as any).processDownloadError = jest.fn();
      expect(
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]),
      ).toBe(undefined);
    });
  });

  it("checks download resolver is invoked with right parameters", async () => {
    (ProfileUtils as any).getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue("profile");
    (ProfileUtils as any).getAvailableProfiles = jest
      .fn()
      .mockReturnValue("profile");
    DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(false);
    DownloadUtil.checkForInvalidCredProfile = jest.fn().mockReturnValue(false);
    DownloadUtil.areCopybookDownloadConfigurationsPresent = jest
      .fn()
      .mockReturnValue(true);
    const downloadService = new CopybookDownloadService(
      "storage-path",
      {} as any as IApiRegisterClient,
    );
    DownloadUtil.checkForInvalidCredProfile = jest.fn().mockReturnValue(false);
    (downloadService as any).downloadCopybook = jest
      .fn()
      .mockResolvedValue(true);
    (downloadService as any).updateDownloadProgress = jest.fn();
    (vscode.ProgressLocation as any) = { Notification: "notify" };
    vscode.window.withProgress = jest
      .fn()
      .mockImplementation(
        async (
          _options: any,
          processDownload: (progress?: any) => Promise<void>,
        ) => {
          return await processDownload();
        },
      );
    await downloadService.downloadCopybooks("document-uri", [
      { name: "copybook-name", dialect: DEFAULT_DIALECT },
    ]);
    expect((downloadService as any).downloadCopybook).toHaveBeenCalledWith(
      { name: "copybook-name", dialect: DEFAULT_DIALECT },
      "document-uri",
    );
  });

  it("checks vscode progess notification is updated on callback", async () => {
    const downloadService = new CopybookDownloadService(
      "storage-path",
      {} as any as IApiRegisterClient,
    );
    const mockProgress = {
      report: jest.fn(),
    };
    (downloadService as any).updateDownloadProgress(mockProgress, 10, 5);
    expect(mockProgress.report).toHaveBeenCalledWith({
      increment: 50,
      message: "50%",
    });
  });
});
