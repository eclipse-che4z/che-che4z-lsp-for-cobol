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
} from "vscode";
import { CopybookDownloadService } from "../../../services/copybook/CopybookDownloadService";
import { CopybooksCompletionProvider } from "../../../services/copybook/CopybooksCompletionProvider";
import { Uri } from "../../../__mocks__/UriMock";
import {
  DialectInfo,
  DialectRegistry,
} from "../../../services/DialectRegistry";
import { DEFAULT_DIALECT } from "../../../constants";
import * as LocalCopybookService from "../../../services/copybook/LocalCopybooksService";

describe("CopybooksCompletionProvider", () => {
  let cdsMock: CopybookDownloadService;
  const remoteCopybooks = ["AAA", "ABC", "BBB", "CCC"];
  const localCopybooks = ["LOCAL"];
  let documentMock: TextDocument;
  let lineText = "";
  let positionMock: Position;
  let positionChar = 0;
  let cancellationTokenMock: CancellationToken;
  let completionContextMock: CompletionContext;

  beforeEach(() => {
    cdsMock = {
      listRemoteCopybooks: jest.fn().mockResolvedValue(remoteCopybooks),
    } as unknown as CopybookDownloadService;
    jest
      .spyOn(LocalCopybookService, "listLocalCopybooks")
      .mockResolvedValue(localCopybooks);

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

  describe("completions are provided only after the COPY statement", () => {
    describe("cursor on a line just after the COPY statement", () => {
      beforeAll(() => {
        lineText = "           COPY ";
        positionChar = lineText.length;
      });

      test("returns all remote completions", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(
          remoteCopybooks.concat(localCopybooks),
        );
      });
    });

    describe("cursor in on a line without the COPY statement", () => {
      beforeAll(() => {
        lineText = "           Move 123456789 To User-Num1.";
        positionChar = lineText.length - 3;
      });

      test("no remote copybooks completions returned", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual([]);
      });
    });

    describe("cursor in the middle of the COPY statement", () => {
      beforeAll(() => {
        lineText = "    COPY ";
        positionChar = lineText.length - 3;
      });

      test("no remote copybooks completions returned", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual([]);
      });
    });

    describe("cursor on a line just after the identifier of the copybook name of the COPY statement", () => {
      beforeAll(() => {
        lineText = "           COPY AB";
        positionChar = lineText.length;
      });

      test("returns all completions for copybook starting AB", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
      });
    });

    describe("Copybook name can start with quotation mark", () => {
      beforeAll(() => {
        lineText = '           COPY "AB';
        positionChar = lineText.length;
      });

      test("returns all completions for copybook starting AB", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
      });
    });

    describe("Copybook name can be wrapped with quotation mark", () => {
      beforeAll(() => {
        lineText = '           COPY "AB"';
        positionChar = lineText.length - 1;
      });

      test("returns all completions for copybook starting AB", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(["ABC"]);
      });
    });

    describe("Copy statement is case insensitive", () => {
      beforeAll(() => {
        lineText = "           copy ";
        positionChar = lineText.length;
      });

      test("returns all completions", async () => {
        const provider = new CopybooksCompletionProvider(cdsMock);
        const completions = await provider.provideCompletionItems(
          documentMock,
          positionMock,
          cancellationTokenMock,
          completionContextMock,
        );

        expect(completions.map((c) => c.label)).toEqual(
          remoteCopybooks.concat(localCopybooks),
        );
      });
    });
  });

  describe("COPY statement may include dialect identifier", () => {
    describe("DaCo dialect is active", () => {
      beforeEach(() => {
        const dialectInfo = {
          name: "DACO",
          description: "DaCo dialect",
          isCopyStatement: (statement: string) => {
            const regex = /^.*\bCOPY\s+MAID(?:\s+"?'?([^\s]+))?$/i;
            const match = statement.match(regex);
            if (!match) {
              return { isCopy: false };
            }
            return { isCopy: true, prefix: match[1] };
          },
        } as unknown as DialectInfo;
        jest
          .spyOn(DialectRegistry, "getActiveDialects")
          .mockReturnValue([dialectInfo]);
      });

      describe("Selected dialect is passed to copybook download service", () => {
        beforeAll(() => {
          lineText = '           COPY MAID "AB"';
          positionChar = lineText.length - 1;
        });

        test("returns all completions for copybook starting AB", async () => {
          const provider = new CopybooksCompletionProvider(cdsMock);
          const completions = await provider.provideCompletionItems(
            documentMock,
            positionMock,
            cancellationTokenMock,
            completionContextMock,
          );

          expect(cdsMock.listRemoteCopybooks).toHaveBeenCalledWith(
            "file://PROGRAM.cbl",
            "DACO",
          );

          expect(completions.map((c) => c.label)).toEqual(["ABC"]);
        });
      });

      describe("Default dialect is passed to copybook download service", () => {
        beforeAll(() => {
          lineText = '           COPY "AB"';
          positionChar = lineText.length - 1;
        });

        test("returns all completions for copybook starting AB", async () => {
          const provider = new CopybooksCompletionProvider(cdsMock);
          const completions = await provider.provideCompletionItems(
            documentMock,
            positionMock,
            cancellationTokenMock,
            completionContextMock,
          );

          expect(cdsMock.listRemoteCopybooks).toHaveBeenCalledWith(
            "file://PROGRAM.cbl",
            DEFAULT_DIALECT,
          );

          expect(completions.map((c) => c.label)).toEqual(["ABC"]);
        });
      });
    });
  });

  describe("SQL dialect INCLUDE statement", () => {
    beforeAll(() => {
      lineText = "           EXEC SQL INCLUDE ";
      positionChar = lineText.length;
    });

    test("returns all completions for copybooks using SQL dialect", async () => {
      const provider = new CopybooksCompletionProvider(cdsMock);
      await provider.provideCompletionItems(
        documentMock,
        positionMock,
        cancellationTokenMock,
        completionContextMock,
      );

      expect(cdsMock.listRemoteCopybooks).toHaveBeenCalledWith(
        "file://PROGRAM.cbl",
        "SQL",
      );
    });
  });
});
