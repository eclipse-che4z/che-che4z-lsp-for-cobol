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
import { DownloadStrategyResolver } from "./downloader/DownloadStrategyResolver";
import { PROVIDE_PROFILE_MSG } from "../../constants";
import { ProfileUtils } from "../util/ProfileUtils";
import { DownloadUtil } from "./downloader/DownloadUtil";

export class CopybookName {
  constructor(public name: string, public dialect: string) {}
}

export class CopybookDownloadService {
  private downloadResolver: DownloadStrategyResolver;

  constructor(
    storagePath: string,
    private explorerAPI: IApiRegisterClient | undefined,
  ) {
    this.downloadResolver = new DownloadStrategyResolver(
      storagePath,
      this.explorerAPI,
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
        await this.downloadResolver!.downloadCopybook(
          copybookName,
          documentUri,
        ).finally(() => {
          processedCopybooks++;
          this.updateDownloadProgress(
            progress,
            totalCopybooksToDownload,
            processedCopybooks,
          );
        });
      }),
    ).catch((err) => {
      vscode.window.showErrorMessage(err.message);
    });
  }

  private async isPrerequisiteForDownloadSatisfied(
    documentUri: string,
    copybookNames: CopybookName[],
  ): Promise<boolean> {
    if (
      !DownloadUtil.areCopybookDownloadConfigurationsPresent(
        documentUri,
        copybookNames,
      )
    )
      return false;
    if (!this.explorerAPI) return false;
    const profile = await ProfileUtils.getProfileNameForCopybook(documentUri);
    const availableProfiles = ProfileUtils.getAvailableProfiles(
      this.explorerAPI!,
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
        this.explorerAPI,
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
