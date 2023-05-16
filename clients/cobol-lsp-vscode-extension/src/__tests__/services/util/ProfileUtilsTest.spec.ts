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
    }),
    registeredApiTypes: jest.fn().mockReturnValue(["zosmf"]),
  });
};
Utils.getZoweExplorerAPI = jest.fn();
describe("Test profile Utils", () => {
  const programName = "COBOLFILE.cbl";
  const profile = "profile";
  it("checks a profile passed through settings is always given preference over profile from doc path for copybook download", async () => {
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    (vscode.workspace.textDocuments as any) = [];
    (vscode.workspace.textDocuments as any).push({
      fileName: path.join(profile, programName),
    } as any);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profileInSettings"),
    });
    ProfileUtils.getAvailableProfiles = jest.fn().mockReturnValue([profile]);
    expect(await ProfileUtils.getProfileNameForCopybook(programName)).toBe(
      "profileInSettings",
    );
  });

  it("checks that profile is fetched from the settings if not a ZE downloaded file", async () => {
    Utils.getZoweExplorerAPI = getZoweExplorerMock();
    (vscode.workspace.textDocuments as any) = [];
    (vscode.workspace.textDocuments as any).push({
      fileName: path.join("profileX", programName),
    } as any);
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profile2"),
    });
    expect(await ProfileUtils.getProfileNameForCopybook(programName)).toBe(
      "profile2",
    );
  });
});
