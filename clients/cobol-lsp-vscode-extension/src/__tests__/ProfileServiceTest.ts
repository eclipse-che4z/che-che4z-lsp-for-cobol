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
import {ProfileService} from "../services/ProfileService";

describe("Profile Service tests", () => {
    const programName = "programName";
    const profileName = "profileName";
    vscode.workspace.textDocuments = [];
    vscode.workspace.textDocuments.push({fileName: "skip.file"} as any);
    vscode.workspace.textDocuments.push({fileName: "skip.cbl"} as any);
    const textDocument: any = {fileName: path.join(profileName, programName + ".cbl")};

    function setupScenario(zProfileObject: any, profileNameFromSettings: string, textDocumentItem?: any) {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(profileNameFromSettings),
        });

        if (textDocumentItem) {
            vscode.workspace.textDocuments.push(textDocumentItem);
        }

        const zoweApi: any = {
            listZOSMFProfiles: jest.fn().mockReturnValue(zProfileObject),
        };
        return new ProfileService(zoweApi);
    }

    it("can get profile by program name (path case)", async () => {
        const profiles = setupScenario({profileName: {}}, undefined, textDocument);
        expect(await profiles.getProfileFromDocument(programName)).toEqual(profileName);
    });

    it("Given a not empty profile defined in settings, the resolve API will return that profile", async () => {
        const profiles: ProfileService = setupScenario({
            ["profileName"]: profileName,
        }, profileName);
        expect(await profiles.resolveProfile(programName)).toEqual(profileName);
    });

    it("Given an empty profile value in settings, but opening a file with profile in the path, that profile is returned", async () => {
        const profiles: ProfileService = setupScenario({profileName: {}}, undefined, {fileName: path.join(profileName, programName + ".cbl")});
        expect(await profiles.resolveProfile(programName)).toEqual(profileName);
    });

    it("If profile is not defined in settings and is not part of the document URI, undefined value is returned", async () => {
        const profiles: ProfileService = setupScenario({}, undefined);
        expect(await profiles.resolveProfile(programName)).toBe(undefined);

    });
});
