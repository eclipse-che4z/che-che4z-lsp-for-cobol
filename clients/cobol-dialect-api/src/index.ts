import * as vscode from "vscode";

const mainExtensionId = "BroadcomMFD.cobol-language-support";
let v1Api: V1Api | undefined = undefined;

/**
 * Retrieve Version 1 of the API
 * @param id id of the extension requesting v1 API
 */
export const getV1Api = async (extensionId: string): Promise<V1Api> => {
  if (!v1Api) {
    const main = vscode.extensions.getExtension<unknown>(mainExtensionId);
    if (main === undefined) {
      throw new Error(
        `Cannot find COBOL Language Support extension ${mainExtensionId}`,
      );
    }
    const api = await main.activate();
    if (
      typeof api !== "object" ||
      api === null ||
      !("version" in api) ||
      typeof api.version !== "string"
    ) {
      throw new Error(
        `The version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not provide API.`,
      );
    }
    if (!("v1" in api)) {
      throw new Error(
        `The version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not provide v1 API: `,
      );
    }
    const v1 = api.v1;
    if (!isV1Api(v1)) {
      throw new Error(
        `The v1 API of the version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not match the expected signature.`,
      );
    }
    v1Api = {
      registerDialect: (dialect: V1DialectDetail): V1Unregister => {
        return v1.registerDialect(extensionId, {
          name: dialect.name,
          description: dialect.description,
          jar: dialect.jar.toString(),
          snippets: dialect.snippets.toString(),
        });
      },
    };
  }

  return v1Api;
};

/**
 * Check that we have v1 api
 */
function isV1Api(api: unknown): api is __ExtensionV1Api {
  if (typeof api !== "object" || api === null || !("registerDialect" in api))
    return false;
  const registerDialect = api.registerDialect;
  if (typeof registerDialect !== "function" || registerDialect.length !== 2)
    return false;
  return true;
}

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Interface provided by {@link mainExtensionId COBOL Language Support extension}.
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 *
 */
export interface __ExtensionApi {
  version: string;
  v1: __ExtensionV1Api;
}
/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 */
export interface __ExtensionV1Api {
  registerDialect(
    extensionId: string,
    dialect: __ExtensionV1DialectDetail,
  ): V1Unregister;
}
/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 */
export interface __ExtensionV1DialectDetail {
  name: string;
  description: string;
  jar: string;
  snippets: string;
}

export interface V1Api {
  registerDialect(dialect: V1DialectDetail): V1Unregister;
}
export interface V1DialectDetail {
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
}
export interface V1Unregister {
  (): void;
}
