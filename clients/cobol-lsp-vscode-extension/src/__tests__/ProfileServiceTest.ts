import { ProfileService } from "../services/ProfileService";

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
import { updateProfileActionDesc } from "@zowe/imperative";

describe("Profile Service tests", () => {
    const programName = "programName";
    const profileName = "profileName";

    it("can get profile by program name (path casae)", async () => {
        vscode.workspace.textDocuments = [];
        vscode.workspace.textDocuments.push({ fileName: "skip.file" } as any);
        vscode.workspace.textDocuments.push({ fileName: "skip.cbl" } as any);
        vscode.workspace.textDocuments.push({ fileName: path.join(profileName, programName + ".cbl") } as any);
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(undefined),
        });

        const zoweApi: any = {
            listZOSMFProfiles: jest.fn().mockReturnValue({ profileName: {} }),
        };
        const profiles: ProfileService = new ProfileService(zoweApi);
        const profile: string = await profiles.getProfile(programName);
        expect(profile).toEqual(profileName);
    });

    it("can get profile by program name (settings casae)", async () => {
        vscode.workspace.textDocuments = [];
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(profileName),
        });
        const zoweApi: any = {
            listZOSMFProfiles: jest.fn().mockReturnValue({ profileName: {} }),
        };
        const profiles: ProfileService = new ProfileService(zoweApi);
        const profile: string = await profiles.getProfile(programName);
        expect(profile).toEqual(profileName);
    });
    it("can ask user to provide profile", async () => {
        const updateFn = jest.fn();
        vscode.workspace.textDocuments = [];
        vscode.window.showQuickPick = jest.fn().mockReturnValue({label: profileName});
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(undefined),
            update: updateFn,
        });
        const zoweApi: any = {
            getDefaultProfileName: jest.fn(),
            listZOSMFProfiles: jest.fn().mockReturnValue({ profileName: {}, ßotherProfile: {} }),
        };
        const profiles: ProfileService = new ProfileService(zoweApi);
        const profile: string = await profiles.getProfile(programName);
        expect(profile).toEqual(profileName);
        expect(updateFn).toBeCalledTimes(1);
    });
});
