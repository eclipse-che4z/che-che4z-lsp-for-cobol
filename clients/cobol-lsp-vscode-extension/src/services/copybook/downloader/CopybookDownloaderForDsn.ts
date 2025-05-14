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
import { DownloadUtil } from "./DownloadUtil";
import {
  MemberCacheItem,
  ZoweExplorerDownloader,
} from "./ZoweExplorerDownloader";
import * as vscode from "vscode";

/**
 * Copybook downloader from MVS using Zowe Explorer
 */
export class CopybookDownloaderForDsn extends ZoweExplorerDownloader {
  constructor(explorerAPI: IApiRegisterClient) {
    super(explorerAPI);
  }

  public async getAllMembers(
    profileName: string,
    dataset: string,
  ): Promise<string[]> {
    const id = this.createId(profileName, dataset);

    if (this.memberListCache.has(id)) {
      return this.memberListCache.get(id)!.map((m) => m.name);
    }

    const profile = DownloadUtil.loadProfile(profileName, this.explorerAPI);

    let members: MemberCacheItem[] = [];
    await this.limitFailedRequests(
      `list dataset members ${profileName}/${dataset}`,
      async () => {
        const response = await this.explorerAPI
          .getMvsApi(profile)
          .allMembers(dataset);
        members = response.apiResponse.items.map((item) => ({
          name: item.member,
        }));

        this.memberListCache.set(id, members);
      },
    );

    return members.map((m) => m.name);
  }

  public async hasMember(
    profileName: string,
    dataset: string,
    copybookName: string,
  ): Promise<boolean> {
    const members = await this.getAllMembers(profileName, dataset);

    copybookName = copybookName.toUpperCase();
    return members.some((member) => member.toUpperCase() === copybookName);
  }

  public async resolveCopybookUri(
    profileName: string,
    dataset: string,
    copybookName: string,
  ) {
    if (await this.hasMember(profileName, dataset, copybookName)) {
      return vscode.Uri.parse(
        `zowe-ds:/${profileName}/${dataset}/${copybookName}`,
      );
    }
  }
}
