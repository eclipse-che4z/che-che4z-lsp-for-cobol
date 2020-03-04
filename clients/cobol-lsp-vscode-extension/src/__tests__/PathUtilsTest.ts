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
import { checkWorkspace, createCopybookPath, createDatasetPath } from "../services/PathUtils";

describe("PathUtils tests", () => {
    const fsPath = "/projects";
    const profile = "profile";
    const dataset = "dataset";

    it("creates copybook path", () => {
        vscode.workspace.workspaceFolders = [{uri: {fsPath}} as any];
        expect(createCopybookPath(profile, dataset, "copybook"))
            .toEqual("/projects/.copybooks/profile/dataset/copybook.cpy");
    });
    it("creates dataset path", () => {
        vscode.workspace.workspaceFolders = [{uri: {fsPath}} as any];
        expect(createDatasetPath(profile, dataset)).toEqual("/projects/.copybooks/profile/dataset");
    });
    it("check workspace", () => {
        vscode.workspace.workspaceFolders = [{uri: {fsPath}} as any];
        expect(checkWorkspace()).toEqual(true);
        vscode.workspace.workspaceFolders = [];
        expect(checkWorkspace()).toEqual(false);
    });
});
