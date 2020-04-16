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

import {SettingsParser} from "../services/settings/SettingsParser";

const settingsParser: SettingsParser = new SettingsParser();

//TODO: VSC APIs are not testable with Jest!!!
// vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
//     get: jest.fn().mockReturnValue(profileName),
// });

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

    test("parse a setting file without the key 'location' return an empty list", () => {
        assertParseOf({"key": []}, 0);
    });
});

describe("test parse method with allowed setting configurations", () => {
    test("parse a setting file with key 'location' return the values in an array", () => {
        assertParseOf({"broadcom-cobol-lsp.cpy-manager.location": ["HLQ.TEST.COPYBOOK"]}, 1);
    });

    test("parse a setting file with etherogeneous keys with the key 'location' return the value in an array", () => {
        assertParseOf({"key": "value", "broadcom-cobol-lsp.cpy-manager.location": ["HLQ.TEST.COPYBOOK"]}, 1);
    });

});

function assertParseOf(value: any, expectedListSize: number) {
    expect(settingsParser.resolveLocations(JSON.stringify(value)).length).toBe(expectedListSize);
}
