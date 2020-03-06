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
import { CopybooksDownloader } from "../CopybooksDownloader";

// tslint:disable: no-unused-expression no-string-literal
describe("Copybook downloader", () => {
    vscode.workspace.workspaceFolders = [{} as any];
    vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
    const profile = "profile";
    it("Can download copybook", async () => {
/* WORK IN PROGRESS
        const zoweApi: any = {
            listZOSMFProfiles: jest.fn().mockReturnValue(["Something"]),
        };
        const profileService: any = {
            getProfile: jest.fn().mockReturnValue(profile),
        };
        const cbd: CopybooksDownloader = new CopybooksDownloader(zoweApi, profileService);
        const uri: any = {};
        (cbd as any).listMissingCopybooks = () => ["COPYBVOOK"];
        try {
            await cbd.downloadDependencies(uri);
            cbd.start();
        } finally {
            cbd.dispose();
        }

        expect(zoweApi.listZOSMFProfiles).toBeCalled();
*/

    });
});
