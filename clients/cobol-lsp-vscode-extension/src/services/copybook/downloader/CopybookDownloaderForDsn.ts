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
import { ProfileUtils } from "../../util/ProfileUtils";
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
   * Checks if the file could be downloaded using the Zowe explorer from MVS
   * @param copybookName Copybook to be downloaded.
   * @param documentUri cobol programs which needs copybook
   * @param dsnPath dsnpath in mainframe.
   */
  isEligibleForDownload(
    _copybookName: CopybookName,
    documentUri: string,
    dsnPath: string | undefined,
  ): boolean {
    const providedProfile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerAPI,
    );
    return !!(dsnPath && providedProfile);
  }

  /**
   * Downloads a file from the passed dns based on Zowe explorer
   *
   * @param copybookName Copybook to be downloaded.
   * @param documentUri cobol programs which needs copybook
   * @param dsnPath dsnpath in mainframe.
   */
  async downloadCopybook(
    copybookName: CopybookName,
    documentUri: string,
    dsnPath: string,
  ): Promise<boolean> {
    const providedProfile = ProfileUtils.getProfileNameForCopybook(
      documentUri,
      this.explorerAPI,
    );

    if (this.isEligibleForDownload(copybookName, documentUri, dsnPath)) {
      const memberList = await this.getAllMembers(providedProfile!, dsnPath);
      const remoteCopybook = DownloadUtil.getRemoteCopybookName(
        memberList,
        copybookName.name,
      );
      return !!(
        remoteCopybook &&
        (await this.downloadCopybookFromMFUsingZowe(
          dsnPath,
          remoteCopybook,
          providedProfile!,
        ))
      );
    }
    return false;
  }

  private async getAllMembers(profileName: string, dataset: string) {
    const id = this.createId(profileName, dataset);

    if (this.memberListCache.has(id)) {
      return this.memberListCache.get(id)!;
    }

    const profile = DownloadUtil.loadProfile(profileName, this.explorerAPI);
    const response = await this.explorerAPI
      .getMvsApi(profile)
      .allMembers(dataset);
    const members = response.apiResponse.items.map((item: any) => item.member);

    this.memberListCache.set(id, members);
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
}
