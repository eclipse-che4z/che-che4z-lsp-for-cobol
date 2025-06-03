/*
 * Copyright (c) 2025 Broadcom.
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
import {
  type CopyStatementParser,
  MainExtensionId,
  type V1Unregister,
} from "./common";

let v2Api: V2Api | undefined = undefined;

/**
 * Retrieve Version 1 of the API
 * @param id id of the extension requesting v1 API
 */
export const getV2Api = async (extensionId: string): Promise<V2Api | Error> => {
  if (!v2Api) {
    const main = vscode.extensions.getExtension<unknown>(MainExtensionId);
    if (main === undefined) {
      return new Error(
        `Cannot find COBOL Language Support extension ${MainExtensionId}`,
      );
    }
    const api = await main.activate();
    if (
      typeof api !== "object" ||
      api === null ||
      !("version" in api) ||
      typeof api.version !== "string"
    ) {
      return new Error(
        `The version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not provide API.`,
      );
    }
    if (!("v2" in api)) {
      return new Error(
        `The version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not provide v2 API: `,
      );
    }
    const v2 = api.v2;
    if (!isV2Api(v2)) {
      return new Error(
        `The v2 API of the version ${main.packageJSON.version} of COBOL Language Support extension ${main.id} you have installed does not match the expected signature.`,
      );
    }
    v2Api = {
      registerDialect: async (
        dialect: V2DialectDetail,
        handler: V2StartProcessingHandler,
      ): Promise<V1Unregister | Error> => {
        try {
          return await v2.registerDialect(
            extensionId,
            {
              name: dialect.name,
              description: dialect.description,
              snippets: dialect.snippets.toString(),
              isCopyStatement: dialect.isCopyStatement,
            },
            handler,
          );
        } catch (error) {
          if (error instanceof Error) return error;
          if (typeof error === "string") return new Error(error);
          if (
            error !== null &&
            typeof error === "object" &&
            "toString" in error
          )
            return new Error(error.toString());
          return new Error("Dialect registration failed with an unknown error");
        }
      },
      resolveCopybook: async (
        dialectName: string,
        programUri: string,
        copybookName: string,
        statementLocation: vscode.Location,
      ): Promise<{ copybookName: string; uri: string; text: string }> => {
        return await v2.resolveCopybook(
          dialectName,
          programUri,
          copybookName,
          statementLocation,
        );
      },
      insertCopybook: async (
        dialectName: string,
        programUri: string,
        statementLocation: vscode.Location,
        nameLocation: vscode.Location,
        copybookUri: string,
      ) => {
        await v2.insertCopybook(
          dialectName,
          programUri,
          statementLocation,
          nameLocation,
          copybookUri,
        );
      },
      replace: (
        dialectName: string,
        programUri: string,
        location: vscode.Location,
        text: string,
      ) => {
        v2.replace(dialectName, programUri, location, text);
      },
    };
  }
  return v2Api;
};

/**
 * Check that we have v1 api
 */
function isV2Api(api: unknown): api is __ExtensionV2Api {
  if (typeof api !== "object" || api === null || !("registerDialect" in api))
    return false;
  const registerDialect = api.registerDialect;
  if (typeof registerDialect !== "function" || registerDialect.length !== 3)
    return false;

  if (!("resolveCopybook" in api)) return false;
  const resolveCopybook = api.resolveCopybook;
  if (typeof resolveCopybook !== "function" || resolveCopybook.length !== 4)
    return false;

  if (!("insertCopybook" in api)) return false;
  const insertCopybook = api.insertCopybook;
  if (typeof insertCopybook !== "function" || insertCopybook.length !== 5)
    return false;

  if (!("replace" in api)) return false;
  const replace = api.replace;
  if (typeof replace !== "function" || replace.length !== 4) return false;

  return true;
}

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 */
export interface __ExtensionV2Api {
  registerDialect(
    extensionId: string,
    dialect: __ExtensionV2DialectDetail,
    handler: V2StartProcessingHandler,
  ): Promise<V1Unregister | Error>;
  resolveCopybook(
    dialectName: string,
    programUri: string,
    copybookName: string,
    statementLocation: vscode.Location,
  ): Promise<{ copybookName: string; uri: string; text: string }>;
  insertCopybook(
    dialectName: string,
    programUri: string,
    statementLocation: vscode.Location,
    nameLocation: vscode.Location,
    copybookUri: string,
  ): Promise<void>;
  replace(
    dialectName: string,
    programUri: string,
    location: vscode.Location,
    text: string,
  ): void;
}

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 */
export interface __ExtensionV2DialectDetail {
  name: string;
  description: string;
  snippets: string;
  isCopyStatement?: CopyStatementParser;
}

export interface V2Api {
  registerDialect(
    dialect: V2DialectDetail,
    handler: V2StartProcessingHandler,
  ): Promise<V1Unregister | Error>;
  resolveCopybook(
    dialectName: string,
    programUri: string,
    copybookName: string,
    statementLocation: vscode.Location,
  ): Promise<{ copybookName: string; uri: string; text: string }>;
  insertCopybook(
    dialectName: string,
    programUri: string,
    statementLocation: vscode.Location,
    nameLocation: vscode.Location,
    copybookUri: string,
  ): Promise<void>;
  replace(
    dialectName: string,
    programUri: string,
    location: vscode.Location,
    text: string,
  ): void;
}

export interface V2DialectDetail {
  name: string;
  description: string;
  snippets: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
}

export type V2StartProcessingHandler = (
  programUri: string,
  text: string,
) => Promise<Map<string, vscode.Diagnostic[]>>;
