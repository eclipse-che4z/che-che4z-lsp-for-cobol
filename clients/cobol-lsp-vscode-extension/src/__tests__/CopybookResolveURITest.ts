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

//TODO: create copybook folder with copy file
//TODO: after all delete the folder

import {CopybookResolveURI} from "../services/CopybookResolveURI";
import * as fs from "fs";
import * as path from "path";
import {SettingsUtils} from "../services/settings/util/SettingsUtils";
const copybookName: string = "NSTCOPY1";
const copybookResolverUri: CopybookResolveURI = new CopybookResolveURI();
const folderPath = path.join(__dirname, ".cobdeps");

const FILE_URI: string = createFile(copybookName);
const fileDirectoryURI = path.dirname(FILE_URI);
SettingsUtils.getWorkspacesURI = jest.fn().mockReturnValue(["file://" + fileDirectoryURI]);


describe("Resolve local copybook against bad configuration of target folders", () => {
    test("given an undefined value as list of folders, the copybook is not retrieved", () => {
        expect(copybookResolverUri.searchCopybookLocally(copybookName, undefined)).toBe(undefined);
    });

    test("given an empty list of folders, the copybook is not retrieved", () => {
        expect(copybookResolverUri.searchCopybookLocally(copybookName, [])).toBe(undefined);
    });

    test("given a folder that not contains copybook, the target copybook is not retrieved", () => {
        expect(copybookResolverUri.searchCopybookLocally(copybookName, [__dirname])).toBe(undefined);
    });
});


function createDirectory(targetPath: string) {
    fs.promises.mkdir(targetPath, { recursive: true }).catch(console.log);
}

function createFile(filename: string): string {
        createDirectory(folderPath);
        fs.writeFile(path.join(folderPath, filename), "Some dummy content", err => {
            if (err) {
                return null;
            }
        });
        return path.resolve(folderPath, filename);
    }

function deleteTempFile(pathFile: string) {
    const filePath: string = path.resolve(pathFile);
    if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
    }
}

describe("Resolve local copybook present in one or more folders specified by the user", () => {
    test("given a folder that contains the target copybook, it is found and its uri is returned", () =>{

        expect(copybookResolverUri.searchCopybookLocally(copybookName, [path.relative(__dirname, FILE_URI)])).toBeDefined();
        //todo: REMOVE FOLDER AND FILE
        // deleteTempFile(FILE_URI);
    });
});

//
// describe("Resolve local copybook found exactly in one folder", () => {
//     test("TODO", () => {
//     });
// });
//
// describe("Resolve local copybook defined in multiple folders but returned only once", () => {
//     test("TODO", () => {
//     });
// });
//
// describe("Resolve local copybook defined in multiple places", () => {
//     test("TODO", () => {
//     });
// });

