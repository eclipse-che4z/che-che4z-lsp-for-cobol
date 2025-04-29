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
  createZoweExplorerMock,
  allMemberMock,
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

  describe("checks the copybook download using ZE DSN API's", () => {
    const downloader = new CopybookDownloaderForDsn(createZoweExplorerMock());

    describe("checks eligible copybook invoke appropriate ZE Api's", () => {
      ProfileUtils.getProfileNameForCopybook = jest
        .fn()
        .mockReturnValue("test-profile");
      SettingsService.getCopybookFileEncoding = jest
        .fn()
        .mockReturnValue("utf8");
      vscode.Uri.joinPath = jest
        .fn()
        .mockReturnValue({ fsPath: "profile/dsn.path/copybook" });

      it("checks hasMember adds fetched list to cache when cache doesn't have the member and hasMember uses cache when have member is cached", async () => {
        await downloader.hasMember("profile", "dataset", "copybook");
        const res = await downloader.hasMember(
          "profile",
          "dataset",
          "copybook",
        );
        expect(allMemberMock).toHaveBeenCalledTimes(1);
        expect(res).toStrictEqual(true);
      });
    });
  });
});
