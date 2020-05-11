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
import { Prioritizer } from "../services/Prioritizer";
import { SettingsUtils } from "../services/settings/util/SettingsUtils";

const prioritizer: Prioritizer = new Prioritizer();
const FILENAME1: string = "test.cpy";
const FILENAME2: string = "mama.cpy";
const FILENAME3: string = "tata";
let FILENAME_URI1: string = "";
let FILENAME_URI2: string = "";
let FILENAME_URI3: string = "";

beforeAll(() => {
    FILENAME_URI1 = createFile(FILENAME1);
    FILENAME_URI2 = createFile(FILENAME2);
    FILENAME_URI3 = createFile(FILENAME3);
    SettingsUtils.getWorkspacesURI = jest.fn().mockReturnValue(["file://"]);
});

afterAll(() => {
    return deleteTempFile([FILENAME_URI1, FILENAME_URI2, FILENAME_URI3]);
});

describe("ConfigurationSwitcher tests", () => {
    test("check if copybooks are present local", () => {
        prioritizer.checkCopybooksPresentLocal([FILENAME1, FILENAME2], [FILENAME_URI1, FILENAME_URI2, "./src"]);
        expect(prioritizer.getLocalCpyURI().length).toBe(2);
    });

    test("copybook is found even without extension", () => {
        prioritizer.checkCopybooksPresentLocal([FILENAME3], [FILENAME_URI3]);
        expect(prioritizer.getLocalCpyURI().length).toBe(1);
    });
});

describe("Negative scenario test", () => {
    test("Path is not provided and method should return empty list", () => {
        prioritizer.checkCopybooksPresentLocal([FILENAME1], []);
        expect(prioritizer.getLocalCpyURI().length).toBe(0);
    });
});

function createFile(filename: string): string {
    fs.writeFile(path.join(__dirname, filename), "Some dummy content", err => {
        if (err) {
            return null;
        }
    });
    return path.resolve(__dirname, filename);
}

function deleteTempFile(filenames: string[]) {
    filenames.forEach(filename => {
        const filePath: string = path.resolve(filename);
        if (fs.existsSync(filePath)) {
            fs.unlinkSync(filePath);
        }
    });
}
