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

import { Uri } from "vscode";
import * as vscode from "vscode";
import { SETTINGS_DIALECT } from "../constants";
import type { CopyStatementParser } from "@code4z/cobol-dialect-api";

export const DIALECT_REGISTRY_SECTION = "cobol-lsp.dialect.registry";

export type ProtocolVersion = 1 | 2;

/**
 * Holds information about registered dialect
 */
export type DialectInfo = (
  | { protocolVersion: 1; uri: Uri }
  | { protocolVersion: 2 }
) & {
  name: string;
  description: string;
  extensionId: string;
  snippetUri: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
};

const dialectInfoes: Map<string, DialectInfo> = new Map();

/**
 * DialectRegistry provides read/write dialect settings functionality
 */
export class DialectRegistry {
  /**
   * Gets registered dialect infoes
   * @returns list of dialect info structures
   */
  public static getDialects(): DialectInfo[] {
    return Array.from(dialectInfoes.values());
  }

  /**
   * List of dialect infoes filtered to only dialects enabled in VSCode settings
   */
  public static getActiveDialects(): DialectInfo[] {
    const activeDialectsNames: string[] | undefined = vscode.workspace
      .getConfiguration()
      .get(SETTINGS_DIALECT);
    const registeredDialects = DialectRegistry.getDialects();
    const activeDialects = registeredDialects.filter((dialect) =>
      activeDialectsNames?.includes(dialect.name),
    );
    return activeDialects;
  }

  /**
   * Clears the registry
   */
  public static clear() {
    dialectInfoes.clear();
  }

  /**
   * Registers dialect in the system
   * @param name of a dialect
   * @param uri is a path to jar file
   * @param description of a dialect
   * @param extensionId is an extension id
   * @param snippets is a snippet map for a dialect
   * @param isCopyStatement function to identify and parse COPY statement of a dialect
   */
  public static registerV1(
    extensionId: string,
    name: string,
    uri: Uri,
    description: string,
    snippetPath: string,
    isCopyStatement?: CopyStatementParser,
  ) {
    const dialectInfo: DialectInfo = {
      name: name,
      uri: uri,
      protocolVersion: 1,
      description: description,
      extensionId: extensionId,
      snippetUri: vscode.Uri.file(snippetPath),
      isCopyStatement: isCopyStatement,
    };
    dialectInfoes.set(dialectInfo.name, dialectInfo);
  }

  /**
   * Registers dialect in the system
   * @param name of a dialect
   * @param description of a dialect
   * @param extensionId is an extension id
   * @param snippets is a snippet map for a dialect
   * @param isCopyStatement function to identify and parse COPY statement of a dialect
   */
  public static registerV2(
    extensionId: string,
    name: string,
    description: string,
    snippets: vscode.Uri,
    isCopyStatement?: CopyStatementParser,
  ) {
    const dialectInfo: DialectInfo = {
      name: name,
      protocolVersion: 2,
      description: description,
      extensionId: extensionId,
      snippetUri: snippets,
      isCopyStatement: isCopyStatement,
    };
    dialectInfoes.set(dialectInfo.name, dialectInfo);
  }

  /**
   * Unregisters dialect from the system
   * @param name of a dialect
   */
  public static unregister(name: string) {
    dialectInfoes.delete(name);
  }
}
