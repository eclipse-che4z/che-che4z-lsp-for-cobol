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

import * as vscode from "vscode";
import { fetchCopybookCommand } from "../commands/FetchCopybookCommand";
import { gotoCopybookSettings } from "../commands/OpenSettingsCommand";
import { initSmartTab } from "../commands/SmartTabCommand";
import { activate } from "../extension";
import { CopybooksCodeActionProvider } from "../services/copybook/CopybooksCodeActionProvider";
import { LanguageClientService } from "../services/LanguageClientService";
import { TelemetryService } from "../services/reporter/TelemetryService";
import { SnippetCompletionProvider } from "../services/snippetcompletion/SnippetCompletionProvider";
import { Utils } from "../services/util/Utils";

jest.mock("../commands/SmartTabCommand");
jest.mock("../commands/FetchCopybookCommand");
jest.mock("../commands/OpenSettingsCommand");
jest.mock("../services/LanguageClientService");
jest.mock("../services/copybook/CopybookDownloadService");
jest.mock("../commands/ClearCopybookCacheCommand");

jest.mock("../services/Settings", () => ({
  createFileWithGivenPath: jest.fn(),
  initializeSettings: jest.fn(),
  SettingsService: {
    serverRuntime: jest
      .fn()
      .mockReturnValueOnce(undefined)
      .mockReturnValue("JAVA"),
    getSnippetsForCobol: jest.fn().mockReturnValue([]),
    getDialects: jest.fn().mockReturnValue([]),
  },
}));

Utils.getZoweExplorerAPI = jest.fn();
jest.mock("vscode", () => ({
  commands: {
    registerCommand: jest
      .fn()
      .mockImplementation((command, callback) => callback()),
    executeCommand: jest.fn(),
  },
  extensions: {
    getExtension: jest.fn().mockReturnValue({ extensionPath: "/test" }),
  },
  languages: {
    registerCodeActionsProvider: jest.fn(),
    registerCompletionItemProvider: jest.fn(),
  },
  window: {
    setStatusBarMessage: jest
      .fn()
      .mockImplementation(
        async (_text: string, _hideWhenDone: Thenable<any>) => {
          return Promise.resolve(true);
        },
      ),
    showErrorMessage: jest.fn().mockReturnValue("test"),
    showInformationMessage: jest
      .fn()
      .mockImplementation((message: string) => Promise.resolve(message)),
    onDidChangeActiveTextEditor: jest.fn(),
    createQuickPick: jest
      .fn()
      .mockReturnValue({ onDidChangeSelection: jest.fn(), show: jest.fn() }),
    createOutputChannel: jest.fn().mockReturnValue({
      appendLine: jest.fn(),
    }),
  },
  workspace: {
    getConfiguration: jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(9),
    }),
    getWorkspaceFolder: jest.fn().mockReturnValue({ name: "workspaceFolder1" }),
    onDidChangeConfiguration: jest
      .fn()
      .mockReturnValue("onDidChangeConfiguration"),
    workspaceFolders: [{ uri: { fsPath: "ws-path" } } as any],
  },
}));

jest.mock("vscode-languageclient", () => ({
  LanguageClient: jest.fn(),
}));
jest.mock("../services/reporter/TelemetryService");
jest.mock("../services/copybook/CopybookMessageHandler", () => ({
  resolveCopybookHandler: jest.fn(),
  downloadCopybookHandler: jest.fn(),
}));

const context: any = {
  subscriptions: [],
};

beforeEach(() => {
  jest.clearAllMocks();
  context.subscriptions = [];
});

describe("Check plugin extension for cobol starts successfully.", () => {
  test("start extension", async () => {
    await activate(context);
    expect(TelemetryService.registerEvent).toHaveBeenCalledWith(
      "log",
      ["bootstrap", "experiment-tag"],
      "Extension activation event was triggered",
    );

    expect(vscode.commands.registerCommand).toBeCalledTimes(9);

    expect(fetchCopybookCommand).toHaveBeenCalled();
    expect(gotoCopybookSettings).toHaveBeenCalled();
    expect(initSmartTab).toHaveBeenCalled();

    expect(vscode.languages.registerCodeActionsProvider).toBeCalledWith(
      { language: "cobol" },
      expect.any(CopybooksCodeActionProvider),
    );

    expect(vscode.languages.registerCompletionItemProvider).toBeCalledWith(
      { language: "cobol" },
      expect.any(SnippetCompletionProvider),
    );
  });
});

