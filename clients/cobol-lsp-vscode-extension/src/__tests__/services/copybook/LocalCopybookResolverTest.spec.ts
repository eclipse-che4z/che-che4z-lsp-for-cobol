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

import * as fs from "fs";
import * as path from "path";
import {PATHS_LOCAL_KEY, SETTINGS_CPY_SECTION} from "../../../constants";
import {LocalCopybookResolver} from "../../../services/copybook/LocalCopybookResolver";
import {SettingsUtils} from "../../../services/util/SettingsUtils";

const settingsParser: LocalCopybookResolver = new LocalCopybookResolver();
const STAR_LOCATION = "*";
const FILENAME: string = "test.cbl";

beforeAll(() => {
    const FILENAME_URI = createFile();
    const fileDirectoryURI: string = path.dirname(FILENAME_URI);
    SettingsUtils.findUriScheme = jest.fn().mockReturnValue("file");
    SettingsUtils.getWorkspaceFoldersPath = jest.fn().mockReturnValue([fileDirectoryURI]);
});

afterAll(() => {
    return deleteTempFile();
});

describe("test parse method against bad setting configuration", () => {
    test("parse a not valid settings file returns an empty list", () => {
        assertParseOf(100, 0);
    });

    test("parse an undefined settings file returns an empty list", () => {
        assertParseOf(undefined, 0);
    });

    test("parse an empty setting file returns an empty list", () => {
        assertParseOf({}, 0);
    });


    test("parse a setting file without the key 'LOCAL' return an empty list", () => {
        assertParseOf({"key": []}, 0);
    });
});

describe("test parse method with correct setting configuration", () => {
    test("parse a setting file with key 'LOCAL' return the values in an array", () => {
        assertParseOf({"cobol-lsp.cpy-manager.paths-local": [FILENAME]}, 1);
    });

    test("parse a setting file with heterogeneous keys that include the key 'LOCAL' return the LOCAL's values in an array", () => {
        assertParseOf({"key": "value", "cobol-lsp.cpy-manager.paths-local": [FILENAME]}, 1);
    });

});

describe("validate bad path resource", () => {
    test("an array of paths defined as '*' is not resolved and an empty array is returned'", () => {
        assertResourceContent([STAR_LOCATION], 0);
    });

    test("an array of paths defined where an item is '*' is not resolved within an heterogeneous array and is excluded from the result", () => {
        assertResourceContent([FILENAME, STAR_LOCATION], 1);
    });

    test("an empty array of paths is resolved in an empty array returned", () => {
        assertResourceContent([], 0);
    });

    test("a not valid path is not resolved and excluded from the result array", () => {
        assertResourceContent(["%"], 0);
    });

    test("a not valid path is not resolved and excluded from the result array within an heterogeneous array", () => {
        assertResourceContent(["%", FILENAME], 1);
    });

    test("A resource with double slashes (or back slashes) are normalized before apply the search", () => {
        assertResourceContent([FILENAME.split("\\").join("//")], 1);
    });

});

describe("validate path resource with correct configuration", () => {
    it("an escaped path is found on FS and its URI is returned in the result list", () => {
        assertParseOf(prepareJson(), 1);
    });

    it("a valid path written two times is included in the list only one time", () => {
        assertParseOf({
            "key": "value",
            "cobol-lsp.cpy-manager.paths-local": [FILENAME, FILENAME],
        }, 1);
    });

});

function createFile(): string {
    fs.writeFile(FILENAME, "Some dummy content", err => {
        if (err) {
            return null;
        }
    });
    return path.resolve(FILENAME);
}

function deleteTempFile() {
    const filePath: string = path.resolve(FILENAME);
    if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
    }
}

function prepareJson() {
    if (FILENAME === null) {
        throw new Error("File not found");
    }

    return {
        "key": "value",
        "cobol-lsp.cpy-manager.paths-local": [FILENAME],
    };
}

function assertParseOf(value: any, expectedSizeList: number) {
    expect(resolveCopybooksFromJSON(JSON.stringify(value)).length).toBe(expectedSizeList);
}

function assertResourceContent(list: string[], expectedSizeList: number) {
    expect(settingsParser.resolve(list).length).toBe(expectedSizeList);
}

function resolveCopybooksFromJSON(json: string): string[] {
    if (SettingsUtils.isValidJSON(json)) {
        return settingsParser.resolve(JSON.parse(json)[SETTINGS_CPY_SECTION + "." + PATHS_LOCAL_KEY]);
    }
    return [];
}
