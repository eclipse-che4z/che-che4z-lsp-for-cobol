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
  DATASET,
  DEFAULT_DIALECT,
  ENDEVOR_PROCESSOR,
  ENVIRONMENT,
  PROVIDE_PROFILE_MSG,
  PROVIDE_PROFILE_MSG_PROC_GRUOPS,
  USS,
} from "../../constants";
import { ProfileUtils } from "../util/ProfileUtils";
import { DownloadUtil } from "./downloader/DownloadUtil";
import { E4E, EndevorElement } from "../../type/e4eApi";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./downloader/CopybookDownloaderForUss";
import { CopybookDownloaderForDsn } from "./downloader/CopybookDownloaderForDsn";
import { SettingsService } from "../Settings";
import {
  loadProcessorGroupCopybookPathsConfig,
  ProcessorGroupCopybookPathConfig,
} from "../ProcessorGroups";
import {
  EndevorConfigModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "../ProcessorGroupsLoader";
import { DownloadDiagnosticsService } from "../DiagnosticsService";
import { localCopybooks, searchLocalCopybooks } from "./LocalCopybooksService";
import { getErrorMessage } from "../util/ErrorsUtils";

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
   * Clears downloaders cache
   */
  clearCache() {
    this.dsnDownloader?.clearMemberListCache();
    this.ussDownloader?.clearMemberListCache();
    this.e4eDownloader?.clearConfigs();
    this.e4eDownloader?.clearProfiles();
  }
  clearProfiles() {
    this.e4eDownloader?.clearProfiles();
  }

  clearE4EConfig(uri: string) {
    this.e4eDownloader?.clearInvalidConfig(uri);
  }

  private handleAsEndevorElement(documentUri: string) {
    return (
      SettingsService.getCopybookEndevorDependencySettings() ===
        ENDEVOR_PROCESSOR && this.e4eApi?.isEndevorElement(documentUri)
    );
  }

  public makeResolveCopybookUriHandler() {
    return this.resolveCopybookURI.bind(this);
  }

  async resolveCopybookURI(
    documentURI: string,
    copybookName: string,
    dialectType: string,
  ): Promise<string | undefined> {
    // is endevor -> download copybook from endevor and return local Uri
    if (this.handleAsEndevorElement(documentURI)) {
      const endevorResult = await this.e4eDownloader?.downloadCopybookE4E(
        documentURI,
        copybookName,
        dialectType,
      );

      return endevorResult?.toString();
    }
    // search processor groups
    const pgConfigs = await loadProcessorGroupCopybookPathsConfig(
      { scopeUri: documentURI },
      [],
      dialectType,
    );

    if (pgConfigs.length > 0) {
      const processorGroupsResult =
        await this.resolveCopybookUriInProcessorGroups(
          copybookName,
          documentURI,
          pgConfigs,
        );

      return processorGroupsResult?.toString();
    }

    // search paths-local -> return URI pointing to local file
    const localResult = await searchLocalCopybooks(
      documentURI,
      copybookName,
      dialectType,
    );
    if (localResult) {
      return localResult.toString();
    }
    // search paths-dsn & paths-uss -> return zowe URI
    const remoteResult = await this.searchRemoteCopybooks(
      documentURI,
      copybookName,
      dialectType,
    );
    if (remoteResult) {
      return remoteResult.toString();
    }
  }

  constructor(
    private storagePath: vscode.Uri,
    explorer?: IApiRegisterClient,
    e4e?: E4E,
    private outputChannel?: vscode.OutputChannel,
    private diagnosticsService?: DownloadDiagnosticsService,
    private configurationInvalidation?: () => unknown,
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
    this.ussDownloader = new CopybookDownloaderForUss(this.explorerApi);
    this.dsnDownloader = new CopybookDownloaderForDsn(this.explorerApi);
    this.diagnosticsService?.clearDiagnostics();
    if (this.explorerApi.onProfileUpdated) {
      this.explorerApi.onProfileUpdated((profile: IProfileLoaded) => {
        this.outputChannel?.appendLine(`Zowe profile ${profile.name} updated`);
        this.clearCache();
        if (this.configurationInvalidation) {
          this.configurationInvalidation();
        }
      });
    }
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
        const ussFiles = await this.ussDownloader?.getAllMembers(profile, uss);
        return ussFiles ?? [];
      }),
    ]);

    results.forEach((result) => {
      if (result.status === "fulfilled") {
        result.value.forEach((c) => copybooks.push(c.name));
      } else {
        this.outputChannel?.appendLine(
          `Unable to load copybooks completions. ${result.reason}`,
        );
      }
    });

    return copybooks;
  }

  async searchRemoteCopybooks(
    documentURI: string,
    copybookName: string,
    dialectType: string,
  ): Promise<vscode.Uri | undefined> {
    if (
      !(await this.isPrerequisiteForDownloadSatisfied(documentURI, [
        dialectType,
      ]))
    ) {
      return;
    }

    const profile = ProfileUtils.getProfileNameForCopybook(
      documentURI,
      this.explorerApi,
    );
    if (!profile) {
      return;
    }

    const dsnPaths: string[] = SettingsService.getDsnPath(
      documentURI,
      dialectType,
    );
    const ussPaths: string[] = SettingsService.getUssPath(
      documentURI,
      dialectType,
    );
    const results = await Promise.allSettled([
      ...dsnPaths.map((dsn) =>
        this.dsnDownloader?.resolveCopybookUri(profile, dsn, copybookName),
      ),
      ...ussPaths.map((uss) =>
        this.ussDownloader?.resolveCopybookUri(profile, uss, copybookName),
      ),
    ]);

    for (const result of results) {
      if (result.status === "fulfilled" && result.value) {
        return result.value;
      }
    }
  }

  async resolveCopybookUriInProcessorGroups(
    copybookName: string,
    documentUri: string,
    pgConfigs: ProcessorGroupCopybookPathConfig[],
  ): Promise<vscode.Uri | undefined> {
    const allowedExtensions =
      await SettingsService.getCopybookExtension(documentUri);

    const promises = pgConfigs.map(async (config) => {
      if (config instanceof vscode.Uri) {
        const localResult = await localCopybooks.searchDirectory(
          config,
          copybookName,
          allowedExtensions ?? [],
        );
        if (localResult) {
          return localResult;
        }
      } else {
        const profile =
          config.profile ??
          ProfileUtils.getProfileNameForCopybook(
            copybookName,
            this.explorerApi,
          );
        if (!profile) {
          this.processDownloadError(PROVIDE_PROFILE_MSG);
          return;
        }
        if (
          !(await this.isPrerequisiteForDownloadSatisfied(documentUri, [
            DEFAULT_DIALECT,
          ]))
        ) {
          return;
        }
        if (DATASET in config && this.dsnDownloader) {
          const dsResult = await this.dsnDownloader.resolveCopybookUri(
            profile,
            config.dataset,
            copybookName,
          );
          if (dsResult) {
            return dsResult;
          }
        } else if (USS in config && this.ussDownloader) {
          const ussResult = await this.ussDownloader.resolveCopybookUri(
            profile,
            config.uss,
            copybookName,
          );
          if (ussResult) {
            return ussResult;
          }
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
            element: copybookName.toUpperCase(),
            fingerprint: "",
          };
          if (
            resolvedProfile &&
            (await this.e4eDownloader.hasElement(
              resolvedProfile,
              element,
              copybookName,
            ))
          ) {
            return {
              endevorElement: {
                resolvedProfile,
                element,
              },
            };
          }
        }
      }
    });

    const results = await Promise.allSettled(promises);
    for (const result of results) {
      if (result.status === "fulfilled" && result.value) {
        if (result.value instanceof vscode.Uri) {
          return result.value;
        } else {
          try {
            const e4eResult = await this.e4eDownloader?.downloadElementE4E(
              result.value.endevorElement.resolvedProfile,
              result.value.endevorElement.element,
            );

            if (e4eResult) {
              return e4eResult;
            }
          } catch (err) {
            this.outputChannel?.appendLine(
              `Error while downloading copybook from Endevor - ${copybookName} - ${getErrorMessage(err)}`,
            );
          }
        }
      } else if (result.status === "rejected") {
        this.outputChannel?.appendLine(
          `Error while resolving copybook ${copybookName} - ${JSON.stringify(result.reason)}`,
        );
      }
    }
    this.outputChannel?.appendLine(
      `Unable to resolve copybook ${copybookName} using processor groups.`,
    );
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
    const configs: (
      | vscode.Uri
      | ZoweDatasetConfigModel
      | ZoweUssConfigModel
      | EndevorConfigModel
    )[] = [];
    const uniqueDialects = [...new Set(dialects)];
    for (const dialect of uniqueDialects) {
      configs.push(
        ...(await loadProcessorGroupCopybookPathsConfig(
          { scopeUri: documentUri },
          [],
          dialect,
        )),
      );
    }

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

  public reenableFailedRequests() {
    this.dsnDownloader?.reenableFailedRequests();
    this.ussDownloader?.reenableFailedRequests();
  }

  private async isProcessorGroupConfigsSatisfiesDownload(
    documentUri: string,
    defaultProfile: string | undefined,
    configs: (
      | vscode.Uri
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
