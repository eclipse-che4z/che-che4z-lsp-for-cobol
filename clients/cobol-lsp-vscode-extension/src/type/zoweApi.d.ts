/*
 * Copyright (c) 2022 Broadcom.
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

/**
 * These types extracted from the ZOWE Explorer API's.
 */
interface IApiRegisterClient {
  getExplorerExtenderApi(): IApiExplorerExtender;
  getUssApi(profile: IProfileLoaded): IUss;
  getMvsApi(profile: IProfileLoaded): IMvs;
  registeredApiTypes(): string[];
}

interface IApiExplorerExtender {
  getProfilesCache(): ProfilesCache;
}

interface ProfilesCache {
  loadNamedProfile(name: string, type?: string): IProfileLoaded;
  getProfiles(type: string): IProfileLoaded[];
}

interface IUss {
  getContents(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
  fileList(ussFilePath: string): Promise<IZosFilesResponse>;
}

interface IMvs {
  getContents(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
  allMembers(dataSetName: string, options?: any): Promise<IZosFilesResponse>;
}

interface IProfileLoaded {
  profile: {
    encoding: string;
  };
  name: string;
}

interface IZosFilesResponse {
  apiResponse: {
    items: Array<{
      name: string;
      member: string;
    }>;
  };
}
