import * as vscode from "vscode";

const mainExtensionId = "BroadcomMFD.cobol-language-support";

interface V1DialectDetail {
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
}

interface V1Unregister {
  (): void;
}

interface V1Api {
  registerDialect(extensionId: string, dialect: V1DialectDetail): V1Unregister;
}

/**
 * Basic `type guard` that we have v1 api
 */
function isV1Api(api: unknown): api is V1Api {
  if (typeof api !== "object" || api === null || !("registerDialect" in api))
    return false;
  const registerDialect = api.registerDialect;
  if (typeof registerDialect !== "function" || registerDialect.length !== 2)
    return false;
  return true;
}

const v1RegisterDialect = async (
  extensionId: string,
  dialect: V1DialectDetail,
): Promise<V1Unregister> => {
  const main = vscode.extensions.getExtension<unknown>(mainExtensionId);
  if (main === undefined) {
    throw new Error(
      `Cannot find COBOL Language Support extension ${mainExtensionId}`,
    );
  }
  const api = await main.activate();
  if (typeof api !== "object" || api === null || !("v1" in api)) {
    throw new Error(
      `The version of COBOL Language Support extension ${mainExtensionId} you have installed does not provide v1 API: `,
    );
  }
  const v1 = api.v1;
  if (!isV1Api(v1)) {
    throw new Error(
      `The v1 API of the version of COBOL Language Support extension ${mainExtensionId} you have installed does not match expected signature.`,
    );
  }
  return v1.registerDialect(extensionId, dialect);
};

/**
 * Version 1 of the API to register dialect
 */
export const v1 = {
  registerDialect: v1RegisterDialect,
};

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Interface exported by {@link mainExtensionId COBOL Language Support extension}.
 * Imported from the COBOL Language Support extenension for cross type checking.
 *
 */
export interface ExtensionApi {
  version: string;
  v1: V1Api;
}
