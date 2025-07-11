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
import { createZoweExplorerMock } from "../../../../__mocks__/getZoweExplorerMock.utility";
import * as vscode from "vscode";
import { readDirectoryResult } from "../../../../__mocks__/vscode";

describe("Tests Copybook download from DNS", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    readDirectoryResult["/profile/dataset"] = ["copybook"];
  });

  describe("checks the copybook download using ZE DSN API's", () => {
    const downloader = new CopybookDownloaderForDsn(createZoweExplorerMock());

    describe("checks eligible copybook invoke appropriate ZE Api's", () => {
      it("checks hasMember adds fetched list to cache when cache doesn't have the member and hasMember uses cache when have member is cached", async () => {
        await downloader.hasMember("profile", "dataset", "copybook");
        const res = await downloader.hasMember(
          "profile",
          "dataset",
          "copybook",
        );
        expect(vscode.workspace.fs.readDirectory).toHaveBeenCalledTimes(1);
        expect(res).toStrictEqual({ extension: ".cpy", name: "copybook" });
      });
    });
  });
});
