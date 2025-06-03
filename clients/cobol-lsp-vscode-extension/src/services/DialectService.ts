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
import { V2StartProcessingHandler } from "@code4z/cobol-dialect-api";
import { LanguageClientService } from "./LanguageClientService";
import { Location } from "vscode";

type DocumentReplacement = {
  range: vscode.Range;
  text: string;
};

export class DialectService {
  private handlers: Map<string, V2StartProcessingHandler> = new Map();
  private replacements: Map<string, Map<string, DocumentReplacement[]>> =
    new Map();
  private diagnosticService: DialectDiagnosticService =
    new DialectDiagnosticService();

  public constructor(
    private languageClientService: LanguageClientService,
    private outputChannel: vscode.OutputChannel,
  ) {
    languageClientService.addNotificationHandler(
      "dialect/process",
      (dialectName: string, programUri: string, text: string) => {
        const handler = this.handlers.get(dialectName);
        if (handler) {
          void handler(programUri, text)
            .then((diagnostics) => {
              this.diagnosticService.publish(
                dialectName,
                programUri,
                diagnostics,
              );
            })
            .finally(() => {
              const key = generateKey(dialectName, programUri);
              const replacementMap = this.replacements.get(key);
              const replacements = replacementMap?.get(programUri) ?? [];

              this.outputChannel.appendLine(
                `Finish Processing for document: ${programUri}`,
              );
              this.outputChannel.appendLine(
                `Replacements count: ${replacements.length}, uri: ${programUri}`,
              );

              void languageClientService
                .getLanguageClient()
                .sendNotification("dialect/finish", {
                  dialectName,
                  programUri,
                  replacements: replacements.map((r) =>
                    this.serializeReplacement(r),
                  ),
                });
              this.replacements.delete(key);
            });
        } else {
          this.outputChannel.appendLine(
            `Handler for the dialect ${dialectName} was not found, dialect processing ignored`,
          );
        }
      },
    );
  }

  public async resolveCopybook(
    dialectName: string,
    programUri: string,
    copybookName: string,
    statementLocation: vscode.Location,
  ): Promise<{ copybookName: string; uri: string; text: string }> {
    const result = await this.languageClientService
      .getLanguageClient()
      .sendRequest("dialect/resolveCopybook", {
        dialectName,
        programUri,
        copybookName,
        statementLocation: this.serializeLocation(statementLocation),
      });
    return result as { copybookName: string; uri: string; text: string };
  }

  public registerStartHandler(name: string, handler: V2StartProcessingHandler) {
    this.handlers.set(name, handler);
  }

  public async insertCopybook(
    dialectName: string,
    programUri: string,
    statementLocation: Location,
    nameLocation: Location,
    copybookUri: string,
  ) {
    const key = generateKey(dialectName, programUri);
    const replacementMap = this.replacements.get(key);
    const replacements = replacementMap?.get(copybookUri) ?? [];

    await this.languageClientService
      .getLanguageClient()
      .sendNotification("dialect/insertCopybook", {
        dialectName,
        programUri,
        statementLocation: this.serializeLocation(statementLocation),
        nameLocation: this.serializeLocation(nameLocation),
        copybookUri,
        replacements: replacements.map((r) => this.serializeReplacement(r)),
      });

    this.outputChannel.appendLine(`Insert Copybook: ${copybookUri}`);
    this.getReplacements(key, copybookUri);

    replacementMap?.set(copybookUri, []);
  }

  public replace(
    dialectName: string,
    programUri: string,
    location: vscode.Location,
    text: string,
  ) {
    const key = generateKey(dialectName, programUri);
    const documentUri = location.uri.toString();
    const replacementMap =
      this.replacements.get(key) ?? new Map<string, DocumentReplacement[]>();

    const replacements = replacementMap.get(documentUri) ?? [];
    replacements.push({ range: location.range, text: text });
    replacementMap.set(documentUri, replacements);
    this.replacements.set(key, replacementMap);

    this.getReplacements(key, documentUri);
  }

  private getReplacements(
    key: string,
    documentUri: string,
  ): DocumentReplacement[] {
    const replacementMap = this.replacements.get(key);
    const replacements = replacementMap?.get(documentUri) ?? [];

    this.outputChannel.appendLine(
      `Replacements count: ${replacements.length}, uri: ${documentUri}`,
    );
    return replacements;
  }

  private serializeLocation(location: vscode.Location) {
    return {
      uri: location.uri.toString(),
      range: {
        start: location.range.start,
        end: location.range.end,
      },
    };
  }

  private serializeReplacement(replacement: DocumentReplacement) {
    return {
      text: replacement.text,
      range: {
        start: replacement.range.start,
        end: replacement.range.end,
      },
    };
  }
}

function generateKey(dialectName: string, programUri: string): string {
  return `${dialectName}:${programUri}`;
}

class DialectDiagnosticService {
  private collections: Map<string, vscode.DiagnosticCollection> = new Map<
    string,
    vscode.DiagnosticCollection
  >();

  public clear(dialectName: string, programUri: string) {
    const key = generateKey(dialectName, programUri);
    const collection = this.collections.get(key);
    collection?.clear();
  }

  public publish(
    dialectName: string,
    programUri: string,
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ) {
    const key = generateKey(dialectName, programUri);
    let collection = this.collections.get(key);
    if (collection === undefined) {
      collection = vscode.languages.createDiagnosticCollection(
        "Dialect Diagnostics",
      );
    }

    collection.clear();
    diagnostics.forEach((diag, uri) =>
      collection.set(vscode.Uri.parse(uri), diag),
    );
    this.collections.set(key, collection);
  }
}
