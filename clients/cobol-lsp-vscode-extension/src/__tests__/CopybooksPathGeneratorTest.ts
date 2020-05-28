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
// tslint:disable-next-line: max-line-length
import { checkWorkspace, CopybooksPathGenerator, createCopybookPath, createDatasetPath} from "../services/CopybooksPathGenerator";

describe("CopybooksPathGenerator tests", () => {
    const fsPath = "/projects";
    const profile = "profile";
    const dataset = "dataset";
    beforeEach(() => {
        vscode.workspace.workspaceFolders = [{ uri: { fsPath } } as any];
    });

    it("creates copybook path", () => {
        expect(createCopybookPath(profile, dataset, "copybook"))
            .toEqual(path.join("/", "projects", ".copybooks", "profile", "dataset", "copybook.cpy"));
    });
    it("creates dataset path", () => {
        expect(createDatasetPath(profile, dataset)).toEqual(path.join("/projects", ".copybooks", "profile", "dataset"));
    });
    it("check workspace", () => {
        expect(checkWorkspace()).toEqual(true);
        vscode.workspace.workspaceFolders = [];
        expect(checkWorkspace()).toEqual(false);
    });

    it("generates array of uris", async () => {
        const profileService: any = {
            getProfile: () => Promise.resolve(profile),
            getProfileFromSettings: () => Promise.resolve(profile),
        };
        const gen: CopybooksPathGenerator = new CopybooksPathGenerator(profileService);
        gen.listDatasets = () => Promise.resolve(["DATASET1", "DATASET2"]);
        const result = await gen.listUris();
        expect(result[0].toString()).toContain("/projects/.copybooks/profile/DATASET1");
        expect(result[1].toString()).toContain("/projects/.copybooks/profile/DATASET2");
    });
});
