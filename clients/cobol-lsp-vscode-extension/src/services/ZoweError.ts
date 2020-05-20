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
