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

import * as vscode from "vscode";
import {
  DidCloseTextDocumentNotification,
  DidOpenTextDocumentNotification,
  LanguageClient,
} from "vscode-languageclient/node";
import { LANGUAGE_ID } from "../../constants";

/**
 * This class collects utility methods for general purpose activities
 */
export class Utils {
  /**
   * This method provides a quick way to verify if the input is null or undefined.
   * The idea is to have something similar to the util library {@link node.isNullOrUndefined} that is deprecated.
   * @param content the string value target of the validation
   * @return true if the content is not null or undefined, false otherwise
   */
  public static isNullOrUndefined(content: string): boolean {
    return content === null || content === undefined;
  }

  public static async getZoweExplorerAPI(): Promise<IApiRegisterClient> {
    const ext = vscode.extensions.getExtension(
      "Zowe.vscode-extension-for-zowe",
    );
    if (!ext) {
      return Promise.resolve(
        undefined,
      ) as unknown as Promise<IApiRegisterClient>;
    }
    await ext.activate();
    return ext.exports as any;
  }

  /**
   * Handles changes in the closed vscode tabs.
   * This method explicitly fires a 'textDocument/didClose' Notification to the LSP server.
   *
   * @param closedTabs closed tabs
   * @param languageClient Language server client
   */
  public static handleTabClose(
    closedTabs: readonly vscode.Tab[],
    languageClient: LanguageClient,
  ) {
    closedTabs.forEach(async (tab) => {
      const closedTab = tab.input;
      if (Utils.isTextDocument(closedTab)) {
        const closedTabUri = (closedTab as { uri: vscode.Uri }).uri;
        if (!Utils.isUriActiveInAontherTabGroup(closedTabUri.toString()))
          await languageClient.sendNotification(
            DidCloseTextDocumentNotification.type,
            {
              textDocument: {
                uri: closedTabUri.toString(),
              },
            },
          );
      }
    });
  }

  /**
   * Handles changes in the opened vscode tabs.
   * This method explicitly fires a 'textDocument/didOpen' Notification to the LSP server.
   *
   * @param openedTabs opened tabs
   * @param languageClient Language server client
   */
  public static handleTabsOpen(
    openedTabs: readonly vscode.Tab[],
    languageClient: LanguageClient,
  ) {
    openedTabs.forEach(async (tab) => {
      const openedTab = tab.input;
      if (Utils.isTextDocument(openedTab)) {
        const openedTabUri = (openedTab as { uri: vscode.Uri }).uri;
        if (!Utils.isUriActiveInAontherTabGroup(openedTabUri.toString())) {
          let doc = await vscode.workspace.openTextDocument(openedTabUri);
          await languageClient.sendNotification(
            DidOpenTextDocumentNotification.type,
            {
              textDocument: {
                uri: openedTabUri.toString(),
                languageId: LANGUAGE_ID,
                version: doc.version,
                text: doc.getText(),
              },
            },
          );
        }
      }
    });
  }

  /**
   * Checks if the passed object is a valid Text document based on whether it has an uri attribute.
   * @param openedTab object to be analysed
   * @returns a boolean
   */
  public static isTextDocument(openedTab: unknown) {
    return (
      openedTab != null && typeof openedTab === "object" && "uri" in openedTab
    );
  }

  private static isUriActiveInAontherTabGroup(closedTabUri: string) {
    const found = vscode.window.tabGroups.all
      .map((group) => group.tabs)
      .reduce((a, b) => a.concat(b), [])
      .map((tab) => tab.input)
      .filter((input) => Utils.isTextDocument(input))
      .map((input) => (input as { uri: vscode.Uri }).uri.toString())
      .find((input) => input === closedTabUri);
    return typeof found !== "undefined";
  }
}
