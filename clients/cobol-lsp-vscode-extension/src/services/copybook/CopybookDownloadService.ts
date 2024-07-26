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
  ENDEVOR_PROCESSOR,
  PROVIDE_PROFILE_MSG,
  ZOWE_FOLDER,
} from "../../constants";
import { ProfileUtils } from "../util/ProfileUtils";
import { DownloadUtil } from "./downloader/DownloadUtil";
import { E4E } from "../../type/e4eApi";
import { CopybookDownloaderForE4E } from "./downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./downloader/CopybookDownloaderForUss";
import { CopybookDownloaderForDsn } from "./downloader/CopybookDownloaderForDsn";
import { SettingsService } from "../Settings";
import { searchCopybook } from "./CopybookMessageHandler";
import { searchCopybookInExtensionFolder } from "../util/FSUtils";
import { CopybookURI } from "./CopybookURI";
import path = require("path");

export class CopybookName {
  constructor(public name: string, public dialect: string) {}
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
    this.dsnDownloader?.clearZoweDownloadQueue();
    this.ussDownloader?.clearZoweDownloadQueue();
  }

  private async downloadFromPaths(
    downloader: CopybookDownloaderForDsn | CopybookDownloaderForUss,
    copybook: CopybookName,
    documentUri: string,
    paths: string[] | undefined,
  ): Promise<boolean> {
    if (!paths) return false;

    for (const path of paths) {
      const success = await downloader.downloadCopybook(
        copybook,
        documentUri,
        path,
      );
      if (success) return true;
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
      return await this.e4eDownloader?.getE4ECopyBookLocation(
        copybookName,
        documentUri,
      );
    }

    const result = await searchCopybook(
      documentUri,
      copybookName,
      dialectType,
      this.storagePath,
    );
    if (result) return result;

    // check in subfolders under copybooks (copybook downloaded from MF)
    return searchCopybookInExtensionFolder(
      copybookName,
      CopybookURI.createPathForCopybookDownloaded(
        documentUri,
        dialectType,
        path.join(this.storagePath, ZOWE_FOLDER, COPYBOOKS_FOLDER),
        this.explorerApi,
      ),
      SettingsService.getCopybookExtension(documentUri),
      this.storagePath,
    );
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
        copybookNames,
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

  private async processCopybookDownload(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    documentUri: string,
    copybookNames: CopybookName[],
  ): Promise<void> {
    const totalCopybooksToDownload = copybookNames.length;
    let processedCopybooks = 0;

    await Promise.all(
      copybookNames.map(async (copybookName) => {
        await this.downloadCopybook(copybookName, documentUri).finally(() => {
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
        `Error downloading copybooks : ${err.message}`,
      );
    });
  }

  private async isPrerequisiteForDownloadSatisfied(
    documentUri: string,
    copybookNames: CopybookName[],
  ): Promise<boolean> {
    if (this.handleAsEndevorElement(documentUri)) {
      return !!(await this.e4eDownloader?.getE4EConfig(documentUri));
    }
    if (
      !DownloadUtil.areCopybookDownloadConfigurationsPresent(
        documentUri,
        copybookNames,
      )
    )
      return false;
    if (!this.explorerApi) return false;
    const profile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerApi,
    );
    const availableProfiles = ProfileUtils.getAvailableProfiles(
      this.explorerApi,
    );
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
        profile!,
        this.explorerApi,
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
}
