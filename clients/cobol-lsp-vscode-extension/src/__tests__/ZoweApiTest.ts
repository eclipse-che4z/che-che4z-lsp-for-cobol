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

import { BasicProfileManager, Session } from "@zowe/imperative";
import { ZoweApi } from "../services/ZoweApi";
import { Type, ZoweError } from "../services/ZoweError";
jest.mock("@zowe/imperative");

beforeEach(() => {
    (BasicProfileManager as any).mockClear();
});

describe("ZoweApi", () => {
    it("throw No Password error if profile don't have a password", async () => {
        (BasicProfileManager as any).load = jest.fn().mockResolvedValue({profile: {password: ""}});
        const zoweApi = new ZoweApi();
        const expectedError = new ZoweError("No password", Type.NoPassword);
        expect(zoweApi.createSession("zoweProfile")).rejects.toEqual(expectedError);
    });
    it("createSession works fine if password is set", async () => {
        (BasicProfileManager as any).load = jest.fn().mockResolvedValue({profile: {password: "secret"}});
        const zoweApi = new ZoweApi();
        expect(zoweApi.createSession("zoweProfile")).resolves.toBeInstanceOf(Session);
    });
});
