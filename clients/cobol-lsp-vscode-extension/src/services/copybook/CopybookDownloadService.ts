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

import * as vscode from "vscode";
import {
  COPYBOOKS_FOLDER,
  DATASET,
  DEFAULT_DIALECT,
  E4E_FOLDER,
  ENDEVOR_PROCESSOR,
  ENVIRONMENT,
  PROVIDE_PROFILE_MSG,
  PROVIDE_PROFILE_MSG_PROC_GRUOPS,
  USE_MAP,
  USSFILE,
  ZOWE_FOLDER,
} from "../../constants";
import { ProfileUtils } from "../util/ProfileUtils";
import { DownloadUtil } from "./downloader/DownloadUtil";
import { E4E, EndevorElement } from "../../type/e4eApi";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./downloader/CopybookDownloaderForUss";
import { CopybookDownloaderForDsn } from "./downloader/CopybookDownloaderForDsn";
import { SettingsService } from "../Settings";
import { searchCopybook } from "./CopybookMessageHandler";
import { searchCopybookInExtensionFolder } from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import path = require("path");
import { getErrorMessage } from "../util/ErrorsUtils";
import { DialectRegistry } from "../DialectRegistry";
import { getChannel } from "../../extension";
import { loadProcessorGroupCopybookPathsConfig } from "../ProcessorGroups";
import {
  EndevorConfigModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "../ProcessorGroupsLoader";

export class CopybookName {
  constructor(
    public name: string,
    public dialect: string,
  ) {}
}

export class CopybookDownloadService {
  private explorerApi: IApiRegisterClient | undefined;
  private e4eApi: E4E | undefined;
  private dsnDownloader?: CopybookDownloaderForDsn;
  private ussDownloader?: CopybookDownloaderForUss;
  private e4eDownloader?: CopybookDownloaderForE4E;

  /**
   * Downloads a file using E4E Api or Zowe Explorer Api based on provided configuration
   *
   * @param copybookName Copybook to be downloaded.
   * @param documentUri cobol programs which needs copybook
   * @param callback callback function
   */
  async downloadCopybook(
    copybookName: CopybookName,
    documentUri: string,
  ): Promise<boolean> {
    if (
      this.handleAsEndevorElement(documentUri) &&
      (await this.e4eDownloader?.downloadCopybookE4E(documentUri, copybookName))
    ) {
      return true;
    }
    try {
      const res = await this.downloadCopybooksinProcessorGroups(
        copybookName,
        documentUri,
      );
      if (res) return res;
    } catch (_error) {
      return false;
    }

    if (this.dsnDownloader) {
      const dsnSuccess = await this.downloadFromPaths(
        this.dsnDownloader,
        copybookName,
        documentUri,
        SettingsService.getDsnPath(documentUri, copybookName.dialect),
      );
      if (dsnSuccess) return true;
    }

    if (this.ussDownloader) {
      return this.downloadFromPaths(
        this.ussDownloader,
        copybookName,
        documentUri,
        SettingsService.getUssPath(documentUri, copybookName.dialect),
      );
    }

    return false;
  }

  /**
   * Clears downloaders cache
   */
  clearCache() {
    this.dsnDownloader?.clearMemberListCache();
    this.ussDownloader?.clearMemberListCache();
    this.e4eDownloader?.clearConfigs();
    this.e4eDownloader?.clearProfiles();
    this.dsnDownloader?.clearZoweDownloadQueue();
    this.ussDownloader?.clearZoweDownloadQueue();
  }

  private async downloadFromPaths(
    downloader: CopybookDownloaderForDsn | CopybookDownloaderForUss,
    copybook: CopybookName,
    documentUri: string,
    paths: string[] | { path: string; profile?: string }[] | undefined,
  ): Promise<boolean> {
    if (!paths) return false;

    for (const path of paths) {
      const p = typeof path === "object" ? path.path : path;
      const profile =
        typeof path === "object"
          ? path.profile
          : ProfileUtils.getProfileNameForCopybook(
              documentUri,
              this.explorerApi,
            );
      if (profile) {
        const success = await downloader.downloadCopybook(copybook, p, profile);
        if (success) return true;
      }
    }

    return false;
  }

  private handleAsEndevorElement(documentUri: string) {
    return (
      SettingsService.getCopybookEndevorDependencySettings() ===
        ENDEVOR_PROCESSOR && this.e4eApi?.isEndevorElement(documentUri)
    );
  }

  public makeResolveCopybookHandler() {
    return this.resolveCopybookHandler.bind(this);
  }

  public makeCopybookDownloadHandler() {
    return (
      cobolFileName: string,
      copybookNames: CopybookName[],
      _quietMode: boolean,
    ) => {
      return this.downloadCopybooks(cobolFileName, copybookNames);
    };
  }

  public async resolveCopybookHandler(
    documentUri: string,
    copybookName: string,
    dialectType: string,
  ): Promise<string | undefined> {
    if (this.handleAsEndevorElement(documentUri)) {
      const copybookUri = await this.e4eDownloader?.getE4ECopyBookLocation(
        copybookName,
        documentUri,
      );
      return copybookUri?.toString();
    }
    const procGroupResult = await searchCopybookinProcessorGroups(
      documentUri,
      copybookName,
      this.storagePath,
      this.e4eDownloader,
      this.dsnDownloader,
      this.ussDownloader,
    );
    if (procGroupResult && typeof procGroupResult != "boolean")
      return procGroupResult.toString();
    else if (procGroupResult) return;

    const result = await searchCopybook(
      documentUri,
      copybookName,
      dialectType,
      this.storagePath,
    );
    if (result) {
      return result.toString();
    }

    // check in subfolders under copybooks (copybook downloaded from MF)
    return searchCopybookInExtensionFolder(
      copybookName,
      CopybookURI.createPathForCopybookDownloaded(
        documentUri,
        dialectType,
        path.join(this.storagePath, ZOWE_FOLDER, COPYBOOKS_FOLDER),
        this.explorerApi,
      ),
      await SettingsService.getCopybookExtension(documentUri),
      this.storagePath,
    )?.toString();
  }

  constructor(
    private storagePath: string,
    explorer?: IApiRegisterClient,
    e4e?: E4E,
    private outputChannel?: vscode.OutputChannel,
  ) {
    if (e4e) this.e4eAppeared(e4e);
    if (explorer) this.explorerAppeared(explorer);
  }

  public e4eAppeared(api: E4E) {
    this.e4eApi = api;
    this.e4eDownloader = new CopybookDownloaderForE4E(
      this.storagePath,
      this.e4eApi,
      this.outputChannel,
    );
  }

  public explorerAppeared(api: IApiRegisterClient) {
    this.explorerApi = api;
    this.ussDownloader = new CopybookDownloaderForUss(
      this.storagePath,
      this.explorerApi,
    );
    this.dsnDownloader = new CopybookDownloaderForDsn(
      this.storagePath,
      this.explorerApi,
    );
  }

  public async downloadCopybooks(
    documentUri: string,
    copybookNames: CopybookName[],
  ): Promise<void> {
    if (
      !(await this.isPrerequisiteForDownloadSatisfied(
        documentUri,
        copybookNames.map((copybook) => copybook.dialect),
      ))
    ) {
      return;
    }
    await vscode.window.withProgress(
      {
        location: vscode.ProgressLocation.Notification,
        title: "Fetching copybooks",
      },
      async (
        progress: vscode.Progress<{ message?: string; increment?: number }>,
      ) => {
        await this.processCopybookDownload(
          progress,
          documentUri,
          copybookNames,
        );
      },
    );
  }

  public async listRemoteCopybooks(
    documentUri: string,
    dialect: string,
  ): Promise<string[]> {
    // is document is endevor element - return list of copybooks from endevor
    if (this.handleAsEndevorElement(documentUri)) {
      return this.e4eDownloader?.listRemoteCopybooksE4E(documentUri) ?? [];
    }

    const dialects = [
      DEFAULT_DIALECT,
      ...DialectRegistry.getActiveDialects().map((di) => di.name),
    ];

    const copybooks: string[] = [];

    const dsnPaths: string[] = SettingsService.getDsnPath(documentUri, dialect);
    const ussPaths: string[] = SettingsService.getUssPath(documentUri, dialect);

    if (dsnPaths.length === 0 && ussPaths.length === 0) {
      return [];
    }

    if (
      !(await this.isPrerequisiteForDownloadSatisfied(documentUri, dialects))
    ) {
      return [];
    }

    const profile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerApi,
    );
    if (!profile) {
      return [];
    }

    const results = await Promise.allSettled([
      ...dsnPaths.map(async (dsn) => {
        const dsnMembers = await this.dsnDownloader?.getAllMembers(
          profile,
          dsn,
        );
        return dsnMembers ?? [];
      }),
      ...ussPaths.map(async (uss) => {
        const ussFiles = await this.ussDownloader?.getAllMembers(
          profile,
          uss,
          false,
        );
        return ussFiles ?? [];
      }),
    ]);

    results.forEach((result) => {
      if (result.status === "fulfilled") {
        result.value.forEach((c) => copybooks.push(c));
      } else {
        getChannel().appendLine(
          `Unable to load copybooks completions. ${result.reason}`,
        );
      }
    });

    return copybooks;
  }

  private async processCopybookDownload(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    documentUri: string,
    copybookNames: CopybookName[],
  ): Promise<void> {
    const totalCopybooksToDownload = copybookNames.length;
    let processedCopybooks = 0;
    const downloadRequestStartTime = performance.now();
    await Promise.all(
      copybookNames.map(async (copybookName) => {
        await this.downloadCopybook(copybookName, documentUri)
          .then((isDownloaded) => {
            if (isDownloaded) {
              this.outputChannel?.appendLine(
                `==> Copybook ${copybookName.name}(dialect:${copybookName.dialect}) download completed in : ${performance.now() - downloadRequestStartTime} milliseconds`,
              );
            } else {
              this.outputChannel?.appendLine(
                `==> Copybook ${copybookName.name}(dialect:${copybookName.dialect}) failed in ${performance.now() - downloadRequestStartTime} milliseconds`,
              );
            }
          })
          .catch((err) => {
            this.outputChannel?.appendLine(
              `==> Copybook ${copybookName.name}(dialect:${copybookName.dialect}) couldn't be downloaded. Time: ${performance.now() - downloadRequestStartTime} milliseconds , Error: ${err}`,
            );
          })
          .finally(() => {
            processedCopybooks++;
            this.updateDownloadProgress(
              progress,
              totalCopybooksToDownload,
              processedCopybooks,
            );
          });
      }),
    ).catch((err) => {
      this.outputChannel?.appendLine(
        `Error downloading copybooks : ${getErrorMessage(err)}`,
      );
    });
  }

  private async isPrerequisiteForDownloadSatisfied(
    documentUri: string,
    dialects: string[],
  ): Promise<boolean> {
    if (this.handleAsEndevorElement(documentUri)) {
      return !!(await this.e4eDownloader?.getE4EConfig(documentUri));
    }
    if (!this.explorerApi && !this.e4eApi) return false;

    const configs = await loadProcessorGroupCopybookPathsConfig(
      { scopeUri: documentUri },
      [],
    );

    const procGroupZoweProfiles = new Set(
      configs
        .filter(
          (config): config is ZoweUssConfigModel | ZoweDatasetConfigModel =>
            typeof config != "string" &&
            (DATASET in config || USSFILE in config),
        )
        .map((dsn) => dsn.profile)
        .filter((x) => typeof x == "string"),
    );
    const endevorProfiles = new Set(
      configs.filter(
        (config): config is EndevorConfigModel =>
          typeof config != "string" && ENVIRONMENT in config,
      ),
    );

    const profile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerApi,
    );
    if (this.explorerApi) {
      const availableProfiles = ProfileUtils.getAvailableProfiles(
        this.explorerApi,
      );

      if (procGroupZoweProfiles && procGroupZoweProfiles.size > 0) {
        const checks: boolean[] = [];
        for (const profile of procGroupZoweProfiles) {
          if (!availableProfiles.includes(profile)) {
            checks.push(true);
            const msg = `${PROVIDE_PROFILE_MSG_PROC_GRUOPS} Provided invalid profile name: ${profile}`;
            vscode.window.showErrorMessage(msg);
          } else {
            checks.push(await DownloadUtil.isProfileLocked(profile));
            checks.push(
              await DownloadUtil.checkForInvalidCredProfile(
                profile,
                this.explorerApi,
                documentUri,
                dialects,
              ),
            );
          }
        }
        return checks.every((v) => v === false);
      }
      if (!profile || !availableProfiles.includes(profile)) {
        const message = profile
          ? `${PROVIDE_PROFILE_MSG} Provided invalid profile name: ${profile}`
          : `${PROVIDE_PROFILE_MSG}`;
        this.processDownloadError(message);
        return false;
      }
      return (
        !(await DownloadUtil.isProfileLocked(profile)) &&
        !(await DownloadUtil.checkForInvalidCredProfile(
          profile,
          this.explorerApi,
          documentUri,
          dialects,
        ))
      );
    }
    if (Array.isArray(endevorProfiles) && endevorProfiles.length > 0)
      return true;
    return false;
  }

  private processDownloadError(title: string): void {
    const actionSettings = "Change settings";
    vscode.window.showErrorMessage(title, actionSettings).then((action) => {
      if (action === actionSettings) {
        vscode.commands.executeCommand("cobol-lsp.cpy-manager.goto-settings");
      }
    });
  }

  private updateDownloadProgress(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    totalDownload: number,
    completedDownload: number,
  ): void {
    const downloadPercent = Math.round(
      (completedDownload / totalDownload) * 100,
    );
    progress.report({
      increment: downloadPercent,
      message: downloadPercent + "%",
    });
  }
  async downloadCopybooksinProcessorGroups(
    copybookName: CopybookName,
    documentUri: string,
  ): Promise<boolean> {
    const pgConfigs = (
      await loadProcessorGroupCopybookPathsConfig({ scopeUri: documentUri }, [])
    ).filter((config) => typeof config != "string");
    if (!(Array.isArray(pgConfigs) && pgConfigs.length > 0)) {
      return false;
    }
    for (const config of pgConfigs) {
      if (DATASET in config && this.dsnDownloader) {
        const dsnSuccess = await this.downloadFromPaths(
          this.dsnDownloader,
          copybookName,
          documentUri,
          [
            {
              path: config.dataset,
              profile: config.profile ? config.profile : undefined,
            },
          ],
        );
        if (dsnSuccess) return true;
      } else if (USSFILE in config && this.ussDownloader) {
        const ussSuccess = await this.downloadFromPaths(
          this.ussDownloader,
          copybookName,
          documentUri,
          [
            {
              path: config.ussFile,
              profile: config.profile ? config.profile : undefined,
            },
          ],
        );
        if (ussSuccess) return true;
      } else if (ENVIRONMENT in config && this.e4eDownloader) {
        const resolvedProfile = await this.e4eDownloader.getProfileInfo(
          config.profile,
        );
        const element: EndevorElement = {
          use_map: config.use_map ? config.use_map : true,
          environment: config.environment,
          stage: config.stage,
          system: config.system,
          subsystem: config.subsystem,
          type: config.type,
          element: copybookName.name,
          fingerprint: "",
        };
        if (
          resolvedProfile &&
          (await this.e4eDownloader?.downloadElementE4E(
            resolvedProfile,
            element,
          ))
        )
          return true;
      }
    }
    return false;
  }

  public reenableFailedRequests() {
    this.dsnDownloader?.reenableFailedRequests();
    this.ussDownloader?.reenableFailedRequests();
  }
}
async function searchCopybookinProcessorGroups(
  documentUri: string,
  copybookName: string,
  storagePath: string,
  e4eDownloader?: CopybookDownloaderForE4E,
  dsnDownloader?: CopybookDownloaderForDsn,
  ussDownloader?: CopybookDownloaderForUss,
): Promise<boolean | vscode.Uri> {
  let result: vscode.Uri | undefined;
  const pgConfigs = await loadProcessorGroupCopybookPathsConfig(
    { scopeUri: documentUri },
    [],
  );
  let shouldFound = false;

  for (const config of pgConfigs) {
    let folders: string = "";
    if (typeof config === "string") {
      folders = config;
    } else if (
      typeof config === "object" &&
      ENVIRONMENT in config &&
      e4eDownloader
    ) {
      const endevorType = DownloadUtil.endevorConfigToType(config);
      const profile = await e4eDownloader.getProfileInfo(config.profile);
      if (!profile) continue;
      const has = await e4eDownloader.hasElement(
        profile,
        endevorType,
        copybookName,
      );
      if (!has) continue;
      folders = CopybookURI.createDatasetPath(
        CopybookURI.getEnviromentPath(endevorType, profile),
        endevorType.use_map ? USE_MAP : "",
        storagePath,
        E4E_FOLDER,
      ).fsPath;
      shouldFound = true;
    } else if (typeof config === "object" && DATASET in config) {
      const has = await dsnDownloader?.hasMember(
        config.profile ? config.profile : SettingsService.getProfileName()!,
        config.dataset,
        copybookName,
      );
      if (!has) continue;
      folders = CopybookURI.createDatasetPath(
        config.profile ? [config.profile] : [SettingsService.getProfileName()!],
        config.dataset,
        storagePath,
      ).fsPath;
      shouldFound = true;
    } else if (typeof config === "object" && USSFILE in config) {
      const has = await ussDownloader?.hasMember(
        config.profile ? config.profile : SettingsService.getProfileName()!,
        config.ussFile,
        copybookName,
      );
      if (!has) continue;
      folders = CopybookURI.createDatasetPath(
        config.profile ? [config.profile] : [SettingsService.getProfileName()!],
        config.ussFile,
        storagePath,
      ).fsPath;
      shouldFound = true;
    }

    result = searchCopybookInExtensionFolder(
      copybookName,
      folders ? [folders] : [],
      await SettingsService.getCopybookExtension(documentUri),
      storagePath,
    );
    if (typeof config === "string" && !result) continue;

    if (result) return result;
    if (shouldFound) return true;
  }

  return false;
}
