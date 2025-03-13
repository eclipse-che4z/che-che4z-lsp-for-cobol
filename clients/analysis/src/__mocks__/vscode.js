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
const postMessage = jest.fn();
const packageJSON = { version: "0.0.0" };
const activeTextEditor = {};
const createWebviewPanel = jest.fn();
const ViewColumn = {
  Beside: -2,
};
const Uri = {
  file: jest.fn(() => {
    return "fake/path";
  }),
  parse: jest.fn((a) => {
    return a;
  }),
};
const visibleTextEditors = [
  {
    setDecorations: jest.fn(),
  },
  {
    setDecorations: jest.fn(),
  },
];
const window = {
  showErrorMessage: jest.fn(),
  showInformationMessage: jest.fn(),
  withProgress: jest.fn(),
  createTextEditorDecorationType: jest.fn(),
  activeTextEditor,
  visibleTextEditors,
  createWebviewPanel,
  onDidChangeTextEditorSelection: jest.fn(),
  showTextDocument: jest.fn(),
  onDidChangeActiveTextEditor: jest.fn(),
  showWarningMessage: jest.fn(),
  createOutputChannel: jest
    .fn()
    .mockReturnValue({ write: console.info, show: jest.fn() }),
};

const workspace = {
  openTextDocument: jest.fn(),
  getConfiguration: jest.fn().mockImplementationOnce(() => {
    return {
      get: jest.fn(),
    };
  }),
  onDidChangeTextDocument: jest.fn(),
  openTextDocument: jest.fn(),
  onDidChangeConfiguration: jest.fn(),
};
const extensions = {
  getExtension: jest.fn(() => {
    return {
      packageJSON: "0.0.0",
      extensionPath: "fake/path",
    };
  }),
  all: [],
};
let env = {
  appName: "Visual Studio Code",
};
const ProgressLocation = {
  Notification: 15,
};
const ExtensionContext = {
  subscriptions: jest.fn(),
};
const commands = {
  registerCommand: jest.fn(),
  executeCommand: jest.fn(),
};
const debug = {
  registerDebugAdapterDescriptorFactory: jest.fn(),
};
const languages = {
  createDiagnosticCollection: jest.fn(),
};

const vscode = {
  postMessage,
  extensions,
  packageJSON,
  workspace,
  window,
  DiagnosticRelatedInformation: class {
    constructor(location, message) {
      this.location = location;
      this.message = message;
    }
  },
  Location: class {
    constructor(uri, range) {
      this.range = range;
      this.uri = uri;
    }
  },
  languages,
  Range: class {
    constructor(start, end) {
      this.start = start;
      this.end = end;
    }
  },
  Diagnostic: class {
    constructor(range, message, severity) {
      this.range = range;
      this.message = message;
      this.severity = severity;
    }
  },
  Position: class {
    constructor(line, character) {
      this.line = line;
      this.character = character;
    }
  },
  env,
  ProgressLocation,
  ExtensionContext,
  commands,
  ViewColumn,
  Uri,
  debug,
  DiagnosticSeverity: {
    Error: 0,
    Warning: 1,
    Information: 2,
    Hint: 3,
  },
  DiagnosticTag: {
    Unnecessary: 1,
    Deprecated: 2,
  },
};

module.exports = vscode;
