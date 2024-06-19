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
import { CopybookDownloaderForDsn } from "./CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "./CopybookDownloaderForUss";
import { CopybookDownloaderForE4E } from "./CopybookDownloaderForE4E";
import { searchCopybookInExtensionFolder } from "../../util/FSUtils";
import { CopybookURI } from "../CopybookURI";
import path = require("path");
import { COPYBOOKS_FOLDER, ZOWE_FOLDER } from "../../../constants";
import { searchCopybook } from "../CopybookMessageHandler";

/**
 * Copybook downloader from E4E Api or using Zowe Explorer MVS & USS Api based on configuration
 */
export class DownloadStrategyResolver {
  private readonly dsnDownloader?: CopybookDownloaderForDsn;
  private readonly ussDownloader?: CopybookDownloaderForUss;
  private readonly e4eDownloader?: CopybookDownloaderForE4E;

  constructor(
    private storagePath: string,
    explorerApi: IApiRegisterClient | undefined,
    private e4eApi: E4E | undefined,
    outputChannel?: vscode.OutputChannel,
  ) {
    if (this.e4eApi) {
      this.e4eDownloader = new CopybookDownloaderForE4E(
        storagePath,
        this.e4eApi,
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
    if (
      await this.e4eDownloader?.downloadCopybookE4E(documentUri, copybookName)
    ) {
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

  public async resolveCopybookHandler(
    documentUri: string,
    copybookName: string,
    dialectType: string,
  ): Promise<string | undefined> {
    let result: string | undefined;
    if (this.e4eApi?.isEndevorElement(documentUri)) {
      result = await this.e4eDownloader?.getE4ECopyBookLocation(
        copybookName,
        documentUri,
      );
      return result;
    }
    result = await searchCopybook(
      documentUri,
      copybookName,
      dialectType,
      this.storagePath,
    );
    // check in subfolders under .copybooks (copybook downloaded from MF)
    if (!result) {
      result = searchCopybookInExtensionFolder(
        copybookName,
        await CopybookURI.createPathForCopybookDownloaded(
          documentUri,
          dialectType,
          path.join(this.storagePath, ZOWE_FOLDER, COPYBOOKS_FOLDER),
        ),
        SettingsService.getCopybookExtension(documentUri),
        this.storagePath,
      );
    }
    return result;
  }

  public async isE4EPrerequisiteForDownloadSatisfied(
    documentUri: string,
  ): Promise<boolean> {
    return !!(await this.e4eDownloader?.getE4EClient(documentUri));
  }
}
