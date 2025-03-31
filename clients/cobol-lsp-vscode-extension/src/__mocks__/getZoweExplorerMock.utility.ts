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
class MemberError extends Error {
  mDetails: {
    errorCode: number;
  };

  constructor(message: string, errorCode: number) {
    super(message);
    this.mDetails = {
      errorCode,
    };
  }
}

export const unauthorizedErrorMock = jest
  .fn()
  .mockRejectedValue(
    new MemberError(
      "Rest API failure with HTTP(S) status 401\nThis operation requires authentication.\nToken is not valid or expired.",
      401,
    ),
  );
export const notFoundErrorMock = jest
  .fn()
  .mockRejectedValue(
    new MemberError(
      "Rest API failure with HTTP(S) status 404\nISRZ002 Data set not cataloged",
      404,
    ),
  );
export const permissionsErrorMock = jest.fn().mockRejectedValue(
  new MemberError(
    `Rest API failure with HTTP(S) status 500
ISRZ002 Authorization failed - You may not use this protected data set. Open 913 abend.`,
    500,
  ),
);

export const mvsApiMock = (allMembers = allMemberMock) =>
  jest.fn().mockReturnValue({
    allMembers,
    getContents: getContentMock,
  });

export const allUSSFilemembers = jest.fn().mockReturnValue({
  apiResponse: {
    items: [
      { name: "uss_copybook", mode: "-rwxr-xr-x" },
      { name: "uss_withExt.cpy", mode: "-rwxr-xr-x" },
      { name: "USS_DATASET2", mode: "-rwxr-xr-x" },
    ],
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
});
