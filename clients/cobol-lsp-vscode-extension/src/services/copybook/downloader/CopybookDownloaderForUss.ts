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
  public async getAllMembers(
    profileName: string,
    dataset: string,
    allowedCopybooksExtensions: string[],
  ): Promise<MemberCacheItem[]> {
    allowedCopybooksExtensions = allowedCopybooksExtensions
      ?.map((ext) => ext.toLowerCase())
      .sort();
    const allowedNoExtension = allowedCopybooksExtensions?.includes("");

    return this.makeCachedRequest(
      `list USS directory ${profileName}/${dataset}`,
      this.createId(profileName, dataset, allowedCopybooksExtensions),
      vscode.Uri.from({
        scheme: "zowe-uss",
        path: `/${profileName}${dataset}`,
      }),
      (response) => {
        const members: MemberCacheItem[] = [];
        for (const file of response) {
          if (file[1] !== vscode.FileType.File) continue;
          const [name, extension] = splitFilename(file[0]);

          if (extension) {
            if (allowedCopybooksExtensions?.includes(extension.toLowerCase())) {
              members.push({ name, extension });
            }
          } else if (allowedNoExtension) {
            members.push({ name });
          }
        }
        return members;
      },
    );
  }
}
