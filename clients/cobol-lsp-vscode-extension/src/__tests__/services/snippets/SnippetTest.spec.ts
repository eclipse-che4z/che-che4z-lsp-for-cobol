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

import * as vscode from "vscode";
import { SnippetCompletionProvider } from "../../../services/snippetcompletion/SnippetCompletionProvider";
import {
  DialectInfo,
  DialectRegistry,
} from "../../../services/DialectRegistry";
import path = require("path");
import { createExtensionContextMock } from "../../../__mocks__/ExtensionContext.utility";
import { readFileResult } from "../../../__mocks__/vscode";
import { readFile } from "fs/promises";

describe("Test CompletionProvider", () => {
  const context = {
    triggerKind: {},
    diagnostics: [],
    only: undefined,
  } as unknown as vscode.CompletionContext;
  const snippetcompletion = new SnippetCompletionProvider(
    createExtensionContextMock(),
  );
  const SNIPPET_CBL = "SNIPPET.cbl";
  const dacoSnippetPath = path.resolve(
    __dirname,
    "../../../../../daco-dialect-support/snippets.json",
  );
  const idmsSnippetPath = path.resolve(
    __dirname,
    "../../../../../idms-dialect-support/snippets.json",
  );
  beforeAll(async () => {
    readFileResult[vscode.Uri.file(dacoSnippetPath).path] = (
      await readFile(dacoSnippetPath)
    ).toString();
    readFileResult[vscode.Uri.file(idmsSnippetPath).path] = (
      await readFile(idmsSnippetPath)
    ).toString();
    jest.spyOn(DialectRegistry, "getDialects").mockReturnValue([
      {
        name: "DaCo",
        snippetPath: dacoSnippetPath,
      } as DialectInfo,
      {
        name: "IDMS",
        snippetPath: idmsSnippetPath,
      } as DialectInfo,
    ]);
  });
  afterAll(() => {
    jest.clearAllMocks();
  });

  beforeEach(() => {
    snippetcompletion.resetSnippetsCompletionItems();
  });

  test("Suggest all DaCo Snippets", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["DaCo"]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 0),
          token,
          context,
        )
      ).length,
    ).toBe(575);
  });
  test("Suggest all IDMS Snippets", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["IDMS"]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 0),
          token,
          context,
        )
      ).length,
    ).toBe(506);
  });

  test("Suggest all Cobol only Snippets", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue([""]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 0),
          token,
          context,
        )
      ).length,
    ).toBe(496);
  });

  test("Suggest Snippets when both IDMS and DaCo is set", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["DaCo", "IDMS"]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 0),
          token,
          context,
        )
      ).length,
    ).toBe(585);
  });

  test(" Test number of suggestions for COPY when no dialect is selected", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "COPY" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue([""]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 4),
          token,
          context,
        )
      ).length,
    ).toBe(2);
  });

  test(" Test number of suggestions for COPY when dialect is IDMS", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "COPY" }),
    } as unknown as vscode.TextDocument;
    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["IDMS"]),
    });
    const completions = await snippetcompletion.provideCompletionItems(
      doc,
      new vscode.Position(0, 4),
      token,
      context,
    );
    expect(completions.length).toBe(8);
  });

  test(" Test number of suggestions for WRITE when dialect is IDMS", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: "SNIPPET.cbl",
      lineAt: jest.fn().mockReturnValue({ text: "WRITE" }),
    } as unknown as vscode.TextDocument;

    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["IDMS"]),
    });
    expect(
      (
        await snippetcompletion.provideCompletionItems(
          doc,
          new vscode.Position(0, 5),
          token,
          context,
        )
      ).length,
    ).toBe(5);
  });

  test(" Test number of suggestions for WRITE when dialect is Daco", async () => {
    const doc = {
      uri: { fsPath: "ws-path" },
      fileName: SNIPPET_CBL,
      lineAt: jest.fn().mockReturnValue({ text: "WRITE" }),
    } as unknown as vscode.TextDocument;
    const token = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(["DaCo", "IDMS"]),
    });
    const completions = await snippetcompletion.provideCompletionItems(
      doc,
      new vscode.Position(0, 5),
      token,
      context,
    );
    expect(completions.length).toBe(14);
  });
});
