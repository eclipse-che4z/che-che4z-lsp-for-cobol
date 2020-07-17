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

import * as vscode from "vscode";
import {
    DSN_CONTAINS_PROHIBITED_CHAR,
    DSN_MUSTBE_NOT_EMPTY,
    DSN_NOMORE_8CHARS,
    DSN_START_PROHIBITED_CHAR,
    SEGMENT_PLACEHOLDER,
} from "../constants";
import {PathsService, validateDatasetNames} from "../services/PathsService";

let pathService: PathsService;
beforeAll(() => {
    pathService = new PathsService();
});

describe("Validate capability to return a list of dataset from settings.json", () => {
    test("Given a not defined property in setting json, empty list of dataset is returned", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            has: jest.fn().mockReturnValue(false),
        });

        const result = await pathService.listPathDatasets();
        expect(result.length).toBe(0);
    });

    test("Given a list of dataset defined in the settings.json, a not empty result list is returned to the caller", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(["HLQ.DSNAME1", "HLQ.DSNAME2"]),
            has: jest.fn().mockReturnValue(true),
        });

        const result = await pathService.listPathDatasets();
        expect(result.length).toBe(2);
    });
});

describe("Validate dataset name against bad configurations", () => {
    test("Given a empty value as dataset name, the UI returns an appropriate message", () => {
        expect(validateDatasetNames("")).toBe(DSN_MUSTBE_NOT_EMPTY);
    });

    test("Given a dataset with more than 8 chars, the UI returns an appropriate message", () => {
        expect(validateDatasetNames("ALONGDATASETMORETHANEIGHTCHARS")).toBe(DSN_NOMORE_8CHARS);
    });

    test("Given a dataset with a prohibited char at the beginning, the UI returns an appropriate message", () => {
        expect(validateDatasetNames("1DSN")).toBe(DSN_START_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, "1DSN"));
    });

    test("Given a dataset that contains a prohibited char, the UI returns an appropriate message", () => {
        expect(validateDatasetNames("HLQ!DSN")).toBe(DSN_CONTAINS_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, "HLQ!DSN"));
    });
});

describe("Validate dataset name against correct input from the user", () => {
    test("Given a dataset no longer than 8 chars, the UI will not throw any notification message to the user", () => {
        expect(validateDatasetNames("DSN")).toBeUndefined();
    });

    test("Given a correct dataset configuration, the UI will not throw any notification message to the user", () => {
        expect(validateDatasetNames("HLQ.DSNAME1")).toBeUndefined();
    });
});
