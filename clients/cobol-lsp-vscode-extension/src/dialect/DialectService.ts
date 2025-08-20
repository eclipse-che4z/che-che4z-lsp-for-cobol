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
import { SETTINGS_DIALECT } from "../constants";
import type {
  IDocumentProcessingContext,
  V2StartProcessingHandler,
} from "@code4z/cobol-dialect-api";
import { LanguageClientService } from "../services/LanguageClientService";
import { Location, workspace } from "vscode";
import {
  readFileContent,
  resolveCopybookURI,
} from "../services/copybook/CopybookMessageHandler";

type RangePayload = {
  start: {
    line: number;
    character: number;
  };
  end: {
    line: number;
    character: number;
  };
};

type LocationPayload = {
  uri: string;
  range: RangePayload;
};

type DocumentReplacementPayload = {
  text: string;
  range: RangePayload;
};

type CopybookPayload = {
  copybookName: string;
  statementLocation: LocationPayload;
  nameLocation: LocationPayload;
  uri: string;
  text: string;
  replacements: DocumentReplacementPayload[];
  copybooks: CopybookPayload[];
};

type DocumentReplacement = {
  range: vscode.Range;
  text: string;
};

type CopybookInfo = {
  copybookName: string;
  statementLocation: Location;
  nameLocation: Location;
  uri: vscode.Uri;
  text: string;
};

class Context implements IDocumentProcessingContext {
  replacements: DocumentReplacement[] = [];
  children: Context[] = [];

  constructor(
    private dialectService: DialectService,
    private dialectName: string,
    private programUri: vscode.Uri,
    private documentUri: vscode.Uri,
    public copybookInfo?: CopybookInfo,
  ) {}

  async resolveCopybook(
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
  > {
    const statementLocation = new vscode.Location(
      this.documentUri,
      statementRange,
    );
    const nameLocation = new vscode.Location(this.documentUri, nameRange);

    const copybookInfo = await this.dialectService.resolveCopybook(
      this.programUri.toString(),
      this.dialectName,
      copybookName,
      statementLocation,
      nameLocation,
    );

    if (copybookInfo) {
      const copybookContext = new Context(
        this.dialectService,
        this.dialectName,
        this.programUri,
        copybookInfo.uri,
        copybookInfo,
      );
      this.children.push(copybookContext);
      copybookContext.copybookInfo = copybookInfo;

      return {
        context: copybookContext,
        uri: copybookInfo.uri,
        text: copybookInfo.text,
      };
    }
    return undefined;
  }
  replace(range: vscode.Range, text: string): void {
    const location = new Location(this.documentUri, range);
    const replacement: DocumentReplacement = {
      range: location.range,
      text: text,
    };
    this.replacements.push(replacement);
  }
}

export class DialectService {
  private handlers: Map<string, V2StartProcessingHandler> = new Map();

  private diagnosticService: DialectDiagnosticService =
    new DialectDiagnosticService();

  public constructor(
    context: vscode.ExtensionContext,
    languageClientService: LanguageClientService,
    private outputChannel?: vscode.OutputChannel,
  ) {
    const disposableChangeConfig = vscode.workspace.onDidChangeConfiguration(
      (event) => {
        if (event.affectsConfiguration(SETTINGS_DIALECT))
          this.diagnosticService.clear();
      },
    );
    context.subscriptions.push(disposableChangeConfig);

    const disposableCloseDocument = vscode.workspace.onDidCloseTextDocument(
      (event) => this.diagnosticService.clearDialectCollection(event.uri),
    );
    context.subscriptions.push(disposableCloseDocument);

    languageClientService.addRequestHandler(
      "dialect/process",
      async (dialectName: string, programUri: vscode.Uri, text: string) => {
        const handler = this.handlers.get(dialectName);
        if (handler) {
          const context: Context = new Context(
            this,
            dialectName,
            programUri,
            programUri,
          );

          try {
            const diagnostics = await handler(context, programUri, text);
            this.diagnosticService.publish(
              dialectName,
              programUri.toString(),
              diagnostics,
            );
          } catch (e) {
            this.outputChannel?.appendLine(
              `Dialect ${dialectName} processing fails. Cause: ${JSON.stringify(e)}`,
            );
            throw e;
          }

          const result = this.serializeResults(programUri, context);

          return result;
        } else {
          this.outputChannel?.appendLine(
            `Handler for the dialect ${dialectName} was not found, dialect processing ignored`,
          );
          return undefined;
        }
      },
    );
    this.addConfigWatcher(".cobolplugin/pgm_conf.json", () =>
      this.diagnosticService.clear(),
    );
    this.addConfigWatcher(".cobolplugin/proc_grps.json", () =>
      this.diagnosticService.clear(),
    );
  }

