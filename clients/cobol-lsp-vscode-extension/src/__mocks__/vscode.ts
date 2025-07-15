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
import {
  type CompletionItem as VSCodeCompletionItem,
  type LogOutputChannel as LogOutputChannelType,
  type Position as PositionType,
  type Uri as UriType,
  type TextDocument,
} from "vscode";
import { URI, Utils } from "vscode-uri";

export const readDirectoryResult: {
  [path: string]:
    | (string | { name: string; mode?: string } | [string, FileType])[]
    | Error;
} = {};

export const readFileResult: {
  [path: string]: string | Error;
} = {};

export const findFilesResult: {
  [path: string]: URI[];
} = {};

const workspaceFoldersMock = [
  {
    name: "workspace",
    uri: URI.file("/workspace"),
    index: 0,
  },
  {
    name: "other",
    uri: URI.file("/other"),
    index: 1,
  },
];
export const getWorkspaceFolderResult = workspaceFoldersMock[0];

export const getConfigurationResult: { [key: string]: unknown } = {
  "cobol-lsp.smart-tab": undefined,
};

export const diagnosticsCollectionMock = {
  set: jest.fn(),
  clear: jest.fn(),
  delete: jest.fn(),
};

// eslint-disable-next-line @typescript-eslint/no-namespace
export namespace workspace {
  export const workspaceFolders = workspaceFoldersMock;
  export function getConfiguration() {
    return {
      get: (key: string) => {
        return getConfigurationResult[key];
      },
    };
  }
  export function createFileSystemWatcher() {
    return {
      onDidCreate: jest.fn(),
      onDidDelete: jest.fn(),
      onDidChange: jest.fn(),
      dispose: jest.fn(),
    };
  }
  export const fs = {
    readFile: jest.fn().mockImplementation((uri: UriType) => {
      const result = readFileResult[uri.path];
      if (!result) {
        throw new FileNotFound();
      }
      if (result instanceof Error) {
        throw result;
      } else {
        return Promise.resolve(new TextEncoder().encode(result));
      }
    }),
    writeFile: jest.fn(),
    delete: jest.fn().mockReturnValue(true),
    readDirectory: jest.fn().mockImplementation((uri: UriType) => {
      const resultKey = Object.keys(readDirectoryResult).find(
        (key: string) => uri.path === key,
      );
      if (!resultKey) {
        return Promise.resolve([]);
      }
      const result = readDirectoryResult[resultKey];
      if (result instanceof Error) {
        throw result;
      } else {
        return Promise.resolve(
          result.map((file) => {
            if (typeof file === "string") {
              return [`${file}.cpy`, FileType.File];
            } else if (Array.isArray(file)) {
              return file;
            } else if (typeof file === "object") {
              return [
                file.name,
                file.mode?.startsWith("d") ? FileType.Directory : FileType.File,
              ];
            }
          }),
        );
      }
    }),
    createDirectory: jest.fn(),
    stat: jest.fn(),
  };

  export const onDidChangeConfiguration = jest
    .fn()
    .mockReturnValue("onDidChangeConfiguration");
  export const textDocuments: TextDocument[] = [
    {
      uri: URI.file("/workspace/edited"),
      getText: jest.fn().mockReturnValue("EDITED"),
    } as unknown as TextDocument,
  ];
  export function getWorkspaceFolder() {
    return workspaceFolders[0];
  }
  export const findFiles = jest
    .fn()
    .mockImplementation((pattern: { baseUri: URI }) => {
      return Promise.resolve(findFilesResult[pattern.baseUri.path] ?? []);
    });
  export const onDidChangeTextDocument = jest.fn();
  export const onDidCloseTextDocument = jest.fn();
  export const asRelativePath = jest
    .fn()
    .mockImplementation((documentUri: UriType) => {
      const wsPath = getWorkspaceFolder().uri.fsPath;
      return path.relative(wsPath, documentUri.fsPath);
    });
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
  export const showInputBox = jest.fn();
  export const createStatusBarItem = () => {
    return { show: () => {} };
  };
  export const createQuickPick = () => ({
    show: jest.fn(),
    onDidChangeSelection: jest.fn(),
  });
  export const setStatusBarMessage = jest.fn().mockResolvedValue(true);
  export const createOutputChannel = (name: string): LogOutputChannelType => ({
    name,
    append: jest.fn(),
    appendLine: jest.fn(),
    replace: jest.fn(),
    clear: jest.fn(),
    show: jest.fn(),
    hide: jest.fn(),
    dispose: jest.fn(),
    error: jest.fn(),
    debug: jest.fn(),
    info: jest.fn(),
    trace: jest.fn(),
    warn: jest.fn(),
    onDidChangeLogLevel: jest.fn(),
    logLevel: 2,
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

export const Uri = URI;
Object.assign(Uri, Utils);

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
  createDiagnosticCollection: jest
    .fn()
    .mockReturnValue(diagnosticsCollectionMock),
};

export class FileNotFound extends Error {
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
  .mockImplementation((baseUri: URI, pattern: string) => ({
    baseUri,
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

export enum FileType {
  Unknown = 0,
  File = 1,
  Directory = 2,
  SymbolicLink = 64,
}
