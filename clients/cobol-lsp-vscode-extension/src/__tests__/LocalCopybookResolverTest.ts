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
import {LocalCopybookResolver} from "../services/settings/LocalCopybookResolver";

const settingsParser: LocalCopybookResolver = new LocalCopybookResolver();
const STAR_LOCATION = "*";
const FILENAME: string = "test.cbl";
let FILENAME_URI: string = "";

beforeAll(() => {
    FILENAME_URI = createFile();
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
        assertParseOf({"broadcom-cobol-lsp.cpy-manager.local": [FILENAME_URI]}, 1);
    });

    test("parse a setting file with etherogeneous keys that include the key 'LOCAL' return the LOCAL's values in an array", () => {
        assertParseOf({"key": "value", "broadcom-cobol-lsp.cpy-manager.local": [FILENAME_URI]}, 1);
    });

});

describe("validate bad path resource", () => {
    test("an array of paths defined as '*' is not resolved and an empty array is returned'", () => {
        assertParseOf({"key": "value", "broadcom-cobol-lsp.cpy-manager.local": [STAR_LOCATION]}, 0);
    });

    test("an array of paths defined where an item is '*' is not resolved within an etherogeneous array and is excluded from the result", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": [FILENAME_URI, STAR_LOCATION],
        }, 1);
    });

    test("an empty array of paths is resolved in an empty array returned", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": [],
        }, 0);
    });

    test("a not valid path is not resolved and excluded from the result array", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": ["%"],
        }, 0);
    });

    test("a not valid path is not resolved and excluded from the result array within an etherogeneous array", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": ["%", FILENAME_URI],
        }, 1);
    });
});

describe("validate path resource with correct configuration", () => {
    it("an escaped path is found on FS and its URI is returned in the result list", () => {
        assertParseOf(prepareJson(), 1);
    });

    it("a valid path written two times is included in the list only one time", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": [FILENAME_URI, FILENAME_URI],
        }, 1);
    });

});

function createFile(): string {
    //TODO: check if is possible improve it..
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
    if (FILENAME_URI === null) {
        throw new Error("URI not found");
    }

    return {
        "key": "value",
        "broadcom-cobol-lsp.cpy-manager.local": [FILENAME_URI],
    };
}

function assertParseOf(value: any, expectedSizeList: number) {
    expect(settingsParser.resolveCopybooks(JSON.stringify(value)).length).toBe(expectedSizeList);
}
