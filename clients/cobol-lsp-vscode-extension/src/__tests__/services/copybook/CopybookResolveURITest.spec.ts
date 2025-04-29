/*
 * Copyright (c) 2020 Broadcom.
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
import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import { ZOWE_FOLDER } from "../../../constants";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { SettingsService } from "../../../services/Settings";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { SettingsUtils } from "../../../services/util/SettingsUtils";

const copybookName: string = "NSTCOPY1";
const copybookNameWithExtension: string = "NSTCOPY2.CPY";
const CPY_FOLDER_NAME = ".cobcopy";
const folderPath = path.join(__dirname, CPY_FOLDER_NAME);

SettingsUtils.getWorkspaceFoldersPath = jest.fn().mockReturnValue([__dirname]);
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
  get: jest.fn().mockReturnValue(undefined),
});

// file utils
function createFile(filename: string, folderPath: string): string {
  fs.writeFileSync(path.join(folderPath, filename), "Some dummy content");
  return path.resolve(folderPath, filename);
}

function createDirectory(targetPath: string) {
  fs.mkdirSync(targetPath, { recursive: true });
}

function removeFolder(targetPath: string) {
  if (fs.existsSync(targetPath)) {
    return fs.remove(targetPath);
  }
  return false;
}

function buildResultArrayFrom(
  settingsMockValue: string[] | undefined,
  filename: string,
  profileName: string | undefined,
  ussPath: string[] = [],
): number {
  vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValueOnce(settingsMockValue),
  });
  if (ussPath.length > 0) {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(ussPath),
    });
  }
  ProfileUtils.getProfileNameForCopybook = jest
    .fn()
    .mockImplementation(() => profileName);
  const result = CopybookURI.createPathForCopybookDownloaded(
    filename,
    SettingsService.DEFAULT_DIALECT,
    path.join("file:///downloadFolder", ZOWE_FOLDER),
    {} as unknown as IApiRegisterClient,
  );
  return result.length;
}
beforeEach(() => {
  jest.clearAllMocks();
});
beforeAll(() => {
  createDirectory(folderPath);
  createFile(copybookName, folderPath);
  createFile(copybookNameWithExtension, folderPath);
});
afterAll(() => {
  return removeFolder(folderPath);
});

describe("With invalid input parameters, the list of URI that represent copybook downloaded are not generated", () => {
  test("given a profile but no dataset, the result list returned is empty", () => {
    expect(buildResultArrayFrom(undefined, "file:///program", "PRF")).toBe(0);
  });
  test("given a list of dataset but no profile, the result list returned is empty", () => {
    expect(
      buildResultArrayFrom(
        ["HLQ.DATASET1.DATASET2"],
        "file:///program",
        undefined,
      ),
    ).toBe(0);
  });
});
describe("With allowed input parameters, the list of URI that represent copybook downloaded is correctly generated", () => {
  test("given profile and dataset list with one element, the result list is correctly generated with size 1 ", () => {
    expect(
      buildResultArrayFrom(["HLQ.DATASET1.DATASET2"], "file:///program", "PRF"),
    ).toBe(1);
  });
  test("given profile, dataset and USS path, list with one element each, the result list is correctly generated with size 2 ", () => {
    expect(
      buildResultArrayFrom(
        ["HLQ.DATASET1.DATASET2"],
        "file:///program",
        "PRF",
        ["/test/uss/path"],
      ),
    ).toBe(2);
  });
});
