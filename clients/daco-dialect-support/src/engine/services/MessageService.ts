/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";

type Messages = Record<string, string>;

export class MessageService {
  private readonly messages: Messages;

  public constructor(messages: Messages) {
    this.messages = messages;
  }

  public static async create(context: vscode.ExtensionContext) {
    const uri = vscode.Uri.joinPath(
      context.extensionUri,
      "resources",
      "en.json",
    );
    const data = await vscode.workspace.fs.readFile(uri);
    const messages = JSON.parse(Buffer.from(data).toString("utf8"));

    return new MessageService(messages);
  }

  public get(key: string, ...args: unknown[]): string {
    const template = this.messages[key];

    if (!template) {
      throw new Error(`Missing message: ${key}`);
    }

    return this.format(template, args);
  }

  private format(template: string, args: unknown[]): string {
    return template.replaceAll(/{(\d+)}/g, (_, index) => {
      return args[index] === undefined ? `{${index}}` : String(args[index]);
    });
  }
}
