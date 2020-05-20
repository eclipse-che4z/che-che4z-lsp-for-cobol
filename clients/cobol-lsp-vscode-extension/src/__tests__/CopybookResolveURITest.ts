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

//import * as fs from "fs";
import * as fs from "fs-extra";
import * as path from "path";
import {CopybookResolveURI} from "../services/CopybookResolveURI";
import {SettingsUtils} from "../services/settings/util/SettingsUtils";
const copybookName: string = "NSTCOPY1";
const copybookResolverUri: CopybookResolveURI = new CopybookResolveURI();
const folderPath = path.join(__dirname, ".cobdeps");
createDirectory(folderPath);
createFile(copybookName);
SettingsUtils.getWorkspacesURI = jest.fn().mockReturnValue(["file://" + __dirname]);

// file utils
function createFile(filename: string): string {

    fs.writeFile(path.join(folderPath, filename), "Some dummy content", err => {
        if (err) {
            return null;
        }
    });
    return path.resolve(folderPath, filename);
}

function removeFolder(pathFile: string) {
    fs.remove(pathFile);
}



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



describe("Resolve local copybook present in one or more folders specified by the user", () => {
    test("given a folder that contains the target copybook, it is found and its uri is returned", () =>{
        expect(copybookResolverUri.searchCopybookLocally(copybookName, [".cobdeps"])).toBeDefined();
        removeFolder(folderPath);
        //todo: REMOVE FOLDER AND FILE
        // removeFolder(FILE_URI);
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

