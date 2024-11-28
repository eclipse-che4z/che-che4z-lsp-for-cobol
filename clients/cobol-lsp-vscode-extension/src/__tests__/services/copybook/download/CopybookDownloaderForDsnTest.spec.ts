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

import { CopybookDownloaderForDsn } from "../../../../services/copybook/downloader/CopybookDownloaderForDsn";
import { ProfileUtils } from "../../../../services/util/ProfileUtils";
import {
  zoweExplorerMock,
  allMemberMock,
  getContentMock,
} from "../../../../__mocks__/getZoweExplorerMock.utility";
import * as vscode from "vscode";
import { TextEncoder } from "util";
import { SettingsService } from "../../../../services/Settings";

describe("Tests Copybook download from DNS", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    jest
      .spyOn(vscode.workspace.fs, "readFile")
      .mockReturnValue(
        Promise.resolve(new TextEncoder().encode("copybook content")),
      );
  });

  describe("checks if the copybook is eligible to dowload passed on user settings", () => {
    const downloader = new CopybookDownloaderForDsn(
      "storage-path",
      zoweExplorerMock,
    );
    beforeEach(() => {
      jest.clearAllMocks();
    });

    it("checks eligibility based on profile settings", () => {
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue(undefined);
      let isEligible = downloader.isEligibleForDownload(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        "DNS.PATH",
      );
      expect(isEligible).toBeFalsy();
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("test-profile");
      isEligible = downloader.isEligibleForDownload(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        "DNS.PATH",
      );
      expect(isEligible).toBeTruthy();
    });

    it("checks eligibility based on DSN settings", () => {
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("test-profile");
      let isEligible = downloader.isEligibleForDownload(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        undefined,
      );
      expect(isEligible).toBeFalsy();
      isEligible = downloader.isEligibleForDownload(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        "DNS.PATH",
      );
      expect(isEligible).toBeTruthy();
    });
  });

  describe("checks the copybook download using ZE DSN API's", () => {
    const downloader = new CopybookDownloaderForDsn(
      "storage-path",
      zoweExplorerMock,
    );
    it("checks not eligible copybook are not downloaded", async () => {
      downloader.isEligibleForDownload = jest.fn().mockReturnValue(false);
      const isDowloaded = await downloader.downloadCopybook(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        "DNS.PATH",
      );
      expect(isDowloaded).toBeFalsy();
    });

    it("checks eligible copybook which are not present in the DSN provided do not invoke ZE Api's", async () => {
      downloader.isEligibleForDownload = jest.fn().mockReturnValue(true);
      const isDowloaded = await downloader.downloadCopybook(
        { name: "copybook-name", dialect: "COBOL" },
        "document-uri",
        "DNS.PATH",
      );
      expect(isDowloaded).toBeFalsy();
    });

    describe("checks eligible copybook invoke appropriate ZE Api's", () => {
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("test-profile");
      downloader.isEligibleForDownload = jest.fn().mockReturnValue(true);
      SettingsService.getCopybookFileEncoding = jest
        .fn()
        .mockReturnValue("utf8");
      vscode.Uri.joinPath = jest
        .fn()
        .mockReturnValue({ fsPath: "profile/dsn.path/copybook" });

      it("checks appropriate call for ZE API's", async () => {
        downloader.clearMemberListCache();
        const isDowloaded = await downloader.downloadCopybook(
          { name: "copybook", dialect: "COBOL" },
          "document-uri",
          "DNS.PATH",
        );
        expect(allMemberMock).toHaveBeenCalledWith("DNS.PATH");
        expect(getContentMock).toHaveBeenCalledWith("DNS.PATH(copybook)", {
          file: "profile/dsn.path/copybook",
          binary: true,
          returnEtag: true,
        });
        expect(isDowloaded).toBeTruthy();
      });

      it("checks cache is used if download is trigged again for same profile and dataset", async () => {
        // trigger download again and check cache impl
        const isDowloaded = await downloader.downloadCopybook(
          { name: "copybook", dialect: "COBOL" },
          "document-uri",
          "DNS.PATH",
        );
        // cache resolves the members
        expect(allMemberMock).not.toHaveBeenCalled();
        expect(getContentMock).toHaveBeenCalledWith("DNS.PATH(copybook)", {
          file: "profile/dsn.path/copybook",
          binary: true,
          returnEtag: true,
        });
        expect(isDowloaded).toBeTruthy();
      });
    });
  });
});
