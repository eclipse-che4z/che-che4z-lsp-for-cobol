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
  E4E_FOLDER,
  ENDEVOR_PROCESSOR,
  ENVIRONMENT,
  PROVIDE_PROFILE_MSG,
  PROVIDE_PROFILE_MSG_PROC_GRUOPS,
  USE_MAP,
  USS,
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
import { loadProcessorGroupCopybookPathsConfig } from "../ProcessorGroups";
import {
  EndevorConfigModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "../ProcessorGroupsLoader";
import { DownloadDiagnosticsService } from "../DiagnosticsService";

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

    const pgConfigs = (
      await loadProcessorGroupCopybookPathsConfig({ scopeUri: documentUri }, [])
    ).filter((config) => typeof config != "string");

    if (pgConfigs.length > 0) {
      return await this.downloadCopybooksinProcessorGroups(
        copybookName,
        documentUri,
        pgConfigs,
      );
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
  clearProfiles() {
    this.e4eDownloader?.clearProfiles();
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
        typeof path === "object" && path.profile
          ? path.profile
          : ProfileUtils.getProfileNameForCopybook(
              documentUri,
              this.explorerApi,
            );
      if (profile) {
        const extensions =
          await SettingsService.getCopybookExtension(documentUri);
        const success =
          downloader instanceof CopybookDownloaderForDsn
            ? await downloader.downloadCopybook(copybook, p, profile)
            : await downloader.downloadCopybook(
                copybook,
                p,
                profile,
                extensions ? extensions : [""],
              );
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
    const pgConfigs = await loadProcessorGroupCopybookPathsConfig(
      { scopeUri: documentUri },
      [],
    );
    if (pgConfigs.length > 0) {
      return (
        await searchCopybookinProcessorGroups(
          documentUri,
          copybookName,
          this.storagePath,
          pgConfigs,
          this.e4eDownloader,
          this.dsnDownloader,
          this.ussDownloader,
        )
      )?.toString();
    }

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
    private diagnosticsService?: DownloadDiagnosticsService,
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
    this.diagnosticsService?.clearDiagnostics();
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
    this.diagnosticsService?.clearDiagnostics();
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

    if (
      !(await this.isPrerequisiteForDownloadSatisfied(documentUri, [dialect]))
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

    const copybooks: string[] = [];
    const dsnPaths: string[] = SettingsService.getDsnPath(documentUri, dialect);
    const ussPaths: string[] = SettingsService.getUssPath(documentUri, dialect);

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
        this.outputChannel?.appendLine(
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

    const profile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerApi,
    );
    const configs = await loadProcessorGroupCopybookPathsConfig(
      { scopeUri: documentUri },
      [],
    );
    if (
      await this.isProcessorGroupConfigsSatisfiesDownload(
        documentUri,
        profile,
        configs,
      )
    )
      return true;

    if (configs.length > 0) return false;

    if (!this.explorerApi) {
      return false;
    }
    const availableProfiles = ProfileUtils.getAvailableProfiles(
      this.explorerApi,
    );

    const copybooksLocation =
      DownloadUtil.areCopybookDownloadConfigurationsPresent(
        documentUri,
        dialects,
      );

    if (!copybooksLocation) {
      return false;
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
        copybooksLocation,
      ))
    );
  }
  private missingExtension(documentUri: string, message: string) {
    this.diagnosticsService?.showDiagnostics(vscode.Uri.parse(documentUri), [
      {
        range: new vscode.Range(
          new vscode.Position(0, 0),
          new vscode.Position(1, 0),
        ),
        message: message,
        severity: vscode.DiagnosticSeverity.Warning,
      },
    ]);
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
    pgConfigs: (
      | ZoweDatasetConfigModel
      | ZoweUssConfigModel
      | EndevorConfigModel
    )[],
  ): Promise<boolean> {
    try {
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
        } else if (USS in config && this.ussDownloader) {
          const ussSuccess = await this.downloadFromPaths(
            this.ussDownloader,
            copybookName,
            documentUri,
            [
              {
                path: config.uss,
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
            use_map: config.use_map === false ? false : true,
            environment: config.environment,
            stage: config.stage,
            system: config.system,
            subsystem: config.subsystem,
            type: config.type,
            element: copybookName.name.toUpperCase(),
            fingerprint: "",
          };
          if (
            resolvedProfile &&
            (await this.e4eDownloader.hasElement(
              resolvedProfile,
              element,
              copybookName.name,
            )) &&
            (await this.e4eDownloader?.downloadElementE4E(
              resolvedProfile,
              element,
            ))
          )
            return true;
        }
      }
    } catch (error) {
      this.outputChannel?.appendLine(getErrorMessage(error));
      return false;
    }
    return false;
  }

  public reenableFailedRequests() {
    this.dsnDownloader?.reenableFailedRequests();
    this.ussDownloader?.reenableFailedRequests();
  }
  private async isProcessorGroupConfigsSatisfiesDownload(
    documentUri: string,
    defaultProfile: string | undefined,
    configs: (
      | string
      | ZoweDatasetConfigModel
      | ZoweUssConfigModel
      | EndevorConfigModel
    )[],
  ) {
    const procGroupZoweConfigs = configs.filter(
      (config): config is ZoweUssConfigModel | ZoweDatasetConfigModel =>
        typeof config != "string" && (DATASET in config || USS in config),
    );

    const endevorConfigs = configs.filter(
      (config): config is EndevorConfigModel =>
        typeof config != "string" && ENVIRONMENT in config,
    );

    if (configs.length == 0) return false;

    if (endevorConfigs.length > 0 && !this.e4eApi) {
      this.missingExtension(
        documentUri,
        "Explorer for Endevor is not installed",
      );
      return false;
    }
    if (!this.explorerApi && procGroupZoweConfigs.length > 0) {
      this.missingExtension(documentUri, "Zowe Explorer is not installed");
      return false;
    }
    if (!this.explorerApi) return endevorConfigs.length > 0;
    const availableProfiles = ProfileUtils.getAvailableProfiles(
      this.explorerApi,
    );
    if (procGroupZoweConfigs && procGroupZoweConfigs.length > 0) {
      if (await this.isZoweProfilesLocked(procGroupZoweConfigs, defaultProfile))
        return false;
      if (
        await this.isZoweProfilesValid(
          procGroupZoweConfigs,
          defaultProfile,
          availableProfiles,
        )
      )
        return true;
    }

    return endevorConfigs.length > 0;
  }
  private async isZoweProfilesValid(
    procGroupZoweConfigs: (ZoweDatasetConfigModel | ZoweUssConfigModel)[],
    defaultProfile: string | undefined,
    availableProfiles: string[],
  ): Promise<boolean> {
    if (!this.explorerApi) return false;
    for (const zoweConfig of procGroupZoweConfigs) {
      const tempProfile = zoweConfig.profile
        ? zoweConfig.profile
        : defaultProfile;

      if (!tempProfile || !availableProfiles.includes(tempProfile)) {
        const msg = `${PROVIDE_PROFILE_MSG_PROC_GRUOPS} Provided invalid profile name: ${zoweConfig.profile}`;
        vscode.window.showErrorMessage(msg);
        return false;
      } else {
        if (
          await DownloadUtil.checkForInvalidCredProfile(
            tempProfile,
            this.explorerApi,
            DATASET in zoweConfig
              ? { dsn: zoweConfig.dataset }
              : { uss: zoweConfig.uss },
          )
        )
          return false;
      }
    }
    return true;
  }
  private async isZoweProfilesLocked(
    procGroupZoweConfigs: (ZoweDatasetConfigModel | ZoweUssConfigModel)[],
    defaultProfile: string | undefined,
  ): Promise<boolean> {
    const uniqueProfiles = Array.from(
      new Set(
        procGroupZoweConfigs
          .map((item) => item.profile)
          .filter((element) => element != undefined),
      ),
    );
    if (defaultProfile && !uniqueProfiles.find((x) => x === defaultProfile))
      uniqueProfiles.push(defaultProfile);

    for (const profileCheck of uniqueProfiles) {
      if (await DownloadUtil.isProfileLocked(profileCheck)) return true;
    }
    return false;
  }
}
async function searchCopybookinProcessorGroups(
  documentUri: string,
  copybookName: string,
  storagePath: string,
  pgConfigs: (
    | string
    | ZoweDatasetConfigModel
    | ZoweUssConfigModel
    | EndevorConfigModel
  )[],
  e4eDownloader?: CopybookDownloaderForE4E,
  dsnDownloader?: CopybookDownloaderForDsn,
  ussDownloader?: CopybookDownloaderForUss,
): Promise<vscode.Uri | undefined> {
  let result: vscode.Uri | undefined;

  for (const config of pgConfigs) {
    let shouldFound = false;
    let folders: string = "";
    let extensions: string[] | undefined;
    if (typeof config === "string") {
      folders = config;
      extensions = await SettingsService.getCopybookExtension(documentUri);
    } else if (ENVIRONMENT in config) {
      if (!e4eDownloader) continue;
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
      extensions = [""];
    } else if (DATASET in config) {
      const profile = config.profile
        ? config.profile
        : SettingsService.getProfileName();
      if (!profile) continue;
      const has = await dsnDownloader?.hasMember(
        profile,
        config.dataset,
        copybookName,
      );
      if (!has) continue;
      folders = CopybookURI.createDatasetPath(
        [profile],
        config.dataset,
        storagePath,
      ).fsPath;
      shouldFound = true;
      extensions = [""];
    } else if (USS in config) {
      const profile = config.profile
        ? config.profile
        : SettingsService.getProfileName();
      if (!profile) continue;
      extensions = await SettingsService.getCopybookExtension(documentUri);
      const has = await ussDownloader?.hasMember(
        profile,
        config.uss,
        copybookName,
        extensions,
      );
      if (!has) continue;
      folders = CopybookURI.createDatasetPath(
        [profile],
        config.uss,
        storagePath,
      ).fsPath;
      shouldFound = true;
    }

    result = searchCopybookInExtensionFolder(
      copybookName,
      folders ? [folders] : [],
      extensions,
      storagePath,
    );

    if (result || shouldFound) return result;
  }
}
