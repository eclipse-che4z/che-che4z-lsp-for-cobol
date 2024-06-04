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
    items: [
      {
        member: "copybook",
      },
      { member: "DATASET2" },
    ],
  },
});
const error = new Error("Error");
(error as any).mDetails = {
  errorCode: 401,
};
export const allMemberErrorMock = jest.fn().mockRejectedValue(error);
export const mvsApiMock = jest.fn().mockReturnValue({
  allMembers: allMemberMock,
  getContents: getContentMock,
});

export const mvsApiMockWithError = jest.fn().mockReturnValue({
  allMembers: allMemberErrorMock,
  getContents: getContentMock,
});

export const allUSSFilemembers = jest.fn().mockReturnValue({
  apiResponse: {
    items: [
      { name: "uss_copybook" },
      { name: "uss_withExt.cpy" },
      { name: "USS_DATASET2" },
    ],
  },
});
export const ussApiMock = jest.fn().mockReturnValue({
  fileList: allUSSFilemembers,
  getContents: getUSSContentsMock,
});
const ussApiMockWithError = jest.fn().mockReturnValue({
  fileList: allMemberErrorMock,
  getContents: getUSSContentsMock,
});
export const zoweExplorerMock: IApiRegisterClient = {
  getExplorerExtenderApi: jest.fn().mockReturnValue({
    getProfilesCache: jest.fn().mockReturnValue({
      loadNamedProfile: jest.fn().mockReturnValue({
        profile: { encoding: undefined, name: "profile" },
      }),
    }),
  }),
  getMvsApi: mvsApiMock,
  getUssApi: ussApiMock,
  registeredApiTypes: jest.fn().mockReturnValue([]),
};

export const zoweExplorerErrorMock = {
  getExplorerExtenderApi: jest.fn().mockReturnValue({
    getProfilesCache: jest.fn().mockReturnValue({
      loadNamedProfile: jest.fn().mockReturnValue({
        profile: { encoding: undefined, name: "profile" },
      }),
    }),
  }),
  getMvsApi: mvsApiMockWithError,
  getUssApi: ussApiMockWithError,
  registeredApiTypes: jest.fn().mockReturnValue([]),
};
