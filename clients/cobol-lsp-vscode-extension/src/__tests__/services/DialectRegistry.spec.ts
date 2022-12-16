/*
 * Copyright (c) 2022 Broadcom.
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

import * as vscode from "../../__mocks__/vscode";
import { DialectRegistry } from "../../services/DialectRegistry";

describe("DialectRegistry test", () => {
    const config = {
        get: function(path: string) {
            return [{ name: "dialect", path: "path", description: "" }];
        },
        update: jest.fn().mockReturnValue("")
    };

    beforeEach(() => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue(config);
    });

    it("register new dialect in the registry", () => {
        let spy = jest.spyOn(config, "update");

        DialectRegistry.register("new", "path", "desc", "dialectId");
        expect(spy).toBeCalled();
    });

    it("retrieve dialects from the registry", () => {
        let spy = jest.spyOn(config, "get");

        const result = DialectRegistry.getDialects();
        expect(spy).toBeCalled();
        
        expect(result.length).toBe(1);
        expect(result[0].name).toBe("dialect");
    });
});
