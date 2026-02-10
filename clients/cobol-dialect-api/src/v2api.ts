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
import { type CopyStatementParser, MainExtensionId } from "./common";

let v2Api: V2Api | undefined = undefined;

export enum ItemType {
  VARIABLE = "VARIABLE",
  PROCEDURE = "PROCEDURE",
}

export type Token = {
  name: string;
  range: vscode.Range;
};

export type Item = {
  tokens: Token[];
  type?: "VARIABLE" | "PROCEDURE";
};

/**
 * Code for missing copybook diagnostics
 */
export const CODE_MISSING_COPYBOOK: string = "missing copybook";

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
        `Update to the latest version of COBOL Language Support to use API features.`,
      );
    }
    if (!("v2" in api)) {
      return new Error(
        `Update to the latest version of COBOL Language Support to use API features.`,
      );
    }
    const v2 = api.v2;
    if (!isV2Api(v2)) {
      return new Error(
        `The v2 API of COBOL Language Support (${main.id}) version ${main.packageJSON.version} does not match the expected signature.`,
      );
    }
    v2Api = {
      registerDialect: async (
        dialect: V2DialectDetail,
        handler: V2StartProcessingHandler,
      ): Promise<vscode.Disposable | Error> => {
        try {
          return await v2.registerDialect(
            extensionId,
            {
              name: dialect.name,
              description: dialect.description,
              snippets: dialect.snippets,
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
  ): Promise<vscode.Disposable | Error>;
}

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 */
export interface __ExtensionV2DialectDetail {
  name: string;
  description: string;
  snippets: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
}

export interface V2Api {
  registerDialect(
    dialect: V2DialectDetail,
    handler: V2StartProcessingHandler,
  ): Promise<vscode.Disposable | Error>;
}

export interface V2DialectDetail {
  name: string;
  description: string;
  snippets: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
}

export type V2StartProcessingHandler = (
  context: IDocumentProcessingContext,
  programUri: vscode.Uri,
  text: string,
) => Promise<void>;

export interface IDocumentProcessingContext {
  resolveCopybook(
    copybookName: string,
    statementRange: vscode.Range,
    nameRange: vscode.Range,
  ): Promise<
    | {
        context: IDocumentProcessingContext;
        uri: vscode.Uri;
        text: string;
      }
    | undefined
  >;
  replace(range: vscode.Range, text: string): void;
  replaceWithMap(
    range: vscode.Range,
    statementRange: vscode.Range,
    tokenItems: Item[],
    replacementMap: string,
  ): void;
  addDiagnostic(diagnostic: vscode.Diagnostic): void;
}