  private addConfigWatcher(path: string, func: () => void) {
    const watcher = workspace.createFileSystemWatcher(path);
    watcher.onDidChange((_uri) => func());
    watcher.onDidDelete((_uri) => func());
    watcher.onDidCreate((_uri) => func());
  }

  public clearDiagnostic() {
    this.diagnosticService.clear();
  }

  public registerStartHandler(
    dialectName: string,
    handler: V2StartProcessingHandler,
  ) {
    this.handlers.set(dialectName, handler);
  }

  public unregisterStartHandler(dialectName: string) {
    this.handlers.delete(dialectName);
  }

  public async resolveCopybook(
    programUri: string,
    dialectName: string,
    copybookName: string,
    statementLocation: vscode.Location,
    nameLocation: vscode.Location,
  ): Promise<CopybookInfo | undefined> {
    const copybookUri = await resolveCopybookURI(
      programUri,
      copybookName,
      dialectName,
    );

    this.outputChannel?.appendLine(
      `Resolve copybook name: ${copybookName}, result: ${copybookUri}`,
    );

    if (copybookUri === undefined) {
      return undefined;
    }
    const text = await readFileContent(copybookUri);

    if (text === undefined) {
      return undefined;
    }

    const copybookInfo: CopybookInfo = {
      copybookName: copybookName,
      statementLocation: statementLocation,
      nameLocation: nameLocation,
      uri: vscode.Uri.parse(copybookUri),
      text: text,
    };
    return copybookInfo;
  }

  private serializeContext(context: Context): CopybookPayload | undefined {
    const copybooks: CopybookPayload[] = [];
    if (context.copybookInfo === undefined) {
      return undefined;
    }

    this.outputChannel?.appendLine(
      `Copybook name: ${context.copybookInfo.copybookName}, children count: ${context.children.length}`,
    );
    context.children.forEach((c) => {
      const payload = this.serializeContext(c);
      if (payload) {
        copybooks.push(payload);
      }
    });

    return {
      copybookName: context.copybookInfo.copybookName,
      nameLocation: serializeLocation(context.copybookInfo.nameLocation),
      statementLocation: serializeLocation(
        context.copybookInfo.statementLocation,
      ),
      replacements: context.replacements.map((r) => serializeReplacement(r)),
      uri: context.copybookInfo.uri.toString(),
      text: context.copybookInfo.text,
      copybooks: copybooks,
    };
  }

  private serializeResults(programUri: vscode.Uri, context: Context) {
    this.outputChannel?.appendLine(
      `Finish Processing for document: ${programUri.toString()}`,
    );
    this.outputChannel?.appendLine(
      `Replacements count: ${context.replacements.length}`,
    );
    const copybooks: CopybookPayload[] = [];
    context.children.forEach((c) => {
      const payload = this.serializeContext(c);
      if (payload) {
        copybooks.push(payload);
      }
    });

    return {
      replacements: context.replacements.map((r) => serializeReplacement(r)),
      copybooks: copybooks,
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

  public clear() {
    this.collections.forEach((value, __key) => {
      value.clear();
    });
  }

  public clearDialectCollection(programUri: vscode.Uri) {
    const programUriKey = `:${programUri.toString()}`;
    this.collections.forEach((value, key) => {
      if (key.endsWith(programUriKey)) {
        value.clear();
      }
    });
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
        `${dialectName} Dialect Diagnostics`,
      );
    }

    collection.clear();
    diagnostics.forEach((diag, uri) =>
      collection.set(vscode.Uri.parse(uri), diag),
    );
    this.collections.set(key, collection);
  }
}

function serializePosition(position: vscode.Position) {
  return {
    line: position.line,
    character: position.character,
  };
}

function serializeRange(range: vscode.Range) {
  return {
    start: serializePosition(range.start),
    end: serializePosition(range.end),
  };
}

function serializeLocation(location: vscode.Location): LocationPayload {
  return {
    uri: location.uri.toString(),
    range: serializeRange(location.range),
  };
}

function serializeReplacement(
  replacement: DocumentReplacement,
): DocumentReplacementPayload {
  return {
    text: replacement.text,
    range: serializeRange(replacement.range),
  };
}