describe("check exposed API's by the COBOL LS extension", () => {
  test("analysis API is exposed by the COBOL LS extension", async () => {
    const expectedGraph = "THIS IS A CFAST GRAPH OBJECT";
    jest
      .spyOn(LanguageClientService.prototype, "retrieveAnalysis")
      .mockResolvedValue(expectedGraph);
    const ext = await activate(context);
    expect(ext).toHaveProperty("analysis");
    expect(await ext.analysis("test", "text")).toBe(expectedGraph);
  });
});

describe("Check plugin extension for cobol fails.", () => {
  beforeEach(() => {
    (LanguageClientService as any).mockImplementation(() => {
      return {
        checkPrerequisites: () => {
          throw new Error("The error");
        },
        enableNativeBuild: jest.fn(),
        addRequestHandler: jest.fn(),
        retrieveAnalysis: jest.fn(),
        start: jest.fn(),
      };
    });
  });

  test("start fails.", async () => {
    await activate(context);
    expect(TelemetryService.registerEvent).toHaveBeenCalledWith(
      "log",
      ["bootstrap", "experiment-tag"],
      "Extension activation event was triggered",
    );
  });
});

describe("Check recognition of COBOL from first line", () => {
  const manifest = require("../../package.json");
  const firstLine = manifest.contributes.languages[0].firstLine;
  const cobol = expect.stringMatching(firstLine);

  test("Comment Line SEQ", () => {
    const pgm = `000010*REALLY ANYTHING`;
    expect(pgm).toEqual(cobol);
  });

  test("Comment Line NOSEQ", () => {
    const pgm = `      *REALLY ANYTHING`;
    expect(pgm).toEqual(cobol);
  });

  test("Identification Division SEQ", () => {
    const pgm = `000010 IDENTIFICATION DIVISION.`;
    expect(pgm).toEqual(cobol);
  });

  test("Identification Division NOSEQ", () => {
    const pgm = `       IDENTIFICATION DIVISION.`;
    expect(pgm).toEqual(cobol);
  });

  test("ID Division", () => {
    const pgm = `000010 ID DIVISION.`;
    expect(pgm).toEqual(cobol);
  });

  test("Data Definition (copybook) SEQ", () => {
    const pgm = `000010 01 ABC-XYZ.`;
    expect(pgm).toEqual(cobol);
  });

  test("Data Definition (copybook) NOSEQ", () => {
    const pgm = `       01 ABC-XYZ.`;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive at the beginnig of a line", () => {
    const pgm = `CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after 3 spaces", () => {
    const pgm = `   CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after 6 spaces", () => {
    const pgm = `      CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after 7 spaces", () => {
    const pgm = `       CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after spaces 8 spaces", () => {
    const pgm = `        CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after more spaces", () => {
    const pgm = `           CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Incorrect compiler directive", () => {
    const pgm = `a    CBL `;
    expect(pgm).not.toEqual(cobol);
  });

  test('Compiler Directive after "sequence number"', () => {
    const pgm = `0abcdePROCESS `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive in column 8 - SEQ", () => {
    const pgm = `000010 PROCESS `;
    expect(pgm).toEqual(cobol);
  });

  test("Compiler Directive after column 8 - SEQ", () => {
    const pgm = `000010     CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Listing control in column 8 - SEQ", () => {
    const pgm = `000010 *PROCESS `;
    expect(pgm).toEqual(cobol);
  });

  test("Listing control in column 8 - NOSEQ", () => {
    const pgm = `       *CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Listing control after column 8 - SEQ ", () => {
    const pgm = `000010    *CBL `;
    expect(pgm).toEqual(cobol);
  });

  test("Listing control after column 8 - NOSEQ ", () => {
    const pgm = `          *PROCESS `;
    expect(pgm).toEqual(cobol);
  });
});
