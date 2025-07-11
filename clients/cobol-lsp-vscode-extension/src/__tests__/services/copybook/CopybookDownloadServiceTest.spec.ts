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
  PATHS_LOCAL_KEY,
  PATHS_USS,
  PROVIDE_PROFILE_MSG,
  SETTINGS_CPY_NDVR_DEPENDENCIES,
} from "../../../constants";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { Utils } from "../../../services/util/Utils";
import * as vscode from "vscode";
import { createZoweExplorerMock } from "../../../__mocks__/getZoweExplorerMock.utility";
import { DownloadUtil } from "../../../services/copybook/downloader/DownloadUtil";
import { E4E } from "../../../type/e4eApi";
import * as ProcessorGroups from "../../../services/ProcessorGroups";
import { SettingsService } from "../../../services/Settings";
import { FileNotFound, readDirectoryResult } from "../../../__mocks__/vscode";
import * as ProcessorGroupLoader from "../../../services/ProcessorGroupsLoader";
import {
  e4eMock,
  e4eMockInvalidProfile,
} from "../../../__mocks__/getE4EMock.utility";
import { DownloadDiagnosticsService } from "../../../services/DiagnosticsService";
import { ZoweExplorerDownloader } from "../../../services/copybook/downloader/ZoweExplorerDownloader";
import { localCopybooks } from "../../../services/copybook/LocalCopybooksService";

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

  beforeAll(() => {
    zoweExplorerMock = createZoweExplorerMock();
  });

  beforeEach(() => {
    downloadService = new CopybookDownloadService(
      vscode.Uri.file("/storage-path"),
      zoweExplorerMock,
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

  describe("the prerequisites are checked before resolving remote copybooks", () => {
    describe("ZOWE API is missing", () => {
      it("checks download fails if ZE apis are missing", async () => {
        const resolver = new CopybookDownloadService(
          vscode.Uri.file("/storage-path"),
          undefined,
          undefined,
        );
        const result = await resolver.resolveCopybookURI(
          "file:///doc-ui",
          "copybook",
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });

      it("checks missing explorer api produces diagnostics when processor groups have dsn or uss config", async () => {
        const diagnosticsService = new DownloadDiagnosticsService();
        const service = new CopybookDownloadService(
          vscode.Uri.file("/storage-path"),
          undefined,
          e4eMock,
          undefined,
          diagnosticsService,
        );
        const diagnosticsSpy = jest
          .spyOn(diagnosticsService, "showDiagnostics")
          .mockImplementation();

        const spyConfig = jest.spyOn(
          ProcessorGroups,
          "loadProcessorGroupCopybookPathsConfig",
        );
        spyConfig.mockResolvedValue([
          {
            dataset: "dataset",
            uss: "uss",
          },
        ]);
        await service.resolveCopybookURI(
          "file:///document-uri",
          "copybook",
          DEFAULT_DIALECT,
        );
        expect(diagnosticsSpy).toHaveBeenCalledWith(
          expect.objectContaining({ path: "/document-uri" }),
          [
            {
              message: "Zowe Explorer is not installed",
              range: {
                end: { character: 0, line: 1 },
                start: { character: 0, line: 0 },
              },
              severity: 1,
            },
          ],
        );
      });

      it("checks installing e4e or zowe api removes download diagnostics", async () => {
        const diagnosticsService = new DownloadDiagnosticsService();
        const service = new CopybookDownloadService(
          vscode.Uri.file("/storage-path"),
          undefined,
          undefined,
          undefined,
          diagnosticsService,
        );
        const showDiagnosticsSpy = jest
          .spyOn(diagnosticsService, "showDiagnostics")
          .mockImplementation();

        const clearDiagnosticsSpy = jest
          .spyOn(diagnosticsService, "clearDiagnostics")
          .mockImplementation();

        const spyConfig = jest.spyOn(
          ProcessorGroups,
          "loadProcessorGroupCopybookPathsConfig",
        );
        spyConfig.mockResolvedValue([
          {
            dataset: "dataset",
            uss: "uss",
          },
        ]);
        await service.resolveCopybookURI(
          "file:///document-uri",
          "copybook",
          DEFAULT_DIALECT,
        );

        service.explorerAppeared(zoweExplorerMock);
        service.e4eAppeared(e4eMock);

        expect(showDiagnosticsSpy).toHaveBeenCalledWith(
          expect.objectContaining({ path: "/document-uri" }),
          [
            {
              message: "Zowe Explorer is not installed",
              range: {
                end: { character: 0, line: 1 },
                start: { character: 0, line: 0 },
              },
              severity: 1,
            },
          ],
        );

        expect(clearDiagnosticsSpy).toHaveBeenCalledTimes(2);
      });
    });

    describe("Endevor API missing", () => {
      it("checks missing e4e api produces diagnostics when processor groups have endevor config", async () => {
        const diagnosticsService = new DownloadDiagnosticsService();
        const service = new CopybookDownloadService(
          vscode.Uri.file("/storage-path"),
          zoweExplorerMock,
          undefined,
          undefined,
          diagnosticsService,
        );
        const diagnosticsSpy = jest
          .spyOn(diagnosticsService, "showDiagnostics")
          .mockImplementation();
        const spyConfig = jest.spyOn(
          ProcessorGroups,
          "loadProcessorGroupCopybookPathsConfig",
        );
        spyConfig.mockResolvedValue([
          {
            environment: "environment",
            stage: "1",
            system: "system",
            subsystem: "subsystem",
            type: "type",
          },
        ]);
        await service.resolveCopybookURI(
          "file:///document-uri",
          "copybook",
          DEFAULT_DIALECT,
        );
        expect(diagnosticsSpy).toHaveBeenCalledWith(
          expect.objectContaining({ scheme: "file", path: "/document-uri" }),
          [
            {
              message: "Explorer for Endevor is not installed",
              range: {
                end: { character: 0, line: 1 },
                start: { character: 0, line: 0 },
              },
              severity: 1,
            },
          ],
        );
      });
    });

    describe("unknown-profile", () => {
      beforeEach(() => {
        workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
        profileName = "unknown-profile";
      });

      it("checks download fails when provided profile is not a valid profile", async () => {
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        );
        expect(downloadService["processDownloadError"]).toHaveBeenCalledWith(
          `${PROVIDE_PROFILE_MSG} Provided invalid profile name: unknown-profile`,
        );
      });
    });

    describe("profile not provided", () => {
      beforeEach(() => {
        workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
        profileName = "";
      });

      it("checks download fails when provided profile is not provided", async () => {
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        );
        expect(downloadService["processDownloadError"]).toHaveBeenCalledWith(
          PROVIDE_PROFILE_MSG,
        );
      });
    });

    describe("no profile and no remote location configured", () => {
      beforeEach(() => {
        workspaceConfigurationMock[PATHS_DSN] = [];
        workspaceConfigurationMock[PATHS_USS] = [];
        profileName = "";
      });

      it("should not show the missing zowe profile message", async () => {
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        );
        expect(downloadService["processDownloadError"]).not.toHaveBeenCalled();
      });
    });

    describe("credentials check", () => {
      beforeEach(() => {
        ZoweExplorerDownloader.profileStore = new Map();
      });

      describe("invalid credentials", () => {
        let statSpy: jest.SpyInstance;
        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            vscode.Uri.file("/storage-path"),
            zoweExplorerMock,
          );
          downloadService["processDownloadError"] = jest.fn();
          statSpy = jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockRejectedValue(
              new Error(
                "Rest API failure with HTTP(S) status 401\nThis operation requires authentication.",
              ),
            );
        });

        describe("uss configuration", () => {
          beforeEach(() => {
            workspaceConfigurationMock[PATHS_DSN] = undefined;
            workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];
          });

          it("checks profile with invalid credentials do not trigger download", async () => {
            await downloadService.resolveCopybookURI(
              "file:///document-uri",
              "copybook-name",
              DEFAULT_DIALECT,
            );

            expect(statSpy).toHaveBeenCalled();

            expect(vscode.workspace.fs.readDirectory).not.toHaveBeenCalled();
          });
        });

        describe("mvs configuration", () => {
          beforeEach(() => {
            workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
            workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];
          });

          it("checks profile with invalid credentials do not trigger download", async () => {
            await downloadService.resolveCopybookURI(
              "file:///document-uri",
              "copybook-name",
              DEFAULT_DIALECT,
            );

            expect(statSpy).toHaveBeenCalled();

            expect(vscode.workspace.fs.readDirectory).not.toHaveBeenCalled();
          });
        });
      });

      describe("credentials are valid but copybook dataset doesn't exists", () => {
        let prerequisiteCheckSpy: jest.SpyInstance;
        let statSpy: jest.SpyInstance;

        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            vscode.Uri.file("/storage-path"),
            zoweExplorerMock,
          );
          workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
          workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];

          prerequisiteCheckSpy = jest.spyOn(
            downloadService as unknown as {
              isPrerequisiteForDownloadSatisfied: CopybookDownloadService["isPrerequisiteForDownloadSatisfied"];
            },
            "isPrerequisiteForDownloadSatisfied",
          );
          downloadService.clearCache();
          statSpy = jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockRejectedValue(
              new Error(
                "Rest API failure with HTTP(S) status 404 ISRZ002 Data set not cataloged",
              ),
            );
        });

        it("credentials are considered valid, copybooks can be downloaded", async () => {
          const result = await downloadService.resolveCopybookURI(
            "file:///document-uri",
            "copybook-name",
            DEFAULT_DIALECT,
          );

          expect(prerequisiteCheckSpy).toHaveBeenCalled();
          expect(statSpy).toHaveBeenCalled();
          expect(vscode.window.showErrorMessage).not.toHaveBeenCalled();
          expect(result).toBeUndefined();
        });
      });

      describe("credentials are valid and dataset exists, but user doesn't have permissions for the dataset", () => {
        let prerequisiteCheckSpy: jest.SpyInstance;
        beforeEach(() => {
          downloadService = new CopybookDownloadService(
            vscode.Uri.file("/storage-path"),
            zoweExplorerMock,
          );
          workspaceConfigurationMock[PATHS_DSN] = ["TEST.COBOL.COPYBOOK"];
          workspaceConfigurationMock[PATHS_USS] = ["/u/test/copybooks"];

          prerequisiteCheckSpy = jest.spyOn(
            downloadService as unknown as {
              isPrerequisiteForDownloadSatisfied: CopybookDownloadService["isPrerequisiteForDownloadSatisfied"];
            },
            "isPrerequisiteForDownloadSatisfied",
          );
        });

        it("credentials are considered valid, copybooks can be downloaded", async () => {
          await downloadService.resolveCopybookURI(
            "file:///document-uri",
            "copybook-name",
            DEFAULT_DIALECT,
          );

          expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
            "Incorrect credentials in Zowe profile profile.",
          );

          expect(prerequisiteCheckSpy).toHaveBeenCalled();
        });
      });
    });

    describe("if user is able to list the configured copybook dataset, credentials are considered as valid", () => {
      beforeEach(() => {
        downloadService = new CopybookDownloadService(
          vscode.Uri.file("/storage-path"),
          zoweExplorerMock,
        );
      });

      it("correct credentials don't trigger error message", async () => {
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        );

        expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
          "Incorrect credentials in Zowe profile profile.",
        );
      });
    });

    it("no profile checks are done when download configurations are not configured", async () => {
      const downloadService = new CopybookDownloadService(
        vscode.Uri.file("/storage-path"),
        zoweExplorerMock,
      );
      ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
      downloadService["processDownloadError"] = jest.fn();
      workspaceConfigurationMock[PATHS_DSN] = undefined;
      workspaceConfigurationMock[PATHS_USS] = undefined;
      expect(
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        ),
      ).toBe(undefined);
      expect(vscode.window.showErrorMessage).not.toHaveBeenCalledWith(
        "Incorrect credentials in Zowe profile profile.",
      );
    });

    it("checks locked profile do not trigger download", async () => {
      const downloadService = new CopybookDownloadService(
        vscode.Uri.file("/storage-path"),
        zoweExplorerMock,
      );
      ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue("profile");
      DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(true);
      downloadService["processDownloadError"] = jest.fn();
      expect(
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        ),
      ).toBe(undefined);
    });
    it("checks an invalid zowe profile in a proc group is reported to the user", async () => {
      const mocked = jest.spyOn(
        ProcessorGroups,
        "loadProcessorGroupCopybookPathsConfig",
      );
      DownloadUtil.isProfileLocked = jest.fn().mockReturnValue(false);
      mocked.mockResolvedValue([
        vscode.Uri.file("/libs"),
        { dataset: "dataset", profile: "invalidProfile" },
      ]);
      const downloadService = new CopybookDownloadService(
        vscode.Uri.file("/storage-path"),
        zoweExplorerMock,
      );

      expect(
        await downloadService.resolveCopybookURI(
          "file:///document-uri",
          "copybook-name",
          DEFAULT_DIALECT,
        ),
      ).toBe(undefined);
      expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
        "Please specify a valid Zowe Explorer profile in proc_grps.json to download copybooks from the mainframe. Provided invalid profile name: invalidProfile",
      );
      mocked.mockResolvedValue([]);
    });
  });

  describe("cache clear", () => {
    it("checks clear cache do not throw error when ZE apis are missing", () => {
      const resolver = new CopybookDownloadService(
        vscode.Uri.file("/storage-path"),
        undefined,
        undefined,
      );
      resolver.clearCache();
    });

    it("checks clear cache calls e4e clear config", () => {
      const resolver = new CopybookDownloadService(
        vscode.Uri.file("/storage-path"),
        undefined,
        {} as unknown as E4E,
      );
      const clearConfigs = jest.fn();
      resolver["e4eDownloader"]!.clearConfigs = clearConfigs;
      resolver.clearCache();
      expect(clearConfigs).toHaveBeenCalled();
    });
  });
  describe("listRemoteCopybooks", () => {
    let zoweExplorerApiMock: IApiRegisterClient;
    let datasetMembers: string[] = [];
    let ussFiles: { name: string; mode?: string }[] = [];

    const notFoundErrorMessage =
      "Rest API failure with HTTP(S) status 404 ISRZ002 Data set not cataloged - 'DATASET.WITH.COPYBOOK' was not found in catalog.";

    beforeEach(() => {
      zoweExplorerApiMock = {
        getExplorerExtenderApi: () => ({
          getProfile: () => "profile",
          getProfilesCache: () => ({
            loadNamedProfile: () => ({ name: "profile" }),
          }),
        }),
        onProfileUpdated: jest.fn(),
      } as unknown as IApiRegisterClient;

      jest.spyOn(SettingsService, "getProfileName").mockReturnValue("profile");
      jest
        .spyOn(vscode.workspace.fs, "stat")
        .mockResolvedValue({} as vscode.FileStat);

      readDirectoryResult["/profile/NOT.FOUND.DATASET"] = new Error(
        notFoundErrorMessage,
      );
      readDirectoryResult["/profile/DATASET.WITH.COPYBOOK"] = datasetMembers;
      readDirectoryResult["/profile/user/a/copybooks"] = ussFiles;
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

      it("return list of all members of the dataset", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerApiMock,
        );

        const results = await cds.listRemoteCopybooks(
          vscode.Uri.file("/test.cbl").toString(),
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
          {
            name: "directory",
            mode: "drwxr-xr-x",
          },
        ];
        workspaceConfigurationMock = {
          "paths-dsn": [],
          "paths-uss": ["/user/a/copybooks"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
      });

      it("return list of all members of the dataset", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerApiMock,
        );

        const results = await cds.listRemoteCopybooks(
          vscode.Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(results).toEqual(["CORRECT", "lowercase", "NOEXT"]);
      });
    });

    describe("Error handling ", () => {
      beforeAll(() => {
        ussFiles = [{ name: "USSA" }, { name: "USSB" }];
        workspaceConfigurationMock = {
          "paths-dsn": ["NOT.FOUND.DATASET"],
          "paths-uss": ["/user/a/copybooks"],
          "copybook-extensions": [".CPY", ".cpy", ""],
        };
      });

      describe("Error in listing one directory should not affect listing other directories", () => {
        it("return list of all members of the uss, and logs error listing of the dataset", async () => {
          const outputChannelMock = { appendLine: jest.fn() };

          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerApiMock,
            undefined,
            outputChannelMock as unknown as vscode.OutputChannel,
          );

          const results = await cds.listRemoteCopybooks(
            vscode.Uri.file("/test.cbl").toString(),
            DEFAULT_DIALECT,
          );

          expect(results).toEqual(expect.arrayContaining(datasetMembers));
          expect(results).toEqual(
            expect.arrayContaining(ussFiles.map((n) => n.name)),
          );

          expect(outputChannelMock.appendLine).toHaveBeenCalledWith(
            expect.stringContaining(notFoundErrorMessage),
          );
        });
      });

      describe("Failed request to list dataset should not be repeated indefinitely", () => {
        it("Successful requests are unlimited", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              vscode.Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
            cds.clearCache();
          }

          expect(
            (vscode.workspace.fs.readDirectory as jest.Mock).mock.calls.filter(
              (call: [vscode.Uri]) =>
                call[0].path === "/profile/user/a/copybooks",
            ).length,
          ).toEqual(10);
        });

        it("Failing requests are blocked after n attempts", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              vscode.Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }

          expect(
            (vscode.workspace.fs.readDirectory as jest.Mock).mock.calls.filter(
              (call: [vscode.Uri]) =>
                call[0].path === "/profile/NOT.FOUND.DATASET",
            ).length,
          ).toEqual(FAILED_REQUESTS_LIMIT);

          expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
            `Request to list dataset members profile/NOT.FOUND.DATASET keeps failing repeatedly. Disabling future requests. ${notFoundErrorMessage}`,
            "Keep disabled",
            "Reenable",
          );
        });

        it("Reenable failed Zowe request command unblocks failed requests", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerApiMock,
          );

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              vscode.Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }

          expect(
            (vscode.workspace.fs.readDirectory as jest.Mock).mock.calls.filter(
              (call: [vscode.Uri]) =>
                call[0].path === "/profile/NOT.FOUND.DATASET",
            ).length,
          ).toEqual(FAILED_REQUESTS_LIMIT);

          cds.reenableFailedRequests();

          for (let attempt = 0; attempt < 10; attempt++) {
            await cds.listRemoteCopybooks(
              vscode.Uri.file("/test.cbl").toString(),
              DEFAULT_DIALECT,
            );
          }
          expect(
            (vscode.workspace.fs.readDirectory as jest.Mock).mock.calls.filter(
              (call: [vscode.Uri]) =>
                call[0].path === "/profile/NOT.FOUND.DATASET",
            ).length,
          ).toEqual(FAILED_REQUESTS_LIMIT * 2);
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

      it("no error popup is shown", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerApiMock,
        );
        await cds.listRemoteCopybooks(
          vscode.Uri.file("/test.cbl").toString(),
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

      it("error popup is shown", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerApiMock,
        );
        await cds.listRemoteCopybooks(
          vscode.Uri.file("/test.cbl").toString(),
          DEFAULT_DIALECT,
        );

        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe.",
          "Change settings",
        );
      });
    });
  });

  describe("resolveCopybookURI", () => {
    beforeEach(() => {
      readDirectoryResult["/profile/DATASET.WITH.COPYBOOKS"] = ["COPYBOOK"];
      readDirectoryResult["/profile/remote/uss/copybooks"] = [
        ["COPYBOOK.CPY", vscode.FileType.File],
        ["CaSEsEnSiTiVe.CpY", vscode.FileType.File],
        ["directory", vscode.FileType.Directory],
      ];

      jest.spyOn(SettingsService, "getProfileName").mockReturnValue("profile");
      jest.spyOn(vscode.workspace, "getWorkspaceFolder").mockReturnValue({
        index: 0,
        uri: vscode.Uri.file("/workspace"),
        name: "workspace",
      });
    });

    describe("resolve local copybooks", () => {
      describe("default COBOL dialect", () => {
        let findFilesSpy: jest.SpyInstance;

        beforeEach(() => {
          workspaceConfigurationMock = {
            "paths-local": ["copybooks"],
            "copybook-extensions": [".CPY"],
          };
          profileName = "";
          findFilesSpy = jest
            .spyOn(vscode.workspace, "findFiles")
            .mockResolvedValue([
              vscode.Uri.parse("file:///workspace/copybooks/COPYBOOK.cpy"),
            ]);
          localCopybooks.clearCache();
        });

        it("local copybook workspace folder is searched", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
          );
          const result = await cds.resolveCopybookURI(
            vscode.Uri.file("/test.cbl").toString(),
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual("file:///workspace/copybooks/COPYBOOK.cpy");

          expect(findFilesSpy).toHaveBeenCalledWith({
            baseUri: vscode.Uri.file("/workspace/copybooks"),
            pattern: "*",
          });
        });
      });

      describe("local dialect copybook resolution", () => {
        let findFilesSpy: jest.SpyInstance;

        beforeEach(() => {
          workspaceConfigurationMock = {
            "paths-local": ["copybooks"],
            "dialect.paths-local": ["/dialect/copybooks"],
            "copybook-extensions": [".CPY"],
          };
          findFilesSpy = jest
            .spyOn(vscode.workspace, "findFiles")
            .mockResolvedValue([
              vscode.Uri.parse("file:///dialect/copybooks/COPYBOOK.CPY"),
            ]);
        });
        it("uses dialect path configuration, not generic copybooks", async () => {
          const downloader = new CopybookDownloadService(
            vscode.Uri.file("/storagePath"),
          );
          const result = await downloader.resolveCopybookURI(
            vscode.Uri.file("/test.cbl").toString(),
            "COPYBOOK",
            "dialect",
          );

          expect(result).toEqual("file:///dialect/copybooks/COPYBOOK.CPY");

          expect(findFilesSpy).toHaveBeenCalledTimes(1);
          expect(findFilesSpy).toHaveBeenCalledWith({
            baseUri: vscode.Uri.file("/dialect/copybooks"),
            pattern: "*",
          });
        });
      });
    });

    describe("resolve remote dsn copybooks", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-dsn": ["OTHER.DATASET", "DATASET.WITH.COPYBOOKS"],
          "copybook-extensions": [".CPY"],
        };
        profileName = "profile";

        readDirectoryResult["/profile/OTHER.DATASET"] = [];
        readDirectoryResult["/profile/DATASET.WITH.COPYBOOKS"] = ["COPYBOOK"];
      });

      it("zowe ds uri is constructed", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );
        const result = await cds.resolveCopybookURI(
          vscode.Uri.file("/test.cbl").toString(),
          "COPYBOOK",
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(
          "zowe-ds:/profile/DATASET.WITH.COPYBOOKS/COPYBOOK.cpy",
        );

        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledWith(
          vscode.Uri.parse("zowe-ds:/profile/OTHER.DATASET"),
        );
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledWith(
          vscode.Uri.parse("zowe-ds:/profile/DATASET.WITH.COPYBOOKS"),
        );
      });
    });

    describe("resolve remote uss copybooks", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-uss": ["/user/copybooks", "/remote/uss/copybooks"],
          "copybook-extensions": [".CPY"],
        };
        profileName = "profile";
      });

      it("zowe ds uri is constructed", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );
        const result = await cds.resolveCopybookURI(
          vscode.Uri.file("/test.cbl").toString(),
          "COPYBOOK",
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(
          "zowe-uss:/profile/remote/uss/copybooks/COPYBOOK.CPY",
        );

        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledWith(
          vscode.Uri.parse("zowe-uss:/profile/user/copybooks"),
        );
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledWith(
          vscode.Uri.parse("zowe-uss:/profile/remote/uss/copybooks"),
        );
      });

      it("copybook are case insensitive", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );
        const result = await cds.resolveCopybookURI(
          vscode.Uri.file("/test.cbl").toString(),
          "casesensitive",
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(
          "zowe-uss:/profile/remote/uss/copybooks/CaSEsEnSiTiVe.CpY",
        );
      });
    });

    describe("resolve remote endevor copybooks", () => {
      describe("endevor members", () => {
        let dataset: string;
        let e4eMock: E4E;
        let cachedFileExists: boolean = false;

        beforeEach(() => {
          workspaceConfigurationMock = {
            [SETTINGS_CPY_NDVR_DEPENDENCIES]: ENDEVOR_PROCESSOR,
            ["compiler"]: "",
            ["preprocessors"]: [],
            [PATHS_LOCAL_KEY]: ["copybooks"],
          };
          dataset = "ENDEVOR.DATASET.COPYBOOK";

          e4eMock = {
            isEndevorElement: jest.fn().mockResolvedValue(true),
            getProfileInfo: jest.fn().mockResolvedValue({
              profile: "profile",
              instance: "instance",
            }),
            listElements: jest.fn().mockResolvedValue([]),
            getElement: jest.fn(),
            listMembers: jest.fn().mockResolvedValue(["COPYBOOK"]),
            getMember: jest.fn().mockResolvedValue([]),
            getConfiguration: jest.fn().mockResolvedValue({
              pgms: [{ pgroup: "pgroup" }],
              pgroups: [
                {
                  name: "pgroup",
                  libs: [{ dataset }],
                },
              ],
            }),
            onDidChangeElement: jest.fn(),
          };

          jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockImplementation(async (_uri: vscode.Uri) => {
              if (!cachedFileExists) {
                throw new FileNotFound();
              }
              return Promise.resolve({} as vscode.FileStat);
            });
          jest.spyOn(vscode.workspace, "findFiles");
        });

        it("local cached of copybook uri is returned", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );
          const documentUri = vscode.Uri.file("/test.cbl").toString();
          const result = await cds.resolveCopybookURI(
            documentUri,
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
            expect.objectContaining({
              scheme: "file",
              path: "/globalStorage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
            }),
            expect.anything(),
          );

          expect(result).toEqual(
            expect.stringMatching(
              "file:///globalStorage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
            ),
          );
        });

        it("if copybook is requested multiple times, E4E is called just once", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );
          const documentUri = vscode.Uri.file("/test.cbl").toString();
          const resultFirst = await cds.resolveCopybookURI(
            documentUri,
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(resultFirst).toEqual(
            expect.stringMatching(
              "file:///globalStorage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
            ),
          );
          expect(e4eMock.getMember).toHaveBeenCalledTimes(1);

          cachedFileExists = true;

          const resultSecond = await cds.resolveCopybookURI(
            documentUri,
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(resultSecond).toEqual(resultFirst);
          expect(e4eMock.getMember).toHaveBeenCalledTimes(1);
        });

        it("doesn't searches other locations if copybook not found in endevor", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );

          const documentUri = vscode.Uri.file("/test.cbl").toString();
          const result = await cds.resolveCopybookURI(
            documentUri,
            "NOTEXISTS",
            DEFAULT_DIALECT,
          );
          expect(result).toBeUndefined();

          expect(vscode.workspace.findFiles).not.toHaveBeenCalled();
        });
      });

      describe("endevor elements", () => {
        let e4eMock: E4E;
        let cachedFileExists: boolean = false;

        beforeEach(() => {
          workspaceConfigurationMock = {
            [SETTINGS_CPY_NDVR_DEPENDENCIES]: ENDEVOR_PROCESSOR,
            ["compiler"]: "",
            ["preprocessors"]: [],
          };

          e4eMock = {
            isEndevorElement: jest.fn().mockResolvedValue(true),
            getProfileInfo: jest.fn().mockResolvedValue({
              profile: "profile",
              instance: "instance",
            }),
            listElements: jest.fn().mockResolvedValue([["COPYBOOK", "12345"]]),
            getElement: jest.fn().mockResolvedValue([""]),
            listMembers: jest.fn().mockResolvedValue([]),
            getMember: jest.fn().mockResolvedValue([]),
            getConfiguration: jest.fn().mockResolvedValue({
              pgms: [{ pgroup: "pgroup" }],
              pgroups: [
                {
                  name: "pgroup",
                  libs: [
                    {
                      use_map: false,
                      environment: "environment",
                      stage: "stage",
                      system: "system",
                      subsystem: "subsystem",
                      type: "type",
                    },
                  ],
                },
              ],
            }),
            onDidChangeElement: jest.fn(),
          };

          jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockImplementation(async (_uri: vscode.Uri) => {
              if (!cachedFileExists) {
                throw new FileNotFound();
              }
              return Promise.resolve({} as vscode.FileStat);
            });
        });

        it("local cached of copybook uri is returned", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );
          const documentUri = vscode.Uri.file("/test.cbl").toString();
          const result = await cds.resolveCopybookURI(
            documentUri,
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
            expect.objectContaining({
              scheme: "file",
              path: "/globalStorage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/COPYBOOK",
            }),
            expect.anything(),
          );

          expect(result).toEqual(
            expect.stringMatching(
              "file:///globalStorage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/COPYBOOK",
            ),
          );
        });

        it("if cached version is available e4e is not called again", async () => {
          cachedFileExists = true;
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );
          const documentUri = vscode.Uri.file("/test.cbl").toString();
          const result = await cds.resolveCopybookURI(
            documentUri,
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
          expect(e4eMock.getElement).not.toHaveBeenCalled();

          expect(result).toEqual(
            expect.stringMatching(
              "file:///globalStorage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/COPYBOOK",
            ),
          );
        });
      });

      describe("dont resolve endevor copybooks if SETTINGS_CPY_NDVR_DEPENDENCIES is not set to ENDEVOR_PROCESSOR", () => {
        let dataset: string;
        let e4eMock: E4E;

        beforeEach(() => {
          workspaceConfigurationMock = {
            [SETTINGS_CPY_NDVR_DEPENDENCIES]: "",
            "paths-local": ["copybooks"],
            "copybook-extensions": [".CPY"],
          };
          dataset = "ENDEVOR.DATASET.COPYBOOK";

          e4eMock = {
            isEndevorElement: jest.fn().mockResolvedValue(true),
            getProfileInfo: jest.fn().mockResolvedValue({
              profile: "profile",
              instance: "instance",
            }),
            listElements: jest.fn().mockResolvedValue([]),
            getElement: jest.fn(),
            listMembers: jest.fn().mockResolvedValue(["COPYBOOK"]),
            getMember: jest.fn().mockResolvedValue([]),
            getConfiguration: jest.fn().mockResolvedValue({
              pgms: [{ pgroup: "pgroup" }],
              pgroups: [
                {
                  name: "pgroup",
                  libs: [{ dataset }],
                },
              ],
            }),
            onDidChangeElement: jest.fn(),
          };

          jest
            .spyOn(vscode.workspace, "findFiles")
            .mockResolvedValue([
              vscode.Uri.parse("file:///workspace/copybooks/COPYBOOK.cpy"),
            ]);
          localCopybooks.clearCache();
        });

        it("resolve local copybook instead", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMock,
          );

          const result = await cds.resolveCopybookURI(
            vscode.Uri.file("/test.cbl").toString(),
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual("file:///workspace/copybooks/COPYBOOK.cpy");
        });
      });
    });

    describe("resolve processor group copybooks", () => {
      let findFilesSpy: jest.SpyInstance;
      let findFilesSpyResult: vscode.Uri[];
      let processorGroups: ProcessorGroupLoader.ProcessorGroup[] = [];
      let programConfigs: ProcessorGroupLoader.ProgramsConfig;

      beforeEach(() => {
        processorGroups = [
          {
            name: "group",
            libs: [
              "local/pg/copybooks",
              { dataset: "PROCGRP.COPYBOOKS", profile: "pg_profile" },
              { uss: "/uss/procgrp/copybooks", profile: "pg_profile" },
              {
                environment: "ENV",
                stage: "1",
                system: "SYSTEM",
                subsystem: "SUBSYTEM",
                type: "COPY",
                profile: "instance.internal.connection",
              },
            ],
          },
          {
            name: "datasetFirst",
            libs: [
              { dataset: "PROCGRP.COPYBOOKS", profile: "pg_profile" },
              {
                environment: "ENV",
                stage: "1",
                system: "SYSTEM",
                subsystem: "SUBSYTEM",
                type: "COPY",
                profile: "instance.internal.connection",
              },
            ],
          },
          {
            name: "endevorFirst",
            libs: [
              {
                environment: "ENV",
                stage: "1",
                system: "SYSTEM",
                subsystem: "SUBSYTEM",
                type: "COPY",
                profile: "instance.internal.connection",
              },
              { dataset: "PROCGRP.COPYBOOKS", profile: "pg_profile" },
              {
                environment: "ENV",
                stage: "1",
                system: "OTHER",
                subsystem: "SUBSYTEM",
                type: "COPY",
                profile: "instance.internal.connection",
              },
            ],
          },
          {
            name: "localFirst",
            libs: [
              "local/copybooks",
              { dataset: "PROCGRP.COPYBOOKS", profile: "pg_profile" },
            ],
          },
          {
            name: "invalidProfile",
            libs: [
              {
                environment: "ENV",
                stage: "1",
                system: "SYSTEM",
                subsystem: "SUBSYTEM",
                type: "COPY",
                profile: "invalid_profile",
              },
            ],
          },
        ];
        programConfigs = {
          pgms: [
            {
              program: "/test.cbl",
              pgroup: "group",
            },
            {
              program: "/dataset.cbl",
              pgroup: "datasetFirst",
            },
            {
              program: "/endevor.cbl",
              pgroup: "endevorFirst",
            },
            {
              program: "/local.cbl",
              pgroup: "localFirst",
            },
            {
              program: "/invalid-profile.cbl",
              pgroup: "invalidProfile",
            },
          ],
        };
        jest
          .spyOn(ProcessorGroupLoader, "readProcessorGroupsFileContent")
          .mockResolvedValue(processorGroups);
        jest
          .spyOn(ProcessorGroupLoader, "readProgramConfigFileContent")
          .mockResolvedValue(programConfigs);

        findFilesSpy = jest
          .spyOn(vscode.workspace, "findFiles")
          .mockResolvedValue(findFilesSpyResult);

        localCopybooks.clearCache();

        workspaceConfigurationMock = {
          "copybook-extensions": [".cpy"],
          [PATHS_LOCAL_KEY]: ["copybooks"],
        };
      });

      describe("resolve local processor group copybooks", () => {
        beforeAll(() => {
          findFilesSpyResult = [
            vscode.Uri.parse(
              "file:///workspace/local/pg/copybooks/COPYBOOK.cpy",
            ),
          ];
        });
        it("return local copybook uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
          );
          const result = await cds.resolveCopybookURI(
            "file:///test.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(findFilesSpy).toHaveBeenCalledWith({
            baseUri: vscode.Uri.file("/workspace/local/pg/copybooks"),
            pattern: "*",
          });

          expect(result).toEqual(
            "file:///workspace/local/pg/copybooks/COPYBOOK.cpy",
          );
        });
      });

      describe("resolve dsn zowe copybooks in processor group", () => {
        beforeAll(() => {
          findFilesSpyResult = [];
        });

        beforeAll(() => {
          readDirectoryResult["/pg_profile/PROCGRP.COPYBOOKS"] = ["COPYBOOK"];
        });

        it("return zowe dsn copybook uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            "file:///test.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual(
            "zowe-ds:/pg_profile/PROCGRP.COPYBOOKS/COPYBOOK.cpy",
          );
        });
      });

      describe("resolve uss processor in group copybooks", () => {
        beforeAll(() => {
          findFilesSpyResult = [];
          readDirectoryResult["/pg_profile/PROCGRP.COPYBOOKS"] = [];
          readDirectoryResult["/pg_profile/uss/procgrp/copybooks"] = [
            { name: "COPYBOOK.cpy", mode: "-" },
          ];
        });

        it("return zowe uss copybook uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            "file:///test.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual(
            "zowe-uss:/pg_profile/uss/procgrp/copybooks/COPYBOOK.cpy",
          );
        });
      });

      describe("resolve endevor element in processor group", () => {
        let e4eMock: E4E;

        beforeEach(() => {
          e4eMock = {
            isEndevorElement: jest.fn().mockResolvedValue(true),
            getProfileInfo: jest.fn().mockResolvedValue({
              profile: "profile",
              instance: "instance",
            }),
            listElements: jest.fn().mockResolvedValue([["COPYBOOK", "12345"]]),
            getElement: jest.fn().mockResolvedValue([""]),
            listMembers: jest.fn().mockResolvedValue([]),
            getMember: jest.fn().mockResolvedValue([]),
            getConfiguration: jest.fn().mockResolvedValue({
              pgms: [{ pgroup: "pgroup" }],
              pgroups: [
                {
                  name: "pgroup",
                  libs: [{ dataset: "ENDEVOR.DATASET.COPYBOOK" }],
                },
              ],
            }),
            onDidChangeElement: jest.fn(),
          };
          jest
            .spyOn(vscode.workspace.fs, "stat")
            .mockRejectedValue(new FileNotFound());
        });

        it("return local endevor cache copybook uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            "file:///endevor.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual(
            "file:///globalStorage/e4e/copybooks/instance.profile/ENV/1/SYSTEM/SUBSYTEM/COPY/MAP/COPYBOOK",
          );

          // only first matching element from concatenation is downloaded
          expect(e4eMock.getElement).toHaveBeenCalledTimes(1);
        });

        it("doesnt resolve endevor copybook if invalid profile is specified in processor group", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            undefined,
            e4eMockInvalidProfile,
          );

          const result = await cds.resolveCopybookURI(
            "file:///invalid-profile.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(result).toBeUndefined();
        });

        it("logs the error if copybook download fails", async () => {
          const getElement = jest.fn().mockRejectedValue("error");
          const outputChannel = vscode.window.createOutputChannel("log");

          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            { ...e4eMock, getElement },
            outputChannel,
          );

          await cds.resolveCopybookURI(
            "file:///endevor.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(outputChannel.appendLine).toHaveBeenCalledWith(
            expect.stringContaining(
              "Error while downloading copybook from Endevor",
            ),
          );
        });
      });

      describe("copybooks search respects processor group definitions order", () => {
        beforeEach(() => {
          readDirectoryResult["/pg_profile/PROCGRP.COPYBOOKS"] = ["COPYBOOK"];
        });

        it("datasetFirst group -> resolves to dataset uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            vscode.Uri.file("/dataset.cbl").toString(),
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(result).toEqual(
            "zowe-ds:/pg_profile/PROCGRP.COPYBOOKS/COPYBOOK.cpy",
          );
        });

        it("endevorFirst group -> resolves to endevor uri", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            vscode.Uri.file("/endevor.cbl").toString(),
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(result).toEqual(
            expect.stringMatching(
              "file:///globalStorage/e4e/copybooks/instance.profile/ENV/1/SYSTEM/SUBSYTEM/COPY/MAP/COPYBOOK",
            ),
          );
        });

        it("resolves to local copybook uri", async () => {
          findFilesSpyResult = [
            vscode.Uri.parse(
              "file:///workspace/local/pg/copybooks/COPYBOOK.cpy",
            ),
          ];
          findFilesSpy = jest
            .spyOn(vscode.workspace, "findFiles")
            .mockResolvedValue(findFilesSpyResult);

          const cds = new CopybookDownloadService(
            vscode.Uri.file("/globalStorage"),
            zoweExplorerMock,
            e4eMock,
          );
          const result = await cds.resolveCopybookURI(
            vscode.Uri.file("/local.cbl").toString(),
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(result).toEqual(
            "file:///workspace/local/pg/copybooks/COPYBOOK.cpy",
          );
        });
      });

      describe("if processor group configuration is available, vscode settings is not used", () => {
        beforeAll(() => {
          findFilesSpyResult = [];
        });

        it("in processor group - searches the processor group only", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/storage-path"),
          );
          await cds.resolveCopybookURI(
            "file:///test.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );
          expect(findFilesSpy).toHaveBeenCalledWith({
            baseUri: vscode.Uri.file("/workspace/local/pg/copybooks"),
            pattern: "*",
          });
          expect(findFilesSpy).not.toHaveBeenCalledWith({
            baseUri: vscode.Uri.file("/workspace/copybooks"),
            pattern: "*",
          });
        });

        it("not in pg group -> resolves to copybook just from vscode configuration", async () => {
          const cds = new CopybookDownloadService(
            vscode.Uri.file("/storage-path"),
          );
          await cds.resolveCopybookURI(
            "file:///not_processor_group.cbl",
            "COPYBOOK",
            DEFAULT_DIALECT,
          );

          expect(findFilesSpy).toHaveBeenCalledWith({
            baseUri: expect.objectContaining({
              path: "/workspace/copybooks",
              scheme: "file",
            }) as vscode.Uri,
            pattern: "*",
          });
        });
      });
    });

    describe("With both local and zowe locations defined in the settings.json, the search is applied on local resources first", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-local": ["copybooks"],
          "paths-dsn": ["DATASET.WITH.COPYBOOKS"],
          "copybook-extensions": [".CPY", ".cpy"],
        };
        profileName = "profile";
        jest
          .spyOn(vscode.workspace, "findFiles")
          .mockResolvedValue([
            vscode.Uri.parse("file:///workspace/copybooks/COPYBOOK.cpy"),
          ]);
        localCopybooks.clearCache();
      });

      it("return local copybook uri", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );
        const result = await cds.resolveCopybookURI(
          "file:///test.cbl",
          "COPYBOOK",
          DEFAULT_DIALECT,
        );

        expect(result).toEqual("file:///workspace/copybooks/COPYBOOK.cpy");
      });
    });

    describe("DSN has priority over USS", () => {
      beforeEach(() => {
        workspaceConfigurationMock = {
          "paths-local": [],
          "paths-dsn": ["DATASET.WITH.COPYBOOKS"],
          "paths-uss": ["/user/copybooks"],
          "copybook-extensions": [".CPY", ".cpy"],
        };
        profileName = "profile";
        readDirectoryResult["/profile/DATASET.WITH.COPYBOOKS"] = ["COPYBOOK"];
        readDirectoryResult["/profile/user/copybooks"] = ["COPYBOOK"];
      });

      it("return dsn copybook uri", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );
        const result = await cds.resolveCopybookURI(
          "file:///test.cbl",
          "COPYBOOK",
          DEFAULT_DIALECT,
        );

        expect(result).toEqual(
          "zowe-ds:/profile/DATASET.WITH.COPYBOOKS/COPYBOOK.cpy",
        );
      });
    });

    describe("the order of resolution is same as the one provided in user settings", () => {
      beforeAll(() => {
        workspaceConfigurationMock = {
          [PATHS_DSN]: ["FIRST.DATASET", "SECOND.DATASET"],
        };
        profileName = "profile";
      });
      it("checks the order of resolution is same as the one provided in user settings", async () => {
        const cds = new CopybookDownloadService(
          vscode.Uri.file("/globalStorage"),
          zoweExplorerMock,
        );

        await cds.resolveCopybookURI(
          "file:///test.cbl",
          "COPYBOOK",
          DEFAULT_DIALECT,
        );

        expect(vscode.workspace.fs.readDirectory).toHaveBeenNthCalledWith(
          1,
          vscode.Uri.parse("zowe-ds:/profile/FIRST.DATASET"),
        );
        expect(vscode.workspace.fs.readDirectory).toHaveBeenNthCalledWith(
          2,
          vscode.Uri.parse("zowe-ds:/profile/SECOND.DATASET"),
        );
      });
    });
  });
});
