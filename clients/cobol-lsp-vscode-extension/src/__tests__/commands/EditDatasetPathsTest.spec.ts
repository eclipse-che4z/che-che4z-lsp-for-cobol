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
import {editDatasetPaths, listPathDatasets} from "../../commands/EditDatasetPaths";
import { SettingsService } from "../../services/Settings";

const testData: string = "testDataset1,testDataSet2 ";

describe("Test editDatasetPaths", () => {
    let showInput;
    beforeEach(() => {
        showInput = jest.fn();
        vscode.window.showInputBox = showInput;
        SettingsService.setDsnPath = jest.fn();
        SettingsService.setDsnPath = jest.fn();
    });
    test("test editDatasetPaths is defined", () => {
        expect(editDatasetPaths).toBeTruthy();
    });
    test("Test editDatasetPaths is invoked without any error", async () => {
        SettingsService.getDsnPath = jest.fn().mockReturnValue([]);
        showInput.mockResolvedValue(testData);
        await editDatasetPaths();
        const input: string[] = testData.split(",").map(e => e.trim());
        expect(SettingsService.setDsnPath).toBeCalledWith(input);
    });
    test("Test editDatasetPaths do nothing if the dataset names are not provided" , async () => {
        SettingsService.getDsnPath = jest.fn().mockReturnValue([]);
        showInput.mockResolvedValue(null);
        await editDatasetPaths();
        expect(SettingsService.setDsnPath).not.toBeCalled();
    });
});

describe("Validate capability to return a list of dataset from settings.json", () => {
    test("Given a not defined property in setting json, empty list of dataset is returned", async () => {
        SettingsService.getDsnPath = jest.fn().mockReturnValue([]);

        const result = await listPathDatasets();
        expect(result.length).toBe(0);
    });

    test("Given a list of dataset defined in the settings.json, a not empty result list is returned to the caller", async () => {
        SettingsService.getDsnPath = jest.fn().mockReturnValue(["HLQ.DSNAME1", "HLQ.DSNAME2"]);

        const result = await listPathDatasets();
        expect(result.length).toBe(2);
    });
});
