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
import { DownloadUtil } from "./DownloadUtil";
import * as iconv from "iconv-lite";
import { SettingsService } from "../../Settings";
import { CopybookURI } from "../CopybookURI";

export abstract class ZoweExplorerDownloader {
  public static profileStore: Map<string, "locked-profile" | "valid-profile"> =
    new Map();

  constructor(
    private readonly storagePath: string,
    protected readonly explorerAPI: IApiRegisterClient,
  ) {}

  protected abstract downloadCopybookContent(
    dataset: string,
    member: string,
    profileName: string,
  ): Promise<void>;

  protected getDownloadOptions(
    profileName: string,
    dataset: string,
    member: string,
    loadedProfile: IProfileLoaded,
  ) {
    const downloadBinary = !!SettingsService.getCopybookFileEncoding();
    const baseUri = vscode.Uri.file(
      CopybookURI.createDatasetPath(profileName, dataset, this.storagePath),
    );
    const filePath = vscode.Uri.joinPath(baseUri, member);
    const encoding = downloadBinary
      ? SettingsService.getCopybookFileEncoding()
      : loadedProfile.profile.encoding;
    return {
      file: filePath,
      binary: downloadBinary,
      returnEtag: true,
      encoding,
    };
  }

  protected async encodeDownloadedContent(
    filePath: vscode.Uri,
    encoding: string | undefined,
    insertNewLineOn80Char: boolean = false,
  ) {
    const fileContents = await vscode.workspace.fs.readFile(filePath);
    if (encoding) {
      let newContent = iconv.decode(Buffer.from(fileContents), encoding);

      if (insertNewLineOn80Char) {
        // Based on assumption - Most of source code on z/OS is 80 characters per record - JCL, HLASM, COBOL
        // Can be exposed later on as a setting.
        newContent = newContent.replace(/.{80}/g, `$&\n`);
      }
      const writeData = Buffer.from(newContent, "utf8");
      await vscode.workspace.fs.writeFile(filePath, writeData);
    }
  }

  protected async downloadCopybookFromMFUsingZowe(
    dataset: string,
    member: string,
    profileName: string,
  ): Promise<boolean> {
    const copybookPath = CopybookURI.createCopybookPath(
      profileName,
      dataset,
      member,
      this.storagePath,
    );

    if (!(await DownloadUtil.checkPathExists(copybookPath))) {
      try {
        await this.downloadCopybookContent(dataset, member, profileName);
        return true;
      } catch (err: any) {
        vscode.window.showErrorMessage(err.message);
      }
    }

    return false;
  }
}
