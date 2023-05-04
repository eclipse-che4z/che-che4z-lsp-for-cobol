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
import * as path from "path";
import * as vscode from "vscode";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { Utils } from "../../../services/util/Utils";

Utils.getZoweExplorerAPI = jest.fn();

describe("CopybooksPathGenerator tests", () => {
  const fsPath = "/projects";
  const profile = "profile";
  const dataset = "dataset";
  (vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath } } as any];

  it("creates copybook path", () => {
    expect(
      CopybookURI.createCopybookPath(profile, dataset, "copybook"),
    ).toEqual(
      path.join(
        "/",
        "projects",
        ".c4z",
        ".copybooks",
        "profile",
        "dataset",
        "copybook.cpy",
      ),
    );
  });
  it("creates dataset path", () => {
    expect(CopybookURI.createDatasetPath(profile, dataset)).toEqual(
      path.join("/projects", ".c4z", ".copybooks", "profile", "dataset"),
    );
  });
});
