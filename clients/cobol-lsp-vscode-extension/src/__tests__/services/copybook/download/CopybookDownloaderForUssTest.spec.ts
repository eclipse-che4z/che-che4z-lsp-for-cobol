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

import { ProfileUtils } from "../../../../services/util/ProfileUtils";
import {
  createZoweExplorerMock,
  allUSSFilemembers,
  getUSSContentsMock,
} from "../../../../__mocks__/getZoweExplorerMock.utility";
import * as vscode from "vscode";
import { TextEncoder } from "util";
import { SettingsService } from "../../../../services/Settings";
import { CopybookDownloaderForUss } from "../../../../services/copybook/downloader/CopybookDownloaderForUss";

describe("Tests Copybook download from USS", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    jest
      .spyOn(vscode.workspace.fs, "readFile")
      .mockReturnValue(
        Promise.resolve(new TextEncoder().encode("copybook content")),
      );
  });

  describe("checks if the copybook is eligible to dowload passed on user settings", () => {
    beforeEach(() => {
      jest.clearAllMocks();
    });

    it("checks eligibility based on DSN settings", () => {
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("test-profile");
    });
  });

  describe("checks the copybook download using ZE USS API's", () => {
    beforeEach(() => {
      jest
        .spyOn(SettingsService, "getCopybookExtension")
        .mockResolvedValue([".cpy", ""]);
    });

    const downloader = new CopybookDownloaderForUss(
      "storage-path",
      createZoweExplorerMock(),
    );
    it("checks not eligible copybook are not downloaded", async () => {
      const isDowloaded = await downloader.downloadCopybook(
        { name: "copybook-name", dialect: "COBOL" },
        "/uss/path",
        "profile",
        [""],
      );
      expect(isDowloaded).toBeFalsy();
    });

    it("checks eligible copybook which are not present in the DSN provided do not invoke ZE Api's", async () => {
      const isDowloaded = await downloader.downloadCopybook(
        { name: "copybook-name", dialect: "COBOL" },
        "/uss/path",
        "profile",
        [""],
      );
      expect(isDowloaded).toBeFalsy();
    });

    describe("checks eligible copybook invoke appropriate ZE Api's", () => {
      beforeEach(() => {
        jest
          .spyOn(ProfileUtils, "getProfileNameForCopybook")
          .mockReturnValue("test-profile");

        jest
          .spyOn(SettingsService, "getCopybookFileEncoding")
          .mockReturnValue("utf8");
        jest
          .spyOn(SettingsService, "getCopybookExtension")
          .mockResolvedValue([".cpy", ""]);
        jest.spyOn(vscode.Uri, "joinPath").mockReturnValue({
          fsPath: "profile/uss/path/copybook",
        } as unknown as vscode.Uri);
      });

      it("checks appropriate invokation of ZE API's", async () => {
        downloader.clearMemberListCache();
        const isDowloaded = await downloader.downloadCopybook(
          { name: "uss_copybook", dialect: "COBOL" },
          "/uss/path",
          "profile",
          [""],
        );
        expect(allUSSFilemembers).toHaveBeenCalledWith("/uss/path");
        expect(getUSSContentsMock).toHaveBeenCalledWith(
          "/uss/path/uss_copybook",
          {
            file: "profile/uss/path/copybook",
            binary: true,
            returnEtag: true,
          },
        );
        expect(isDowloaded).toBeTruthy();
      });

      it("checks cache is used if download is trigged again for same profile and uss path", async () => {
        const isDowloaded = await downloader.downloadCopybook(
          { name: "uss_copybook", dialect: "COBOL" },
          "/uss/path",
          "profile",
          [""],
        );
        // cache resolves the members
        expect(allUSSFilemembers).not.toHaveBeenCalled();
        expect(getUSSContentsMock).toHaveBeenCalledWith(
          "/uss/path/uss_copybook",
          {
            file: "profile/uss/path/copybook",
            binary: true,
            returnEtag: true,
          },
        );
        expect(isDowloaded).toBeTruthy();
      });
      it("checks hasMember adds fetched list to cache when cache doesn't have the member and checks hasMember uses cache when have member is cached", async () => {
        await downloader.hasMember("profile", "ussFile", "uss_copybook");
        const res = await downloader.hasMember(
          "profile",
          "ussFile",
          "uss_copybook",
        );
        expect(allUSSFilemembers).toHaveBeenCalledTimes(1);
        expect(res).toStrictEqual(true);
      });
    });
  });
});
