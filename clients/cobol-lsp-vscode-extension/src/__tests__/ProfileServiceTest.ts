import * as path from "path";
import * as vscode from "vscode";
import {ProfileService} from "../services/ProfileService";

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

describe("Profile Service tests", () => {
    const programName = "programName";
    const profileName = "profileName";

    it("can get profile by program name (path case)", async () => {
        vscode.workspace.textDocuments = [];
        vscode.workspace.textDocuments.push({fileName: "skip.file"} as any);
        vscode.workspace.textDocuments.push({fileName: "skip.cbl"} as any);
        vscode.workspace.textDocuments.push({fileName: path.join(profileName, programName + ".cbl")} as any);
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(undefined),
        });

        const zoweApi: any = {
            listZOSMFProfiles: jest.fn().mockReturnValue({profileName: {}}),
        };
        const profiles: ProfileService = new ProfileService(zoweApi);
        const profile: string = await profiles.getProfileFromDocument(programName);
        expect(profile).toEqual(profileName);
    });
});
