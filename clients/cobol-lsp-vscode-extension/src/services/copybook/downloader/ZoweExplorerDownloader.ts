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
import * as iconv from "iconv-lite";
import { SettingsService } from "../../Settings";
import { CopybookURI } from "../CopybookURI";

export abstract class ZoweExplorerDownloader {
  public static profileStore: Map<string, "locked-profile" | "valid-profile"> =
    new Map();
  protected memberListCache: Map<string, string[]> = new Map();
  private ZoweDownloadQueue = new Map<string, Promise<boolean>>();

  public clearZoweDownloadQueue() {
    this.ZoweDownloadQueue.clear();
  }

  constructor(
    private readonly storagePath: string,
    protected readonly explorerAPI: IApiRegisterClient,
  ) {}

  protected abstract downloadCopybookContent(
    dataset: string,
    member: string,
    profileName: string,
  ): Promise<boolean>;

  protected getDownloadOptions(
    profileName: string,
    dataset: string,
    member: string,
    loadedProfile: IProfileLoaded,
  ) {
    const copybookEncoding = SettingsService.getCopybookFileEncoding();
    const baseUri = vscode.Uri.file(
      CopybookURI.createDatasetPath(profileName, dataset, this.storagePath),
    );
    const fileUri = vscode.Uri.joinPath(baseUri, member);
    return {
      apiOptions: {
        file: fileUri.fsPath,
        returnEtag: true,
        ...(copybookEncoding
          ? { binary: true }
          : { encoding: loadedProfile.profile.encoding }),
      },
      fileUri,
      decode: copybookEncoding,
    };
  }

  protected async decodeBinaryContent(
    filePath: vscode.Uri,
    encoding: string,
    insertNewLineOn80Char: boolean = false,
  ) {
    const fileContents = await vscode.workspace.fs.readFile(filePath);
    let newContent = iconv.decode(Buffer.from(fileContents), encoding);

    if (insertNewLineOn80Char) {
      // Based on assumption - Most of source code on z/OS is 80 characters per record - JCL, HLASM, COBOL
      // Can be exposed later on as a setting.
      newContent = newContent.replace(/.{80}/g, `$&\n`);
    }
    const writeData = Buffer.from(newContent, "utf8");
    await vscode.workspace.fs.writeFile(filePath, writeData);
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

    const queueResponse = this.ZoweDownloadQueue.get(copybookPath);
    if (queueResponse) {
      return queueResponse;
    }
    const response = this.downloadCopybookContent(dataset, member, profileName)
      .catch((err) => {
        vscode.window.showErrorMessage(err.message);
        return false;
      })
      .finally(() => this.ZoweDownloadQueue.delete(copybookPath));
    this.ZoweDownloadQueue.set(copybookPath, response);
    return response;
  }

  protected createId(profileName: string, path: string) {
    return `${profileName}-${path}`;
  }

  /**
   * Clears the member cache for the copybook downloader
   */
  public clearMemberListCache() {
    this.memberListCache.clear();
  }
}
