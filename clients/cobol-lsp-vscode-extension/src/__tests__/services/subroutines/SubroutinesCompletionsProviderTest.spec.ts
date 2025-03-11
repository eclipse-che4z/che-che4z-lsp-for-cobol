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

import {
  CancellationToken,
  CompletionContext,
  Position,
  TextDocument,
  TextLine,
  Uri,
} from "vscode";
import { SubroutinesCompletionsProvider } from "../../../services/subroutines/SubroutinesCompletionsProvider";
import * as LocalSubroutinesService from "../../../services/subroutines/LocalSubroutinesService";

describe("SubroutinesCompletionsProvider", () => {
  const localSubroutines = ["LOCAL1", "LOCAL2", "ABC"];
  let documentMock: TextDocument;
  let lineText = "";
  let positionMock: Position;
  let positionChar = 0;
  let cancellationTokenMock: CancellationToken;
  let completionContextMock: CompletionContext;

  beforeEach(() => {
    jest
      .spyOn(LocalSubroutinesService, "listLocalSubroutines")
      .mockResolvedValue(localSubroutines);

    documentMock = {
      uri: Uri.file("PROGRAM.cbl"),
      lineAt: () => ({ text: lineText }) as unknown as TextLine,
    } as unknown as TextDocument;
    positionMock = {
      character: positionChar,
      line: 0,
    } as unknown as Position;
    cancellationTokenMock = {
      isCancellationRequested: false,
      onCancellationRequested: jest.fn(),
    };
    completionContextMock = {} as unknown as CompletionContext;
  });

  describe("completions are provided only after the CALL statement", () => {
    describe("cursor on a line just after the CALL statement", () => {
      beforeAll(() => {
        lineText = "           CALL ";
        positionChar = lineText.length;
      });

      test("returns all subroutines completions", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(localSubroutines);
        expect(completions[0].insertText).toEqual(`'LOCAL1'`);
      });
    });

    describe("cursor on a line without CALL statement", () => {
      beforeAll(() => {
        lineText = "           COPY ";
        positionChar = lineText.length;
      });

      test("returns no completions", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual([]);
      });
    });

    describe("cursor in the middle of the CALL statement", () => {
      beforeAll(() => {
        lineText = "           CALL ";
        positionChar = lineText.length - 3;
      });

      test("returns no completions", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual([]);
      });
    });

    describe("Subroutine name can start with quotation mark", () => {
      beforeAll(() => {
        lineText = '           CALL "AB';
        positionChar = lineText.length;
      });

      test("returns all completions for subroutine starting AB", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
      });
    });

    describe("Subroutine name can be wrapped with quotation mark", () => {
      beforeAll(() => {
        lineText = '           CALL "AB"';
        positionChar = lineText.length - 1;
      });

      test("returns all completions for subroutine starting AB", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
        expect(completions[0].insertText).toEqual("ABC");
      });
    });

    describe("Subroutine name can be wrapped with single-quotes", () => {
      beforeAll(() => {
        lineText = `           CALL 'AB'`;
        positionChar = lineText.length - 1;
      });

      test("returns all completions for subroutine starting AB", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
      });
    });

    describe("Call statement is case insensitive", () => {
      beforeAll(() => {
        lineText = `           call `;
        positionChar = lineText.length;
      });

      test("returns all completions", async () => {
        const provider = new SubroutinesCompletionsProvider();
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(localSubroutines);
      });
    });
  });
});
