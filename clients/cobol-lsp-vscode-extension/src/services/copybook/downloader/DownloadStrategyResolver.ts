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
import { SettingsService } from "../../Settings";
import { CopybookName } from "../CopybookDownloadService";
import { CopybookDownloaderForDsn } from "./CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "./CopybookDownloaderForUss";

/**
 * Copybook downloader from MVS or USS using Zowe Explorer based on configuration
 */
export class DownloadStrategyResolver {
  private readonly dsnDownloader?: CopybookDownloaderForDsn;
  private readonly ussDownloader?: CopybookDownloaderForUss;

  constructor(
    storagePath: string,
    explorerApi: IApiRegisterClient | undefined,
  ) {
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
   * Downloads a file using Zowe Explorer based on provided configuration
   *
   * @param copybookName Copybook to be downloaded.
   * @param documentUri cobol programs which needs copybook
   * @param callback callback function
   */
  async downloadCopybook(
    copybookName: CopybookName,
    documentUri: string,
  ): Promise<boolean> {
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
