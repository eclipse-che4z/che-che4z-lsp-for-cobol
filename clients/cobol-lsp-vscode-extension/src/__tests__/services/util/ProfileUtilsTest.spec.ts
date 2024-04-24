/*
 * Copyright (c) 2021 Broadcom.
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

import * as path from "path";
import * as vscode from "vscode";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { Utils } from "../../../services/util/Utils";

const getZoweExplorerMock = () => {
  return jest.fn().mockReturnValue({
    getExplorerExtenderApi: jest.fn().mockReturnValue({
      getProfilesCache: jest.fn().mockReturnValue({
        getProfiles: jest.fn().mockReturnValue([
          {
            name: "profile",
          },
          {
            name: "profile2",
          },
        ]),
        loadNamedProfile: jest.fn().mockReturnValue("profile"),
      }),
      ussFileProvider: {
        openFiles: {
          "COBOLFI2.cbl": {
            profile: {
              name: "profile-1",
            },
          },
        },
      },
      datasetProvider: {
        openFiles: {
          "COBOLFILE.cbl": {
            profile: {
              name: "profile-1",
            },
          },
        },
      },
    }),
    registeredApiTypes: jest.fn().mockReturnValue(["zosmf"]),
  });
};
describe("Test profile Utils", () => {
  const programName = "COBOLFILE.cbl";
  const profile = "profile";
  it("checks a profile passed through settings is always given preference over profile from doc path for copybook download", async () => {
    const zoweApiMock = getZoweExplorerMock()();
    vscode.Uri.parse = jest.fn().mockImplementation((arg) => arg);
    (vscode.workspace.textDocuments as any) = [];
    (vscode.workspace.textDocuments as any).push({
      fileName: path.join(profile, programName),
    } as any);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profileInSettings"),
    });
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue([profile]);
    expect(
      ProfileUtils.getProfileNameForCopybook(programName, zoweApiMock),
    ).toBe("profileInSettings");
  });

  it("checks that profile is fetched from the settings if not a ZE downloaded file", async () => {
    const zoweApiMock = getZoweExplorerMock()();
    vscode.Uri.parse = jest.fn().mockImplementation((arg) => arg);
    (vscode.workspace.textDocuments as any) = [];
    (vscode.workspace.textDocuments as any).push({
      fileName: path.join("profileX", programName),
    } as any);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profile2"),
    });
    expect(
      ProfileUtils.getProfileNameForCopybook(programName, zoweApiMock),
    ).toBe("profile2");
  });
  it("test zowe v3 profile extraction", () => {
    vscode.Uri.parse = jest.fn().mockImplementation((arg) => {
      const match = /^([^:]+):(.*)/.exec(arg);
      return {
        scheme: match?.[1],
        path: match?.[2],
        fsPath: match?.[2]?.replace("/", path.sep),
      };
    });
    expect(ProfileUtils.getProfileFromDocument("", undefined)).toBeUndefined();
    expect(
      ProfileUtils.getProfileFromDocument("zowe-ds:", undefined),
    ).toBeUndefined();
    expect(
      ProfileUtils.getProfileFromDocument("zowe-ds:/", undefined),
    ).toBeUndefined();
    expect(
      ProfileUtils.getProfileFromDocument("zowe-ds:/profile", undefined),
    ).toBe("profile");
  });
});
