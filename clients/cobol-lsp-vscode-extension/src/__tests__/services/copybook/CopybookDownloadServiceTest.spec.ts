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
  FAILED_REQUESTS_LIMIT,
  PATHS_DSN,
  PATHS_USS,
  PROVIDE_PROFILE_MSG,
  SETTINGS_CPY_NDVR_DEPENDENCIES,
} from "../../../constants";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { Utils } from "../../../services/util/Utils";
import * as vscode from "vscode";
import {
  notFoundErrorMock,
  permissionsErrorMock,
  unauthorizedErrorMock,
  createZoweExplorerMock,
} from "../../../__mocks__/getZoweExplorerMock.utility";
import { DownloadUtil } from "../../../services/copybook/downloader/DownloadUtil";
import { E4E } from "../../../type/e4eApi";
import { e4eMock } from "../../../__mocks__/getE4EMock.utility";
import { Uri } from "../../../__mocks__/UriMock";
import { SettingsService } from "../../../services/Settings";

jest.mock("../../../services/reporter");
Utils.getZoweExplorerAPI = jest
  .fn()
  .mockReturnValue({ api: createZoweExplorerMock });

describe("Tests copybook download service", () => {
  let downloadService: CopybookDownloadService;

  let workspaceConfigurationMock: Record<
    string,
    string[] | string | undefined
  > = {};
  let profileName: string;

  let zoweExplorerMock: IApiRegisterClient;
  let zoweMockUnauthorizedError: IApiRegisterClient;
  let zoweMockNotFoundError: IApiRegisterClient;

  beforeAll(() => {
    zoweExplorerMock = createZoweExplorerMock();
    zoweMockUnauthorizedError = createZoweExplorerMock(
      unauthorizedErrorMock,
      unauthorizedErrorMock,
    );
    zoweMockNotFoundError = createZoweExplorerMock(
      notFoundErrorMock,
      notFoundErrorMock,
    );
  });

  beforeEach(() => {
    downloadService = new CopybookDownloadService(
      "storage-path",
      {} as unknown as IApiRegisterClient,
    );
    downloadService["processDownloadError"] = jest.fn();

    jest.spyOn(vscode.workspace, "getConfiguration").mockImplementation(
      () =>
        ({
          get: (key: string) => workspaceConfigurationMock[key],
        }) as unknown as vscode.WorkspaceConfiguration,
    );

    jest
      .spyOn(ProfileUtils, "getAvailableProfiles")
      .mockReturnValue(["profile"]);

    profileName = "profile";
    jest
      .spyOn(ProfileUtils, "getProfileNameForCopybook")
      .mockImplementation(() => profileName);

    jest.clearAllMocks();
  });

  afterEach(() => {
    jest.restoreAllMocks();
  });

  describe("checks the prerequisites are checked before invoking download", () => {
    describe("unknown-profile", () => {
      beforeEach(() => {
        profileName = "unknown-profile";
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
        profileName = "";
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

    describe("credentials check", () => {
      describe("invalid credentials", () => {
        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            "storage-path",
            zoweMockUnauthorizedError,
          );
          downloadService["processDownloadError"] = jest.fn();
        });

        describe("uss configuration", () => {
          beforeEach(() => {
            workspaceConfigurationMock[PATHS_DSN] = undefined;
            workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];
          });

          it("checks profile with invalid credentials do not trigger download", async () => {
            await downloadService.downloadCopybooks("document-uri", [
              { name: "copybook-name", dialect: DEFAULT_DIALECT },
            ]);

            expect(unauthorizedErrorMock).toHaveBeenCalledWith(
              "/u/test/copybooks",
            );
            expect(zoweMockUnauthorizedError.getUssApi).toHaveBeenCalled();
            expect(zoweMockUnauthorizedError.getMvsApi).not.toHaveBeenCalled();

            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
              "Incorrect credentials in Zowe profile profile.",
            );
          });
        });

        describe("mvs configuration", () => {
          beforeEach(() => {
            workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
            workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];
          });

          it("checks profile with invalid credentials do not trigger download", async () => {
            await downloadService.downloadCopybooks("document-uri", [
              { name: "copybook-name", dialect: DEFAULT_DIALECT },
            ]);

            expect(unauthorizedErrorMock).toHaveBeenCalledWith(
              "TEST.COBOL.COPYBOOK",
            );
            expect(zoweMockUnauthorizedError.getUssApi).not.toHaveBeenCalled();
            expect(zoweMockUnauthorizedError.getMvsApi).toHaveBeenCalled();

            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
              "Incorrect credentials in Zowe profile profile.",
            );
          });
        });
      });

      describe("credentials are valid but copybook dataset doesn't exists", () => {
        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            "storage-path",
            zoweMockNotFoundError,
          );
          workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
          workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];

          downloadService.downloadCopybook = jest.fn().mockResolvedValue(true);
        });

        it("credentials are considered valid, copybooks can be downloaded", async () => {
          await downloadService.downloadCopybooks("document-uri", [
            { name: "copybook-name", dialect: DEFAULT_DIALECT },
          ]);

          expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
            "Incorrect credentials in Zowe profile profile.",
          );

          expect(downloadService.downloadCopybook).toHaveBeenCalled();
        });
      });

      describe("credentials are valid and dataset exists, but user doesn't have permissions for the dataset", () => {
        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            "storage-path",
            createZoweExplorerMock(permissionsErrorMock),
          );
          workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
          workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];

          downloadService.downloadCopybook = jest.fn().mockResolvedValue(true);
        });

        it("credentials are considered valid, copybooks can be downloaded", async () => {
          await downloadService.downloadCopybooks("document-uri", [
            { name: "copybook-name", dialect: DEFAULT_DIALECT },
          ]);

          expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
            "Incorrect credentials in Zowe profile profile.",
          );

          expect(downloadService.downloadCopybook).toHaveBeenCalled();
        });
      });
    });
    describe("if user is able to list the configured copybook dataset, credentials are considered as valid", () => {
      beforeEach(() => {
        downloadService = new CopybookDownloadService(
          "storage-path",
          zoweExplorerMock,
        );
      });

      it("checks profile with invalid credentials do not trigger download", async () => {
        await downloadService.downloadCopybooks("document-uri", [
          { name: "copybook-name", dialect: DEFAULT_DIALECT },
        ]);

        expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
          "Incorrect credentials in Zowe profile profile.",
        );
      });
    });

    it("checks no profile checks are done when download configurations are not configured", async () => {
      const downloadService = new CopybookDownloadService(
        "storage-path",
        zoweExplorerMock,
      );
      ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
      downloadService["processDownloadError"] = jest.fn();
      workspaceConfigurationMock[PATHS_DSN] = undefined;
      workspaceConfigurationMock[PATHS_USS] = undefined;
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
        zoweExplorerMock,
      );
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

    describe("order of copybook resolution - DSN followed by USS", () => {
      beforeAll(() => {
        workspaceConfigurationMock = {
          [PATHS_DSN]: ["dsn"],
          [PATHS_USS]: ["uss"],
        };
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
    });

    describe("order of copybook resolution - USS is not called when DSN resolves", () => {
      beforeAll(() => {
        workspaceConfigurationMock = {
          [PATHS_DSN]: ["dsn"],
          [PATHS_USS]: ["uss"],
        };
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
  });

  describe("order of copybook resolution - USS and DSN is not called when E4E resolves", () => {
    beforeAll(() => {
      workspaceConfigurationMock = {
        [SETTINGS_CPY_NDVR_DEPENDENCIES]: ENDEVOR_PROCESSOR,
      };
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
      expect(
        downloader["dsnDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
      expect(
        downloader["ussDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
    });
  });

  describe("order of resolution is same as the one provided in user settings", () => {
    beforeAll(() => {
      workspaceConfigurationMock = {
        [PATHS_DSN]: ["dsn", "dsn-2"],
        [PATHS_USS]: ["uss"],
      };
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
        downloader["dsnDownloader"]!.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dsn-2",
      );
    });
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

  describe("listRemoteCopybooks", () => {
    let zoweExplorerApiMock: IApiRegisterClient;
    let getAllMembersMock: jest.SpyInstance<IZosFilesResponseMemberList>;
    let fileListMock: jest.SpyInstance<IZosFilesResponseFileList>;
    let datasetMembers: string[] = [];
    let ussFiles: { name: string; mode?: string }[] = [];

    beforeEach(() => {
      getAllMembersMock = jest.fn().mockResolvedValue({
        apiResponse: {
          items: datasetMembers.map((member) => ({ member: member })),
        },
      });
      fileListMock = jest.fn().mockResolvedValue({
        apiResponse: {
          items: ussFiles.map((member) => ({
            name: member.name,
            mode: member.mode ?? "-",
          })),
        },
      });

      zoweExplorerApiMock = {
        getMvsApi: () => ({
          allMembers: getAllMembersMock,
        }),
        getUssApi: () => ({
          fileList: fileListMock,
        }),
        getExplorerExtenderApi: () => ({
          getProfile: () => "profile",
          getProfilesCache: () => ({
            loadNamedProfile: () => ({ name: "profile" }),
          }),
        }),
      } as unknown as IApiRegisterClient;

      jest.spyOn(SettingsService, "getProfileName").mockReturnValue("profile");
    });

    afterEach(() => {
      jest.restoreAllMocks();
    });

    describe("list members of the mvs dataset and uss directories", () => {
      beforeAll(() => {
        datasetMembers = ["AAA", "BBB", "XXX"];
        ussFiles = [{ name: "USSA" }, { name: "USSB" }];
        workspaceConfigurationMock = {
          "paths-dsn": ["DATASET.WITH.COPYBOOK"],
          "paths-uss": ["/user/a/copybooks"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
      });

      test("return list of all members of the dataset", async () => {
        const cds = new CopybookDownloadService(
          "/globalStorage",
          zoweExplorerApiMock,
        );

        const results = await cds.listRemoteCopybooks(
          Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(results).toEqual(expect.arrayContaining(datasetMembers));
        expect(results).toEqual(
          expect.arrayContaining(ussFiles.map((n) => n.name)),
        );
      });
    });

    describe("No directories and files with incorrect extension are returned from uss as copybooks for completions", () => {
      beforeAll(() => {
        datasetMembers = [];
        ussFiles = [
          { name: ".", mode: "drwxr-xr-x" },
          { name: "..", mode: "drwxr-xr-x" },
          {
            name: "CORRECT.CPY",
            mode: "-rwxr-xr-x",
          },
          {
            name: "lowercase.cpy",
            mode: "-rwxr-xr-x",
          },
          {
            name: "invalid.txt",
            mode: "-rwxr-xr-x",
          },
          {
            name: "NOEXT",
            mode: "-rwxr-xr-x",
          },
        ];
        workspaceConfigurationMock = {
          "paths-dsn": [],
          "paths-uss": ["/user/a/copybooks"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
      });

      test("return list of all members of the dataset", async () => {
        const cds = new CopybookDownloadService(
          "/globalStorage",
          zoweExplorerApiMock,
        );

        const results = await cds.listRemoteCopybooks(
          Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(results).toEqual(["CORRECT", "lowercase", "NOEXT"]);
      });
    });

    describe("Error handling ", () => {
      const errorMessage =
        "Rest API failure with HTTP(S) status 404 ISRZ002 Data set not cataloged - 'DATASET.WITH.COPYBOOK' was not found in catalog.";

      beforeAll(() => {
        ussFiles = [{ name: "USSA" }, { name: "USSB" }];
        workspaceConfigurationMock = {
          "paths-dsn": ["DATASET.WITH.COPYBOOK"],
          "paths-uss": ["/user/a/copybooks"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
      });

      describe("Error in listing one directory should not affect listing other directories", () => {
        test("return list of all members of the uss, and logs error listing of the dataset", async () => {
          const outputChannelMock = { appendLine: jest.fn() };

          getAllMembersMock = jest
            .fn()
            .mockRejectedValue(new Error(errorMessage));

          const cds = new CopybookDownloadService(
            "/globalStorage",
            zoweExplorerApiMock,
            undefined,
            outputChannelMock as unknown as vscode.OutputChannel,
          );

          const results = await cds.listRemoteCopybooks(
            Uri.file("/test.cbl").toString(),
            DEFAULT_DIALECT,
          );

          expect(results).toEqual(expect.arrayContaining(datasetMembers));
          expect(results).toEqual(
            expect.arrayContaining(ussFiles.map((n) => n.name)),
          );

          expect(outputChannelMock.appendLine).toHaveBeenCalledWith(
            expect.stringContaining(errorMessage),
          );
        });
      });

      describe("Failed request to list dataset should not be repeated indefinitely", () => {
        test("Successful requests are unlimited", async () => {
          const cds = new CopybookDownloadService(
            "/globalStorage",
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
            cds.clearCache();
          }

          expect(getAllMembersMock).toHaveBeenCalledTimes(10);
        });

        test("Failing requests are blocked after n attempts", async () => {
          getAllMembersMock = jest
            .fn()
            .mockRejectedValue(new Error(errorMessage));

          const cds = new CopybookDownloadService(
            "/globalStorage",
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }

          expect(getAllMembersMock).toHaveBeenCalledTimes(
            FAILED_REQUESTS_LIMIT,
          );

          expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
            `Request to list dataset members profile/DATASET.WITH.COPYBOOK keeps failing repeatedly. Disabling future requests. ${errorMessage}`,
            "Keep disabled",
            "Reenable",
          );
        });

        test("Reenable failed Zowe request command unblocks failed requests", async () => {
          getAllMembersMock = jest
            .fn()
            .mockRejectedValue(new Error(errorMessage));

          const cds = new CopybookDownloadService(
            "/globalStorage",
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }

          expect(getAllMembersMock).toHaveBeenCalledTimes(
            FAILED_REQUESTS_LIMIT,
          );

          cds.reenableFailedRequests();

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }

          expect(getAllMembersMock).toHaveBeenCalledTimes(
            FAILED_REQUESTS_LIMIT * 2,
          );
        });
      });
    });

    describe("Do not require Zowe profile configuration if no remote location is configured", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-dsn": [],
          "paths-uss": [],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
        profileName = "";
      });

      test("no error popup is shown", async () => {
        const cds = new CopybookDownloadService(
          "/globalStorage",
          zoweExplorerApiMock,
        );
        await cds.listRemoteCopybooks(
          Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(vscode.window.showErrorMessage).not.toHaveBeenCalled();
      });
    });

    describe("Check Zowe profile configuration if remote location is configured", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-dsn": ["DATASET.WITH.COPYBOOKS"],
          "paths-uss": [],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
        profileName = "";
      });

      test("error popup is shown", async () => {
        const cds = new CopybookDownloadService(
          "/globalStorage",
          zoweExplorerApiMock,
        );
        await cds.listRemoteCopybooks(
          Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe.",
          "Change settings",
        );
      });
    });
  });
});
