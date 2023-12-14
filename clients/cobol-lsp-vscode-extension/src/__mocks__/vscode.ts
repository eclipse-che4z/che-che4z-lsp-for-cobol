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
import path = require("path");
import * as url from "url";

// tslint:disable: no-namespace no-empty
export namespace workspace {
  export const workspaceFolders: any[] = [{}];
  export function getConfiguration() {
    return {
      get: (key: string) => {
        if ("cobol-lsp.smart-tab" === key) {
          return undefined;
        }
      },
    };
  }
  export function createFileSystemWatcher(a: string) {}
}

export namespace extensions {
  export function getExtension(id: string) {
    return {
      extensionPath: path.join(__dirname, "../../"),
      packageJSON: {
        version: "123",
      },
    };
  }
}

export namespace window {
  export let showErrorMessage = () => {};
  export let showInformationMessage = () => {};
  export let createStatusBarItem = () => {
    return { show: () => {} };
  };
  export let createQuickPick = () => {
    return { show: jest.fn() };
  };
}
export enum StatusBarAlignment {
  Right,
}

export class Uri {
  static file(path: string): Uri {
    const result: Uri = new Uri();
    result.toString = () => url.pathToFileURL(path).toString();
    return result;
  }
  static parse = jest.fn();
}

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

export const Range = jest.fn().mockImplementation((start, end) => {
  return { start: start, end: end };
});
export const Position = jest.fn().mockImplementation((line, character) => {
  return { line: line, character: character };
});

export namespace commands {
  export const registerTextEditorCommand = jest.fn();
  export const executeCommand = jest.fn();
}

export const TextEditor = {
  document: {
    lineAt: jest.fn(),
  },
};

export class Selection {
  anchor: any;
  active: any;

  constructor(anchor: any, active: any) {
    this.anchor = anchor;
    this.active = active;
  }
}
