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
import {
    checkWorkspace,
    CopybooksPathGenerator,
    createCopybookPath,
    createDatasetPath,
} from "../services/copybook/CopybooksPathGenerator";

describe("CopybooksPathGenerator tests", () => {
    const fsPath = "/projects";
    const profile = "profile";
    const dataset = "dataset";
    beforeEach(() => {
        (vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath } } as any];
    });

    it("creates copybook path", () => {
        expect(createCopybookPath(profile, dataset, "copybook"))
            .toEqual(path.join("/", "projects", ".c4z", ".copybooks", "profile", "dataset", "copybook.cpy"));
    });
    it("creates dataset path", () => {
        expect(createDatasetPath(profile, dataset)).toEqual(path.join("/projects", ".c4z", ".copybooks", "profile", "dataset"));
    });
    it("check workspace", () => {
        expect(checkWorkspace()).toEqual(true);
        (vscode.workspace.workspaceFolders as any) = [];
        expect(checkWorkspace()).toEqual(false);
    });

    it("generates array of uris", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("profile"),
        });

        const gen: CopybooksPathGenerator = new CopybooksPathGenerator();
        gen.listDatasets = () => Promise.resolve(["DATASET1", "DATASET2"]);
        const result = await gen.listUris();
        expect(result[0].toString()).toContain("/projects/.c4z/.copybooks/profile/DATASET1");
        expect(result[1].toString()).toContain("/projects/.c4z/.copybooks/profile/DATASET2");
    });

    it("lists path based on the datasets to be looked for copybooks", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValueOnce("TEST.DSN").mockReturnValue("/test/uss/path"),
            has: jest.fn().mockReturnValue(true),
        });
        const gen: CopybooksPathGenerator = new CopybooksPathGenerator();
        const response = await gen.listDatasets();
        expect(response).toStrictEqual("TEST.DSN");

        const ussResponse = await gen.listUSSPaths();
        expect(ussResponse).toStrictEqual("/test/uss/path");
    });
});
