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

import * as ProfileUtils from "../../../../services/util/ProfileUtils";
import * as vscode from "vscode";
import { TextEncoder } from "util";
import { SettingsService } from "../../../../services/Settings";
import { CopybookDownloaderForUss } from "../../../../services/copybook/downloader/CopybookDownloaderForUss";
import { readDirectoryResult } from "../../../../__mocks__/vscode";

describe("Tests Copybook download from USS", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    jest
      .spyOn(vscode.workspace.fs, "readFile")
      .mockReturnValue(
        Promise.resolve(new TextEncoder().encode("copybook content")),
      );

    readDirectoryResult["/profile/ussFile"] = [
      ["uss_copybook.cpy", vscode.FileType.File],
    ];
  });

  describe("checks if the copybook is eligible to dowload passed on user settings", () => {
    beforeEach(() => {
      jest.clearAllMocks();
    });

    it("checks eligibility based on DSN settings", () => {
      jest
        .spyOn(ProfileUtils, "getProfileNameForCopybook")
        .mockReturnValue("test-profile");
    });
  });

  describe("checks the copybook download using ZE USS API's", () => {
    let downloader: CopybookDownloaderForUss;
    beforeEach(() => {
      jest
        .spyOn(SettingsService, "getCopybookExtension")
        .mockResolvedValue([".cpy", ""]);
      downloader = new CopybookDownloaderForUss();
    });

    describe("checks eligible copybook invoke appropriate ZE Api's", () => {
      beforeEach(() => {
        jest
          .spyOn(ProfileUtils, "getProfileNameForCopybook")
          .mockReturnValue("test-profile");

        jest
          .spyOn(SettingsService, "getCopybookFileEncoding")
          .mockReturnValue("utf8");
      });

      it("checks hasMember adds fetched list to cache when cache doesn't have the member and checks hasMember uses cache when have member is cached", async () => {
        await downloader.hasMember("profile", "/ussFile", "uss_copybook", [
          ".cpy",
          "",
        ]);
        const res = await downloader.hasMember(
          "profile",
          "/ussFile",
          "uss_copybook",
          [".cpy", ""],
        );
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(1);
        expect(res).toStrictEqual({ extension: ".cpy", name: "uss_copybook" });
      });
    });
  });
});
