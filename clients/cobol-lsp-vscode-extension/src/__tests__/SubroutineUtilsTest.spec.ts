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
import {resolveSubroutineURI} from "../services/util/SubroutineUtils";
import {searchInWorkspace} from "../services/util/FSUtils";
import {COBOL_EXT_ARRAY} from "../constants";

describe("SubroutineUtils", () => {
    it("search in workspace by name", () => {
        const folders = ['folder'];
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(folders),
        });
        (searchInWorkspace as any) = jest.fn().mockReturnValue("theURI");

        const uri = resolveSubroutineURI("name");
        expect(uri).toBe("theURI");
        expect(searchInWorkspace).toBeCalledWith("name", folders, COBOL_EXT_ARRAY)
    });
});
