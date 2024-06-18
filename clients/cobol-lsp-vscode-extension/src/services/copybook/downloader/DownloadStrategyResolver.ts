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
import * as vscode from "vscode";
import { E4E } from "../../../type/e4eApi";
import { SettingsService } from "../../Settings";
import { CopybookName } from "../CopybookDownloadService";
import { E4ECopybookService } from "../E4ECopybookService";
import { CopybookDownloaderForDsn } from "./CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "./CopybookDownloaderForUss";
import { CopybookDownloaderForE4E } from "./CopybookDownloaderForE4E";

/**
 * Copybook downloader from E4E Api or using Zowe Explorer MVS & USS Api based on configuration
 */
export class DownloadStrategyResolver {
  private readonly dsnDownloader?: CopybookDownloaderForDsn;
  private readonly ussDownloader?: CopybookDownloaderForUss;
  private readonly e4eDownloader?: CopybookDownloaderForE4E;

  constructor(
    storagePath: string,
    explorerApi: IApiRegisterClient | undefined,
    e4eApi: E4E | undefined,
    outputChannel?: vscode.OutputChannel,
  ) {
    if (e4eApi) {
      this.e4eDownloader = new CopybookDownloaderForE4E(
        storagePath,
        outputChannel,
      );
    }
    if (explorerApi) {
      this.ussDownloader = new CopybookDownloaderForUss(
        storagePath,
        explorerApi,
      );
      this.dsnDownloader = new CopybookDownloaderForDsn(
        storagePath,
        explorerApi,
      );
    }
  }

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
    const e4e = await E4ECopybookService.getE4EClient(documentUri);
    if (this.e4eDownloader && e4e) {
      await this.e4eDownloader.downloadCopybookE4E(copybookName, e4e);
      return true;
    }

    const { dsnPaths, ussPaths } = this.fetchDownloadSettings(
      copybookName,
      documentUri,
    );

    if (this.dsnDownloader) {
      const dsnSuccess = await this.downloadFromPaths(
        this.dsnDownloader,
        copybookName,
        documentUri,
        dsnPaths,
      );
      if (dsnSuccess) return true;
    }

    if (this.ussDownloader) {
      return this.downloadFromPaths(
        this.ussDownloader,
        copybookName,
        documentUri,
        ussPaths,
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

  private fetchDownloadSettings(
    copybookName: CopybookName,
    documentUri: string,
  ): { dsnPaths: string[]; ussPaths: string[] } {
    const dsnPaths = SettingsService.getDsnPath(
      documentUri,
      copybookName.dialect,
    );
    const ussPaths = SettingsService.getUssPath(
      documentUri,
      copybookName.dialect,
    );
    return { dsnPaths, ussPaths };
  }
}
