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
import { DialectActivator, DialectRegistry } from "../../services/DialectRegistry";

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

describe("DialectActivator test", () => {
    const config = {
        get: function(path: string) {
            return [{ name: "dialect", path: "path", description: "" }];
        },
        update: jest.fn().mockReturnValue("")
    };

    beforeEach(() => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue(config);
    });

    it("does not wait for dialect if it already registered", async () => {
        let spy = jest.spyOn(config, "get");
        let remainSpy = jest.spyOn(DialectActivator as any, "getRemainDialects");
        remainSpy.mockClear();

        DialectActivator.waitForDialects(["dialect"], 200);
        expect(spy).toBeCalled();
        expect(remainSpy).toBeCalledTimes(1);
    });

    it("waits for dialect to register and throw error on timeout", async () => {
        let spy = jest.spyOn(config, "get");
        let remainSpy = jest.spyOn(DialectActivator as any, "getRemainDialects");
        remainSpy.mockClear();

        await DialectActivator.waitForDialects(["dialect1", "dialect2"], 100).catch(e => {
            expect(e).toBeDefined();
        });

        expect(spy).toBeCalled();
        expect(remainSpy).toBeCalledTimes(2);
    });

});