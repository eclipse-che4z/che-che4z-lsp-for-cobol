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
  E4E_INCOMPATIBLE,
  ENDEVOR_PROCESSOR,
  ENVIRONMENT,
  PROVIDE_PROFILE_MSG,
  PROVIDE_PROFILE_MSG_PROC_GRUOPS,
  USS,
} from "../../constants";
import { ProfileUtils } from "../util/ProfileUtils";
import { DownloadUtil } from "./downloader/DownloadUtil";
import { E4E } from "../../type/e4eApi";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./downloader/CopybookDownloaderForUss";
import { ZoweDSNService as ZoweDSNService } from "./downloader/CopybookDownloaderForDsn";
import { SettingsService } from "../Settings";
import {
  // loadProcessorGroupCopybookPathsConfig,
  loadProcessorGroupCopybooksLibs,
  ProcessorGroupCopybookPathConfig,
} from "../ProcessorGroups";
import {
  EndevorConfigModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "../ProcessorGroupsLoader";
import { getE4EAPI } from "./E4ECopybookService";
import { Utils } from "../util/Utils";
import { clearDiagnostics, showDiagnostics } from "../DiagnosticsService";

export class CopybookName {
  constructor(
    public name: string,
    public dialect: string,
  ) {}
}

export let externalApis: ExternalAPIsService;

export async function initializeExternalAPIs(
  storagePath: vscode.Uri,
  outputChannel: vscode.OutputChannel,
  configurationInvalidation?: () => unknown,
) {
  const maybeE4E = await getE4EAPI();
  const maybeZowe = await Utils.getZoweExplorerAPI();

  externalApis = new ExternalAPIsService(
    storagePath,
    maybeZowe && "api" in maybeZowe ? maybeZowe.api : undefined,
    maybeE4E && "api" in maybeE4E ? maybeE4E.api : undefined,
    outputChannel,
    configurationInvalidation,
  );

  if (maybeZowe && "futureApi" in maybeZowe) {
    void maybeZowe.futureApi.then((api) => {
      if (api) externalApis.explorerAppeared(api.api);
    });
  }

  if (!maybeE4E) outputChannel.appendLine(E4E_INCOMPATIBLE);
  else if ("futureApi" in maybeE4E)
    void maybeE4E.futureApi.then((api) => {
      if (api) externalApis.e4eAppeared(api.api);
      else outputChannel.appendLine(E4E_INCOMPATIBLE);
    });
}

export function missingExtension(documentUri: vscode.Uri, message: string) {
  showDiagnostics(documentUri, [
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

class ExternalAPIsService {
  explorerApi: IApiRegisterClient | undefined;
  e4eApi: E4E | undefined;
  dsnService?: ZoweDSNService;
  ussService?: CopybookDownloaderForUss;
  e4eDownloader?: CopybookDownloaderForE4E;

  /**
   * Clears downloaders cache
   */
  clearCache() {
    this.dsnService?.clearMemberListCache();
    this.ussService?.clearMemberListCache();
    this.e4eDownloader?.clearConfigs();
    this.e4eDownloader?.clearProfiles();
  }
  clearProfiles() {
    this.e4eDownloader?.clearProfiles();
  }

  clearE4EConfig(uri: string) {
    this.e4eDownloader?.clearInvalidConfig(uri);
  }

  public handleAsEndevorElement(documentUri: string) {
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
    clearDiagnostics();
  }

  public explorerAppeared(api: IApiRegisterClient) {
    this.explorerApi = api;
    this.ussService = new CopybookDownloaderForUss(this.explorerApi);
    this.dsnService = new ZoweDSNService(this.explorerApi);
    clearDiagnostics();
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

  private async isPrerequisiteForDownloadSatisfied(
    documentUri: vscode.Uri,
    dialects: string[],
  ): Promise<boolean> {
    if (this.handleAsEndevorElement(documentUri.toString())) {
      return !!(await this.e4eDownloader?.getE4EConfig(documentUri.toString()));
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
    // TODO: reimplement using libs
    // const uniqueDialects = [...new Set(dialects)];
    // for (const dialect of uniqueDialects) {
    //   configs.push(
    //     ...(await loadProcessorGroupCopybooksLibs(
    //       { scopeUri: documentUri },
    //       [],
    //       dialect,
    //     )),
    //   );
    // }

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

  private processDownloadError(title: string): void {
    const actionSettings = "Change settings";
    vscode.window.showErrorMessage(title, actionSettings).then((action) => {
      if (action === actionSettings) {
        vscode.commands.executeCommand("cobol-lsp.cpy-manager.goto-settings");
      }
    });
  }

  public reenableFailedRequests() {
    this.dsnService?.reenableFailedRequests();
    this.ussService?.reenableFailedRequests();
  }

  private async isProcessorGroupConfigsSatisfiesDownload(
    documentUri: vscode.Uri,
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
      missingExtension(documentUri, "Explorer for Endevor is not installed");
      return false;
    }
    if (!this.explorerApi && procGroupZoweConfigs.length > 0) {
      missingExtension(documentUri, "Zowe Explorer is not installed");
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
