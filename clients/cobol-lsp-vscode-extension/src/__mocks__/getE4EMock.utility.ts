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

import {
  E4E,
  e4eResponse,
  EndevorElement,
  EndevorMember,
} from "../type/e4eApi.d";

export const e4eMock: E4E = {
  getConfiguration: jest.fn().mockReturnValue({
    pgms: [
      {
        program: "program",
        pgroup: "pgroup",
      },
    ],
    pgroups: [
      {
        name: "pgroup",
        libs: [
          { dataset: "dataset" },
          {
            environment: "environment",
            stage: "stage",
            system: "system",
            subsystem: "subsystem",
            type: "type",
            use_map: false,
          },
        ],
      },
    ],
  }),
  getProfileInfo: jest.fn().mockReturnValue({
    profile: "profile",
    instance: "instance",
  }),
  isEndevorElement: jest.fn().mockReturnValue(true),
  listElements: jest.fn().mockReturnValue([
    ["copybook", "fingerprint"],
    ["copybook2", "fingerprint2"],
  ]),
  listMembers: jest.fn().mockReturnValue([
    {
      dataset: "dataset",
      member: "copybook",
    },
  ]),
  onDidChangeElement: jest.fn(),
  getElement: jest.fn().mockReturnValue(["content", "fingerprint"]),
  getMember: jest.fn().mockReturnValue("content"),
};

export const e4eResponseEndevorFirst: e4eResponse = {
  profile: { instance: "instance", profile: "profile" },
  uri: "document-uri",
  elements: {
    ["copybook"]: {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
      element: "copybook",
      fingerprint: "fingerprint",
    },
    ["copybook2"]: {
      dataset: "dataset",
      member: "copybook",
    },
  } as { [key: string]: EndevorElement | EndevorMember },
};
export const e4eResponseDatasetFirst: e4eResponse = {
  profile: { instance: "instance", profile: "profile" },
  uri: "document-uri",
  elements: {
    ["copybook"]: {
      dataset: "dataset",
      member: "copybook",
    },
    ["copybook2"]: {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
      element: "copybook",
      fingerprint: "fingerprint",
    },
  } as { [key: string]: EndevorElement | EndevorMember },
};
