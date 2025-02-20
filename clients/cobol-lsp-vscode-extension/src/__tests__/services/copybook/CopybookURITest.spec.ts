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
import * as vscode from "vscode";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { Utils } from "../../../services/util/Utils";
import { asMutable } from "../../../test/suite/testHelper";
import {
  EndevorConfigModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "../../../services/ProcessorGroupsLoader";

Utils.getZoweExplorerAPI = jest.fn();

describe("CopybooksPathGenerator tests", () => {
  const fsPath = "/projects";
  const profile = "profile";
  const dataset = "dataset";

  beforeEach(() => {
    asMutable(vscode.workspace).workspaceFolders = [
      { uri: { fsPath } } as unknown as vscode.WorkspaceFolder,
    ];
  });

  it("creates copybook path", () => {
    expect(
      CopybookURI.createCopybookPath(
        [profile],
        dataset,
        "copybook",
        "downloadFolder",
      ),
    ).toEqual("downloadFolder/zowe/copybooks/profile/dataset/copybook");
  });
  it("creates dataset path", () => {
    expect(
      CopybookURI.createDatasetPath([profile], dataset, "downloadFolder"),
    ).toEqual({ path: "downloadFolder/zowe/copybooks/profile/dataset" });
  });
  it("create paths for copybooks of processsor groups definitions", () => {
    const pgConfigs: (
      | ZoweDatasetConfigModel
      | ZoweUssConfigModel
      | EndevorConfigModel
    )[] = [
      { dataset: "dataset" },
      { dataset: "dataset2", profile: "profile" },
      { ussFile: "ussFile" },
      { ussFile: "ussFile2", profile: "profile" },
      {
        environment: "ENV",
        system: "SYSTEM",
        subsystem: "SUBSYSTEM",
        profile: "instance.connection",
        stage: "1",
        type: "COPY",
      },
    ];

    expect(
      CopybookURI.createProcessorGroupCopybookPaths(
        pgConfigs,
        "/storagePath",
        "defaultProfile",
      ),
    ).toStrictEqual([
      "/storagePath/zowe/copybooks/defaultProfile/dataset",
      "/storagePath/zowe/copybooks/profile/dataset2",
      "/storagePath/zowe/copybooks/defaultProfile/ussFile",
      "/storagePath/zowe/copybooks/profile/ussFile2",
      "/storagePath/e4e/copybooks/instance.internal.connection/ENV/1/SYSTEM/SUBSYSTEM/COPY/MAP",
    ]);
  });
});
