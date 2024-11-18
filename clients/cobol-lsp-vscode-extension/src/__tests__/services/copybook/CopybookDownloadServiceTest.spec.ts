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

import {
  DEFAULT_DIALECT,
  ENDEVOR_PROCESSOR,
  PROVIDE_PROFILE_MSG,
} from "../../../constants";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { Utils } from "../../../services/util/Utils";
import * as vscode from "vscode";
import {
  zoweExplorerErrorMock,
  zoweExplorerMock,
} from "../../../__mocks__/getZoweExplorerMock.utility";
import { DownloadUtil } from "../../../services/copybook/downloader/DownloadUtil";
import { SettingsService } from "../../../services/Settings";
import { E4E } from "../../../type/e4eApi";
import { e4eMock } from "../../../__mocks__/getE4EMock.utility";

jest.mock("../../../services/reporter/TelemetryService");
Utils.getZoweExplorerAPI = jest.fn().mockReturnValue({ api: zoweExplorerMock });

describe("Tests copybook download service", () => {
  let downloadService: CopybookDownloadService;

  beforeEach(() => {
    downloadService = new CopybookDownloadService(
      "storage-path",
      {} as unknown as IApiRegisterClient,
    );
    downloadService["processDownloadError"] = jest.fn();
    jest
      .spyOn(DownloadUtil, "areCopybookDownloadConfigurationsPresent")
      .mockReturnValue(true);
    jest
      .spyOn(ProfileUtils, "getAvailableProfiles")
      .mockReturnValue(["profile"]);
  });

  describe("checks the prerequisites are checked before invoking download", () => {
    describe("unknown-profile", () => {
      beforeEach(() => {
        jest
          .spyOn(ProfileUtils, "getProfileNameForCopybook")
          .mockReturnValue("unknown-profile");
      });

      it("checks download fails when provided profile is not a valid profile", async () => {
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]);
        expect(downloadService["processDownloadError"]).toHaveBeenCalledWith(
          `${PROVIDE_PROFILE_MSG} Provided invalid profile name: unknown-profile`,
        );
      });
    });

    describe("profile not profiled", () => {
      beforeEach(() => {
        jest
          .spyOn(ProfileUtils, "getProfileNameForCopybook")
          .mockReturnValue("");
      });

      it("checks download fails when provided profile is not provided", async () => {
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]);
        expect(downloadService["processDownloadError"]).toHaveBeenCalledWith(
          `${PROVIDE_PROFILE_MSG}`,
        );
      });
    });

    describe("invalid credentials", () => {
      beforeEach(() => {
        jest
          .spyOn(ProfileUtils, "getProfileNameForCopybook")
          .mockReturnValue("profile");
        jest.spyOn(DownloadUtil, "isProfileLocked").mockResolvedValue(false);

        downloadService = new CopybookDownloadService(
          "storage-path",
          zoweExplorerErrorMock,
        );
        downloadService["processDownloadError"] = jest.fn();
      });
      it("checks profile with invalid credentials do not trigger download", async () => {
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          "Incorrect credentials in Zowe profile profile.",
        );
      });
    });

    describe("no download configurations", () => {});
    it("checks no profile checks are done when download configurations are not configured", async () => {
      vscode.window.showErrorMessage = jest.fn();
      const downloadService = new CopybookDownloadService(
        "storage-path",
        zoweExplorerErrorMock,
      );
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("profile");
      ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
      downloadService["processDownloadError"] = jest.fn();
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
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("profile");
      ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
      DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(true);
      downloadService["processDownloadError"] = jest.fn();
      expect(
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]),
      ).toBe(undefined);
    });
  });

  it("checks download resolver is invoked with right parameters", async () => {
    ProfileUtils.getProfileNameForCopybook = jest
      .fn()
      .mockReturnValue("profile");
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
    DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(false);
    DownloadUtil.checkForInvalidCredProfile = jest.fn().mockReturnValue(false);
    DownloadUtil.areCopybookDownloadConfigurationsPresent = jest
      .fn()
      .mockReturnValue(true);
    const downloadService = new CopybookDownloadService(
      "storage-path",
      {} as unknown as IApiRegisterClient,
    );
    DownloadUtil.checkForInvalidCredProfile = jest.fn().mockReturnValue(false);
    downloadService.downloadCopybook = jest.fn().mockResolvedValue(true);
    downloadService["updateDownloadProgress"] = jest.fn();
    vscode.window.withProgress = jest.fn().mockImplementation(
      async (
        _options: vscode.ProgressOptions,
        processDownload: (
          progress: vscode.Progress<{
            message?: string;
            increment?: number;
          }>,
        ) => Promise<void>,
      ) => {
        return await processDownload({ report: () => {} });
      },
    );
    await downloadService.downloadCopybooks("document-uri", [
      { name: "copybook-name", dialect: DEFAULT_DIALECT },
    ]);
    expect(downloadService.downloadCopybook).toHaveBeenCalledWith(
      { name: "copybook-name", dialect: DEFAULT_DIALECT },
      "document-uri",
    );
  });

  it("checks vscode progress notification is updated on callback", () => {
    const downloadService = new CopybookDownloadService(
      "storage-path",
      {} as unknown as IApiRegisterClient,
    );
    const mockProgress = {
      report: jest.fn(),
    };
    downloadService["updateDownloadProgress"](mockProgress, 10, 5);
    expect(mockProgress.report).toHaveBeenCalledWith({
      increment: 50,
      message: "50%",
    });
  });

  describe("checks order of resolution [E4E, DSN and USS order]", () => {
    beforeEach(() => {
      jest.clearAllMocks();
    });
    it("checks the order of copybook resolution - DSN followed by USS)", async () => {
      const downloader = new CopybookDownloadService(
        "storage-path",
        zoweExplorerMock,
        undefined,
      );
      downloader["dsnDownloader"]!.downloadCopybook = jest
        .fn()
        .mockReturnValue(false);
      downloader["ussDownloader"]!.downloadCopybook = jest.fn();
      SettingsService.getDsnPath = jest.fn().mockReturnValue(["dsn"]);
      SettingsService.getUssPath = jest.fn().mockReturnValue(["uss"]);
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        downloader["dsnDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dsn",
      );
      expect(
        downloader["ussDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "uss",
      );
    });

    it("checks the order of copybook resolution - USS is not called when DSN resolves)", async () => {
      const downloader = new CopybookDownloadService(
        "storage-path",
        zoweExplorerMock,
        undefined,
      );
      downloader["dsnDownloader"]!.downloadCopybook = jest
        .fn()
        .mockReturnValue(true);
      downloader["ussDownloader"]!.downloadCopybook = jest.fn();
      SettingsService.getDsnPath = jest.fn().mockReturnValue(["dsn"]);
      SettingsService.getUssPath = jest.fn().mockReturnValue(["uss"]);
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        downloader["dsnDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dsn",
      );
      expect(
        downloader["ussDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
    });
  });

  it("checks the order of copybook resolution - USS and DSN is not called when E4E resolves)", async () => {
    const downloader = new CopybookDownloadService(
      "storage-path",
      zoweExplorerMock,
      e4eMock,
    );
    downloader["e4eDownloader"]!.downloadCopybookE4E = jest
      .fn()
      .mockReturnValue(true);
    downloader["dsnDownloader"]!.downloadCopybook = jest
      .fn()
      .mockReturnValue(false);
    downloader["ussDownloader"]!.downloadCopybook = jest
      .fn()
      .mockReturnValue(false);
    SettingsService.getCopybookEndevorDependencySettings = jest
      .fn()
      .mockReturnValue(ENDEVOR_PROCESSOR);
    await downloader.downloadCopybook(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
    );
    expect(
      downloader["e4eDownloader"]!.downloadCopybookE4E,
    ).toHaveBeenCalledWith("document-uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(downloader["dsnDownloader"]!.downloadCopybook).toHaveBeenCalledTimes(
      0,
    );
    expect(downloader["ussDownloader"]!.downloadCopybook).toHaveBeenCalledTimes(
      0,
    );
  });

  it("checks the order of resolution is same as the one provided in user settings", async () => {
    const downloader = new CopybookDownloadService(
      "storage-path",
      zoweExplorerMock,
      undefined,
    );

    downloader["dsnDownloader"]!.downloadCopybook = jest
      .fn()
      .mockReturnValueOnce(false)
      .mockReturnValue(true);
    downloader["ussDownloader"]!.downloadCopybook = jest.fn();
    SettingsService.getDsnPath = jest.fn().mockReturnValue(["dsn", "dsn-2"]);
    SettingsService.getUssPath = jest.fn().mockReturnValue(["uss"]);
    await downloader.downloadCopybook(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
    );
    expect(downloader["dsnDownloader"]!.downloadCopybook).toHaveBeenCalledWith(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
      "dsn",
    );
    expect(downloader["dsnDownloader"]!.downloadCopybook).toHaveBeenCalledWith(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
      "dsn-2",
    );
  });

  it("checks download fails if ZE apis are missing", async () => {
    const resolver = new CopybookDownloadService(
      "storage-path",
      undefined,
      undefined,
    );
    const result = await resolver.downloadCopybook(
      { name: "copybook", dialect: "COBOL" },
      "doc-uri",
    );
    expect(result).toBeFalsy();
  });

  it("checks clear cache do not throw error when ZE apis are missing", () => {
    const resolver = new CopybookDownloadService(
      "storage-path",
      undefined,
      undefined,
    );
    resolver.clearCache();
  });

  it("checks clear cache calls e4e clear config", () => {
    const resolver = new CopybookDownloadService(
      "storage-path",
      undefined,
      {} as unknown as E4E,
    );
    const clearConfigs = jest.fn();
    resolver["e4eDownloader"]!.clearConfigs = clearConfigs;
    resolver.clearCache();
    expect(clearConfigs).toHaveBeenCalled();
  });
});
