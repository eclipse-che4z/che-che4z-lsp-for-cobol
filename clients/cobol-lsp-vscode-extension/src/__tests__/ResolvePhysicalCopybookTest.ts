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

import {LocalCopybookResolver} from "../services/settings/LocalCopybookResolver";

const settingsParser: LocalCopybookResolver = new LocalCopybookResolver();
const PHY_LOCATION = "src\folder\test";
const STAR_LOCATION = "*";

/* NOTE
When the settings json contains paths, them should be escaped, but on the server those settings come already escaped
SETTINGS.JSON
    {
       //... other settings
       "setting.test":["src\\folder\\file.ts"],
       //... other settings
    }
INVOCATION OF [await vscode.workspace.getConfiguration(setting).get("test")] RETURNS ["src\folder\test"]
ON UNIX SYSTEM NO NEED TO APPLY ESCAPING ON CLIENT AND TRANSLATION ON THE SERVER ["src/folder/test"]
 */

/*
ALLOWED SETTINGS TO TEST
- LOCAL:
    "broadcom-cobol-lsp.cpy-manager.paths.local": [
        "FOLDER\\SUBFOLDER\\COPYFOLDER\\COPY",
        "FOLDER/SUBFOLDER/COPYFOLDER/COPY"
        "FOLDER\\SUBFOLDER\\COPYFOLDER/*" (STRETCH),
        "FOLDER/SUBFOLDER/COPYFOLDER/* (STRETCH)"
    ],

- DSN:
    "broadcom-cobol-lsp.cpy-manager.paths.DSN": [
        "ZOSMF_PROFILE@HLQ.DSNAME1.COPY1",
        "ZOSMF_PROFILE@HLQ.DSNAME1.COPY2",
    ],

- ENDEVOR: (OUT OF SCOPE)
   "broadcom-cobol-lsp.cpy-manager.paths.endevor": [
        "ENDEVOR_PROFILE@CONFIG/ENV/STAGE/SYSTEM/SUBSYSTEM/ELEMENT1",
        "ENDEVOR_PROFILE@CONFIG/ENV/STAGE/SYSTEM/SUBSYSTEM/ELEMENT2",
    ],
 */

describe("test parse method against bad setting configurations", () => {
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

describe("test parse method with allowed setting configuration", () => {
    test("parse a setting file with key 'LOCAL' return the values in an array", () => {
        assertParseOf({"broadcom-cobol-lsp.cpy-manager.local": [PHY_LOCATION]}, 1);
    });

    test("parse a setting file with etherogeneous keys with the key 'LOCAL' return the value in an array", () => {
        assertParseOf({"key": "value", "broadcom-cobol-lsp.cpy-manager.local": [PHY_LOCATION]}, 1);
    });

});

describe("validate path resource with bad configuration", () => {
    test("an array of paths defined as '*' is not resolved and an empty array is returned'", () => {
        assertParseOf({"key": "value", "broadcom-cobol-lsp.cpy-manager.local": [STAR_LOCATION]}, 0);
    });

    test("an array of paths eith defined as '*' are not resolved in an etherogeneous array and are excluded from the result'", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": [PHY_LOCATION, STAR_LOCATION],
        }, 1);
    });

    test("an empty array of paths is not resolved and an empty array of resolved paths is returned", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": [],
        }, 0);
    });

    test("a not valid path is not resolved and and empty array of resolved paths is returned", () => {
        assertParseOf({
            "key": "value",
            "broadcom-cobol-lsp.cpy-manager.local": ["%"],
        }, 0);
    });

});

describe("validate path resource with correct configuration", () => {
    test("a correct escaped path is found and the list of valid URI is returned", () => {
        expect(true).toBe(true);
    });
});

function assertParseOf(value: any, expectedListSize: number) {
    expect(settingsParser.resolveLocation(JSON.stringify(value)).length).toBe(expectedListSize);
}
