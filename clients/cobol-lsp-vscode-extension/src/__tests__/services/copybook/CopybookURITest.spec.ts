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

  it("creates dataset path", () => {
    expect(
      CopybookURI.createDatasetPath(
        [profile],
        dataset,
        vscode.Uri.file("/downloadFolder"),
      ),
    ).toEqual(
      vscode.Uri.file("/downloadFolder/zowe/copybooks/profile/dataset"),
    );
  });
});
