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
import * as path from "path";
import type {
  CompletionItem as VSCodeCompletionItem,
  OutputChannel as OutputChannelType,
  Position as PositionType,
  Uri as UriType,
} from "vscode";
import { Uri as UriMock } from "./UriMock";

import { readFile } from "fs/promises";

// eslint-disable-next-line @typescript-eslint/no-namespace
export namespace workspace {
  export const workspaceFolders = [
    {
      uri: UriMock.parse("/"),
    },
  ];
  export function getConfiguration() {
    return {
      get: (key: string) => {
        if ("cobol-lsp.smart-tab" === key) {
          return undefined;
        }
        return jest.fn();
      },
    };
  }
  export function createFileSystemWatcher() {
    return {
      onDidCreate: jest.fn(),
      onDidDelete: jest.fn(),
      onDidChange: jest.fn(),
    };
  }
  export const fs = {
    readFile: async (uri: UriType): Promise<Uint8Array | undefined> => {
      const path = uri.fsPath;
      try {
        return await readFile(path);
      } catch (_err) {
        // ignore
      }
    },
    writeFile: jest.fn(),
    delete: jest.fn().mockReturnValue(true),
    readDirectory: jest.fn().mockResolvedValue([["fileName", 2]]),
    createDirectory: jest.fn(),
  };

  export const onDidChangeConfiguration = jest
    .fn()
    .mockReturnValue("onDidChangeConfiguration");
  export const textDocuments = [];
  export function getWorkspaceFolder() {}
  export async function findFiles() {
    return Promise.resolve([]);
  }
}

// eslint-disable-next-line @typescript-eslint/no-namespace
export namespace extensions {
  export function getExtension() {
    return {
      extensionPath: path.join(__dirname, "../../"),
      packageJSON: {
        version: "123",
      },
    };
  }
  export const onDidChange = jest.fn();
}

// eslint-disable-next-line @typescript-eslint/no-namespace
export namespace window {
  export const showErrorMessage = jest
    .fn()
    .mockImplementation(() => Promise.resolve());
  export const showInformationMessage = jest.fn().mockReturnValue("Ok");
  export const createStatusBarItem = () => {
    return { show: () => {} };
  };
  export const createQuickPick = () => ({
    show: jest.fn(),
    onDidChangeSelection: jest.fn(),
  });
  export const setStatusBarMessage = jest.fn().mockResolvedValue(true);
  export const createOutputChannel = (name: string): OutputChannelType => ({
    name,
    append: jest.fn(),
    appendLine: jest.fn(),
    replace: jest.fn(),
    clear: jest.fn(),
    show: jest.fn(),
    hide: jest.fn(),
    dispose: jest.fn(),
  });
  export const activeTextEditor = {
    document: {
      uri: {
        path: "/storagePath",
        fsPath: "/storagePath",
        scheme: "file",
      },
      getText: jest.fn(),
    },
  };
  export const onDidChangeActiveTextEditor = jest.fn();
  export const createTerminal = jest.fn().mockReturnValue({
    sendText: jest.fn(),
    show: jest.fn(),
  });
  export const terminals = {
    find: jest.fn(),
  };
  export const visibleTextEditors = [];
  export const withProgress = jest
    .fn()
    .mockImplementation((_options, task: () => void) => {
      task();
    });
}
export enum StatusBarAlignment {
  Right,
}

export const Uri = UriMock;

export enum ConfigurationTarget {
  Global = 1,
  Workspace = 2,
  WorkspaceFolder = 3,
}

export enum EndOfLine {
  /**
   * The line feed `\n` character.
   */
  LF = 1,
  /**
   * The carriage return line feed `\r\n` sequence.
   */
  CRLF = 2,
}

export class Range {
  constructor(
    public start: Position,
    public end: Position,
  ) {}
}

export class Position {
  constructor(
    public line: number,
    public character: number,
  ) {}
}

// eslint-disable-next-line @typescript-eslint/no-namespace
export namespace commands {
  export const registerTextEditorCommand = jest.fn();
  export const executeCommand = jest.fn();
  export const registerCommand = jest
    .fn()
    .mockImplementation((command, callback: () => void) => callback());
}

export const TextEditor = {
  document: {
    lineAt: jest.fn(),
  },
};

export class Selection {
  public start?: PositionType;
  public end?: PositionType;
  constructor(
    public anchor: PositionType,
    public active: PositionType,
  ) {}
}

export const CodeActionKind = {
  QuickFix: 1,
};
export const CodeAction = jest.fn();

export const CompletionItem = jest
  .fn()
  .mockImplementation((label: string | { label: string }) => ({ label }));

export enum CompletionItemKind {
  Snippet = 14,
}

export const SnippetString = jest.fn();
export const MarkdownString = jest.fn().mockReturnValue({
  string: "",
  appendCodeblock: jest.fn().mockReturnValue({ value: "", language: "COBOL" }),
});
export const ProgressLocation = {};

export const TextEditorEdit = {
  insert: jest.fn(),
  replace: jest.fn(),
  delete: jest.fn(),
  setEndOfLine: jest.fn(),
};

export const languages = {
  registerCodeActionsProvider: jest.fn(),
  registerCompletionItemProvider: jest.fn(),
  createDiagnosticCollection: jest.fn().mockReturnValue({
    clear: jest.fn(),
  }),
};

class FileNotFound extends Error {
  code: string;
  constructor() {
    super();
    this.code = "FileNotFound";
  }
}

export const FileSystemError = {
  FileNotFound: () => {
    return new FileNotFound();
  },
};

export const RelativePattern = jest
  .fn()
  .mockImplementation((base: string, pattern: string) => ({
    base,
    pattern,
  }));

export const CompletionList = jest
  .fn()
  .mockImplementation(
    (items?: VSCodeCompletionItem[], isIncomplete?: boolean) => ({
      items,
      isIncomplete,
    }),
  );

export enum DiagnosticSeverity {
  Error = 0,
  Warning = 1,
  Information = 2,
  Hint = 3,
}
