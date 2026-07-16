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
 *   Broadcom - initial API and implementation
 */

import * as vscode from "vscode";
import type {
  IDocumentProcessingContext,
  Item,
  Token,
  V2StartProcessingHandler,
} from "@code4z/cobol-dialect-api";
import { LanguageClientService } from "../services/LanguageClientService";
import { Location } from "vscode";
import {
  readFileContent,
  resolveCopybookURI,
  type ZoweCache,
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

type TokenPayload = {
  name: string;
  range: RangePayload;
};

type ItemPayload = {
  tokens: TokenPayload[];
  type?: "VARIABLE" | "PROCEDURE";
};

type DocumentReplacementMapPayload = {
  range: RangePayload;
  statementRange: RangePayload;
  tokenItems: ItemPayload[];
  replacementMap: string;
};

type DocumentInsertionPayload = {
  line: number;
  text: string;
  source?: string;
};

type CopybookPayload = {
  copybookName: string;
  statementLocation: LocationPayload;
  nameLocation: LocationPayload;
  uri: string;
  text: string;
  replacements: DocumentReplacementPayload[];
  replacementMaps: DocumentReplacementMapPayload[];
  insertions: DocumentInsertionPayload[];
  copybooks: CopybookPayload[];
  diagnostics: DiagnosticPayload[];
};

type ServerDiagnosticSeverity = "Error" | "Warning" | "Information" | "Hint";

type DiagnosticPayload = {
  message: string;
  range: RangePayload;
  relatedInformation: RelatedInformationPayload[] | undefined;
  severity: ServerDiagnosticSeverity;
  source: string | undefined;
  tags: number[];
  code: string | undefined;
};

type RelatedInformationPayload = {
  location: LocationPayload;
  message: string;
};

type DocumentReplacement = {
  range: vscode.Range;
  text: string;
};

type DocumentReplacementMap = {
  range: vscode.Range;
  statementRange: vscode.Range;
  tokenItems: Item[];
  replacementMap: string;
};

type DucumentInsertion = {
  line: number;
  text: string;
  source?: string;
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
  replacementMaps: DocumentReplacementMap[] = [];
  insertions: DucumentInsertion[] = [];
  children: Context[] = [];
  diagnostics: vscode.Diagnostic[] = [];

  constructor(
    private readonly dialectService: DialectService,
    private readonly dialectName: string,
    private readonly programUri: vscode.Uri,
    private readonly documentUri: vscode.Uri,
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
  replaceWithMap(
    range: vscode.Range,
    statementRange: vscode.Range,
    tokenItems: Item[],
    replacementMap: string,
  ): void {
    const replacement: DocumentReplacementMap = {
      range: range,
      statementRange: statementRange,
      tokenItems: tokenItems,
      replacementMap: replacementMap,
    };
    this.replacementMaps.push(replacement);
  }
  insert(line: number, text: string, source: string): void {
    this.insertions.push({ line, text, source });
  }
  addDiagnostic(diagnostic: vscode.Diagnostic): void {
    this.diagnostics.push(diagnostic);
  }
}

export class DialectService {
  private readonly handlers: Map<string, V2StartProcessingHandler> = new Map();

  public constructor(
    languageClientService: LanguageClientService,
    private readonly zoweCache?: ZoweCache,
    private readonly outputChannel?: vscode.OutputChannel,
  ) {
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
            await handler(context, programUri, text);
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
    const text = await readFileContent(copybookUri, this.zoweCache);

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
      replacementMaps: context.replacementMaps.map(serializeReplacementMap),
      insertions: context.insertions,
      uri: context.copybookInfo.uri.toString(),
      text: context.copybookInfo.text,
      copybooks: copybooks,
      diagnostics: context.diagnostics.map((d) => serializeDiagnostics(d)),
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
      replacementMaps: context.replacementMaps.map(serializeReplacementMap),
      insertions: context.insertions,
      copybooks: copybooks,
      diagnostics: context.diagnostics.map((d) => serializeDiagnostics(d)),
    };
  }
}

function serializeDiagnostics(d: vscode.Diagnostic): DiagnosticPayload {
  let code = undefined;
  if (typeof d.code === "string") {
    code = d.code;
  }

  return {
    message: d.message,
    range: serializeRange(d.range),
    relatedInformation: serializeRelatedInformation(d.relatedInformation),
    severity: toServerSeverity(d.severity),
    source: d.source,
    tags: d.tags || [],
    code: code,
  };
}

function toServerSeverity(
  severity: vscode.DiagnosticSeverity,
): ServerDiagnosticSeverity {
  switch (severity) {
    case vscode.DiagnosticSeverity.Error:
      return "Error";
    case vscode.DiagnosticSeverity.Warning:
      return "Warning";
    case vscode.DiagnosticSeverity.Information:
      return "Information";
    case vscode.DiagnosticSeverity.Hint:
      return "Hint";
  }
}

function serializeRelatedInformation(
  relatedInformation: vscode.DiagnosticRelatedInformation[] | undefined,
): RelatedInformationPayload[] | undefined {
  return relatedInformation?.map((item) => ({
    message: item.message,
    location: serializeLocation(item.location),
  }));
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

function serializeItem(item: Item) {
  const tokens = item.tokens.map((t) => serializeToken(t));
  return {
    tokens: tokens,
    type: item.type,
  };
}

function serializeToken(token: Token) {
  return {
    name: token.name,
    range: serializeRange(token.range),
  };
}

function serializeReplacementMap(
  replacement: DocumentReplacementMap,
): DocumentReplacementMapPayload {
  const tokens = replacement.tokenItems.map((i) => serializeItem(i));

  return {
    range: serializeRange(replacement.range),
    statementRange: serializeRange(replacement.statementRange),
    tokenItems: tokens,
    replacementMap: replacement.replacementMap,
  };
}
