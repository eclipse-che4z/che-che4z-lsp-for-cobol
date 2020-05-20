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

import {convertError, Type, ZoweError} from "../services/ZoweError";
import { RestClientError } from "@zowe/imperative";

describe("ZoweError", () => {
    it("convertError don't change ZoweError", () => {
        const zoweError = new ZoweError("MSG", Type.General);
        const result = convertError(zoweError);
        expect(result).toBe(zoweError);
    });
    it("convertError don't change Error", () => {
        const theError = new Error("MGS");
        const result = convertError(theError);
        expect(result).toBe(theError);
    });
    it("convertError converts 401 HTTP error to Invalid credentials", () => {
        const httpError = new RestClientError({errorCode: "401", source: "http", msg: "401 error" });
        const result = convertError(httpError);
        expect(result).toBeInstanceOf(ZoweError);
        expect((<ZoweError>result).type).toBe(Type.InvalidCredentials);
    });
    it("convertError converts 404 HTTP error to Not found", () => {
        const httpError = new RestClientError({errorCode: "404", source: "http", msg: "404 error"});
        const result = convertError(httpError);
        expect(result).toBeInstanceOf(ZoweError);
        expect((<ZoweError>result).type).toBe(Type.NotFound);
    });
    it("convertError converts HTTP ECONNREFUSED errors to ConnRefused", () => {
        const httpError = new RestClientError({source: "http", msg: "Conn refused", causeErrors: {code: "ECONNREFUSED"}});
        const result = convertError(httpError);
        expect(result).toBeInstanceOf(ZoweError);
        expect((<ZoweError>result).type).toBe(Type.ConnRefused);
    });
    it("convertError converts HTTP ENOTFOUND errors to ConnRefused", () => {
        const httpError = new RestClientError({source: "http", msg: "Conn refused", causeErrors: {code: "ENOTFOUND"}});
        const result = convertError(httpError);
        expect(result).toBeInstanceOf(ZoweError);
        expect((<ZoweError>result).type).toBe(Type.ConnRefused);
    });
    it("convertError don't change any other RestClientError's", () => {
        const httpError = new RestClientError({source: "client", msg: "Client error"});
        const result = convertError(httpError);
        expect(result).toBe(httpError);
    });
});
