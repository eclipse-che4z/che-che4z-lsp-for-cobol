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
import { RestClientError } from "@zowe/imperative";

export function convertError(error: any): Error {
    if (error instanceof RestClientError) {
        switch (+error.mDetails.errorCode) {
            case 401:
                return new ZoweError("Invalid credentials", Type.InvalidCredentials);
            case 404:
                return new ZoweError("Not found", Type.NotFound);
        }
        if (error.mDetails.causeErrors != null &&
            (error.mDetails.causeErrors.code === "ECONNREFUSED" ||
             error.mDetails.causeErrors.code === "ENOTFOUND")) {
            return new ZoweError(`Connection refused to ${error.mDetails.host}:${error.mDetails.port}`,
                Type.ConnRefused);
        }
    }
    return error;
}

export class ZoweError extends Error {
    constructor(message: string, public type: Type = Type.General) {
        super(message);
    }
}

export enum Type {
    General,
    NoPassword,
    InvalidCredentials,
    ConnRefused,
    NotFound,
}
