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
import { splitFilename } from "../../util/FSUtils";
import {
  MemberCacheItem,
  ZoweExplorerDownloader,
} from "./ZoweExplorerDownloader";
import * as vscode from "vscode";

/**
 * Copybook downloader from USS using Zowe Explorer
 */
export class CopybookDownloaderForUss extends ZoweExplorerDownloader {
  protected schema = "zowe-uss";
  protected separator = "";

  constructor(explorerAPI: IApiRegisterClient) {
    super(explorerAPI);
  }

  public async getAllMembers(
    profileName: string,
    dataset: string,
  ): Promise<MemberCacheItem[]> {
    const id = this.createId(profileName, dataset);

    if (this.memberListCache.has(id)) {
      return this.memberListCache.get(id)!;
    }

    let allowedCopybooksExtensions =
      await SettingsService.getCopybookExtension();
    allowedCopybooksExtensions = allowedCopybooksExtensions?.map((ext) =>
      ext.toLowerCase(),
    );
    const allowedNoExtension = allowedCopybooksExtensions?.includes("");

    const members: MemberCacheItem[] = [];

    await this.limitFailedRequests(
      `list USS directory ${profileName}/${dataset}`,
      async () => {
        const response = await vscode.workspace.fs.readDirectory(
          vscode.Uri.parse(`${this.schema}:/${profileName}${dataset}`),
        );

        for (const file of response) {
          if (file[1] === vscode.FileType.File) {
            const [name, extension] = splitFilename(file[0]);

            if (extension) {
              if (
                allowedCopybooksExtensions?.includes(extension.toLowerCase())
              ) {
                members.push({ name, extension });
              }
            } else if (allowedNoExtension) {
              members.push({ name });
            }
          }
        }
      },
    );

    this.memberListCache.set(id, members);
    return members;
  }
}
