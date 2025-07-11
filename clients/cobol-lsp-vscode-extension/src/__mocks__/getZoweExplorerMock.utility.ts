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

export const getContentMock = jest.fn();
export const getUSSContentsMock = jest.fn();
export const allMemberMock = jest.fn().mockReturnValue({
  apiResponse: {
    items: [],
  },
});

export const mvsApiMock = (allMembers = allMemberMock) =>
  jest.fn().mockReturnValue({
    allMembers,
    getContents: getContentMock,
  });

export const allUSSFilemembers = jest.fn().mockReturnValue({
  apiResponse: {
    items: [],
  },
});

export const ussApiMock = (fileList = allUSSFilemembers) =>
  jest.fn().mockReturnValue({
    fileList,
    getContents: getUSSContentsMock,
  });

export const createZoweExplorerMock = (
  allMembers = allMemberMock,
  fileList = allUSSFilemembers,
): IApiRegisterClient => ({
  getExplorerExtenderApi: jest.fn().mockReturnValue({
    getProfilesCache: jest.fn().mockReturnValue({
      loadNamedProfile: jest.fn().mockReturnValue({
        profile: { encoding: undefined, name: "profile" },
      }),
    }),
  }),
  getMvsApi: mvsApiMock(allMembers),
  getUssApi: ussApiMock(fileList),
  registeredApiTypes: jest.fn().mockReturnValue([]),
  onProfileUpdated: jest.fn(),
});
