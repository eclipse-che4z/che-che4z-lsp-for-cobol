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
import {editDatasetPaths} from "../commands/EditDatasetPaths";
import { PathsService } from "../services/PathsService";
jest.mock("../services/PathsService");

const testData: string = "testDataset1,testDataSet2 ";
let mockPathService: PathsService;
beforeEach(() => {
    mockPathService = new PathsService();
});

describe("Test editDatasetPaths if the dataset names are provided", () => {
    test("test editDatasetPaths is defined", () => {
        expect(editDatasetPaths).toBeTruthy();
    });
    test("Test editDatasetPaths is invoked without any error", async () => {
        mockPathService.listPathDatasets = () => Promise.resolve([]);
        vscode.window.showInputBox = () => Promise.resolve(testData);
        await editDatasetPaths(mockPathService);
        const input: string[] = testData.split(",").map(e => e.trim());
        expect(mockPathService.setPathDatasets).toBeCalledWith(input);
    });
});

describe("Test editDatasetPaths do nothing if the dataset names are not provided", () => {
    test("Test editDatasetPaths do nothing if the dataset names are not provided" , async () => {
        vscode.window.showInputBox = () => Promise.resolve(null);
        mockPathService.listPathDatasets = () => Promise.resolve([]);
        await editDatasetPaths(mockPathService);
        expect(mockPathService.setPathDatasets).not.toBeCalled();
    });
});
