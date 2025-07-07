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
  protected schema = "zowe-ds";
  protected separator = "/";

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

    let members: MemberCacheItem[] = [];
    await this.limitFailedRequests(
      `list dataset members ${profileName}/${dataset}`,
      async () => {
        const response = await vscode.workspace.fs.readDirectory(
          vscode.Uri.parse(`${this.schema}:/${profileName}/${dataset}`),
        );
        members = response.map((item) => {
          const [name, extension] = splitFilename(item[0]);
          return {
            name,
            extension,
          };
        });

        this.memberListCache.set(id, members);
      },
    );

    return members;
  }
}
