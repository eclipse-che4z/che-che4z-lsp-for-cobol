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
import { CopybookName } from "../CopybookDownloadService";
import { DownloadUtil } from "./DownloadUtil";
import { ZoweExplorerDownloader } from "./ZoweExplorerDownloader";

/**
 * Copybook downloader from MVS using Zowe Explorer
 */
export class CopybookDownloaderForDsn extends ZoweExplorerDownloader {
  constructor(storagePath: string, explorerAPI: IApiRegisterClient) {
    super(storagePath, explorerAPI);
  }
  /**
   * Downloads a file from the passed dns based on Zowe explorer
   *
   * @param copybookName Copybook to be downloaded.
   * @param dsnPath dsnpath in mainframe.
   * @param profile zowe profile name
   */
  async downloadCopybook(
    copybookName: CopybookName,
    dsnPath: string,
    profile: string,
  ): Promise<boolean> {
    const memberList = await this.getAllMembers(profile, dsnPath);
    const remoteCopybook = DownloadUtil.getRemoteCopybookName(
      memberList,
      copybookName.name,
    );
    return !!(
      remoteCopybook &&
      (await this.downloadCopybookFromMFUsingZowe(
        dsnPath,
        remoteCopybook,
        profile,
      ))
    );
  }

  public async getAllMembers(profileName: string, dataset: string) {
    const id = this.createId(profileName, dataset);

    if (this.memberListCache.has(id)) {
      return this.memberListCache.get(id)!;
    }

    const profile = DownloadUtil.loadProfile(profileName, this.explorerAPI);

    let members: string[] = [];
    await this.limitFailedRequests(
      `list dataset members ${profileName}/${dataset}`,
      async () => {
        const response = await this.explorerAPI
          .getMvsApi(profile)
          .allMembers(dataset);
        members = response.apiResponse.items.map((item) => item.member);

        this.memberListCache.set(id, members);
      },
    );

    return members;
  }

  /**
   * Downloads file using Zowe explorer from MVS based on passed parameters
   * @param dataset  dataset name
   * @param member member name
   * @param profileName ZE profile name
   */
  override async downloadCopybookContent(
    dataset: string,
    member: string,
    profileName: string,
  ) {
    const loadedProfile = DownloadUtil.loadProfile(
      profileName,
      this.explorerAPI,
    );
    const downloadOptions = this.getDownloadOptions(
      profileName,
      dataset,
      member,
      loadedProfile,
    );

    await this.explorerAPI
      .getMvsApi(loadedProfile)
      .getContents(
        `${dataset}(${DownloadUtil.getFilenameWithoutExtension(member)})`,
        downloadOptions.apiOptions,
      );

    if (downloadOptions.decode) {
      await this.decodeBinaryContent(
        downloadOptions.fileUri,
        downloadOptions.decode,
        true,
      );
    }

    return true;
  }

  public async hasMember(
    profileName: string,
    dataset: string,
    copybookName: string,
  ): Promise<boolean> {
    const id = this.createId(profileName, dataset);

    if (this.memberListCache.has(id)) {
      return this.memberListCache
        .get(id)
        ?.find((member) => member.toUpperCase() === copybookName.toUpperCase())
        ? true
        : false;
    }
    const profile = DownloadUtil.loadProfile(profileName, this.explorerAPI);
    await this.limitFailedRequests(
      `list dataset members ${profileName}/${dataset}`,
      async () => {
        const response = await this.explorerAPI
          .getMvsApi(profile)
          .allMembers(dataset);
        const members = response.apiResponse.items.map((item) => item.member);

        this.memberListCache.set(id, members);
      },
    );

    if (
      this.memberListCache
        .get(id)
        ?.find((member) => member.toUpperCase() === copybookName.toUpperCase())
    )
      return true;
    return false;
  }
}
