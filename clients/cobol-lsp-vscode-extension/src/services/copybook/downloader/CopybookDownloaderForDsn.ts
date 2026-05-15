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
 * Copybook downloader from MVS using Zowe Explorer
 */
export class CopybookDownloaderForDsn extends ZoweExplorerDownloader {
  public async getAllMembers(
    profileName: string,
    dataset: string,
  ): Promise<MemberCacheItem[]> {
    return this.makeCachedRequest(
      `list dataset members ${profileName}/${dataset}`,
      this.createId(profileName, dataset, []),
      vscode.Uri.from({
        scheme: "zowe-ds",
        path: `/${profileName}/${dataset}`,
      }),
      (response) =>
        response.map((item) => {
          const [name, extension] = splitFilename(item[0]);
          return {
            name,
            extension,
          };
        }),
    );
  }
}
