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

import * as fs from "fs";
import * as os from "os";
import { join } from "path";
import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { JavaCheck } from "../../services/JavaCheck";
import { LanguageClientService } from "../../services/LanguageClientService";
import { NativeExecutableService } from "../../services/nativeLanguageClient/nativeExecutableService";
import { TelemetryService } from "../../services/reporter/TelemetryService";
import { Utils } from "../../services/util/Utils";

jest.mock("../../services/reporter/TelemetryService");
jest.mock("../../services/copybook/CopybookURI");
jest.mock("vscode", () => ({
  extensions: {
    getExtension: jest.fn().mockReturnValue({ extensionPath: "/test" }),
  },
  workspace: {
    getConfiguration: jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue(0),
    }),
  },
  window: {
    createOutputChannel: jest.fn(),
  },
  Uri: {
    file: jest.fn().mockReturnValue({
      fsPath: "path",
    }),
  },
}));
jest.mock("vscode-languageclient/node", () => ({
  LanguageClient: jest.fn(),
}));
jest.mock("fs", () => ({
  fs: jest.fn(),
}));

Utils.getZoweExplorerAPI = jest.fn();
let languageClientService: LanguageClientService;

const SERVER_DESC = "LSP extension for COBOL language";
const SERVER_ID = "cobol";

beforeEach(() => {
  jest.clearAllMocks();
  vscode.workspace.getConfiguration(expect.any(String)).get = jest
    .fn()
    .mockReturnValue(0);
  vscode.workspace.createFileSystemWatcher = jest.fn();
});

const SERVER_STOPPED_MSG = "server stopped";
describe("LanguageClientService positive scenario", () => {
  beforeEach(() => {
    languageClientService = new LanguageClientService(jest.fn() as any);
    new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
    vscode.workspace.getConfiguration(expect.any(String)).get = jest
      .fn()
      .mockReturnValue(0);
    (fs.existsSync as any) = jest.fn().mockReturnValue(true);
  });

  test("Test LanguageClientService switches native flag", async () => {
    (languageClientService as any).initializeExecutables = jest.fn();
    (fs.existsSync as any) = jest.fn().mockReturnValue(true);
    Object.defineProperty(fs, "existsSync", { value: jest.fn() });
    vscode.workspace.getConfiguration(expect.any(String)).get = jest
      .fn()
      .mockReturnValue(9999);
    languageClientService.enableNativeBuild();

    expect(TelemetryService.registerEvent).toHaveBeenCalledWith(
      "Native Build enabled",
      ["COBOL", "native build enabled", "settings"],
      "Native build enabled",
    );
    expect((languageClientService as any).isNativeBuildEnabled).toBeTruthy();
  });

  test("Test LanguageClientService checkPrerequisites passes", async () => {
    let message = false;
    (fs.existsSync as any) = jest.fn().mockReturnValue(true);
    vscode.workspace.getConfiguration(expect.any(String)).get = jest
      .fn()
      .mockReturnValue(9999);
    try {
      await languageClientService.checkPrerequisites();
    } catch (error: any) {
      message = error;
    }
    expect(message).toBeFalsy();
  });

  test("Test LanguageClientService retrieve analysis passes", async () => {
    const expectedResult = { programs: [] };

    LanguageClient.prototype.sendRequest = () =>
      Promise.resolve(expectedResult);
    expect(await languageClientService.retrieveAnalysis("test", "text")).toBe(
      expectedResult,
    );
  });

  test("Test LanguageClientService starts language client", async () => {
    LanguageClient.prototype.start = jest
      .fn()
      .mockReturnValue(Promise.resolve());
    const serverPath = join("/test", "server", "jar", "server.jar");
    const expectedDialectPath = join("/test", "server", "jar", "dialects");
    expect(await languageClientService.start()).toBe(undefined);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      SERVER_ID,
      SERVER_DESC,
      {
        args: [
          "-Dline.separator=\r\n",
          `-Ddialect.path=${expectedDialectPath}`,
          "-Xmx768M",
          "-jar",
          serverPath,
          "pipeEnabled",
        ],
        command: "java",
        options: { detached: false },
      },
      {
        documentSelector: [SERVER_ID],
        outputChannel: expect.any(Function),
        synchronize: {
          fileEvents: [undefined, undefined],
        },
      },
    );
  });

  test("LanguageClientService starts the language server when port is provided", async () => {
    new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
    vscode.workspace.getConfiguration(expect.any(String)).get = jest
      .fn()
      .mockReturnValue(9999);
    LanguageClient.prototype.start = jest
      .fn()
      .mockReturnValue(Promise.resolve());
    expect(await languageClientService.start()).toBe(undefined);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      SERVER_ID,
      SERVER_DESC,
      expect.any(Function),
      {
        documentSelector: [SERVER_ID],

        outputChannel: expect.any(Function),
        synchronize: {
          fileEvents: [undefined, undefined],
        },
      },
    );
  });

  test("Test LanguageClientService fire a stop() command on LanguageClient", async () => {
    LanguageClient.prototype.stop = jest
      .fn()
      .mockReturnValue(SERVER_STOPPED_MSG);
    // start the server, before shutdown.
    languageClientService.start();
    const returnedValue = await languageClientService.stop();
    expect(returnedValue).toBe(SERVER_STOPPED_MSG);
  });

  test("LanguageClientServer detects executable path for windows", () => {
    const spy = jest.spyOn(os, "type");
    spy.mockReturnValue("Windows_NT");
    (languageClientService as any).executableService =
      new NativeExecutableService("/test");
    const executable = (
      languageClientService as any
    ).executableService.getNativeLanguageClient();
    expect(executable.command).toBe("engine.exe");
    expect(executable.options.cwd).toBe(join("/test", "native"));
  });

  test("LanguageClientServer detects executable path for Linux", () => {
    const spy = jest.spyOn(os, "type");
    spy.mockReturnValue("Linux");
    (languageClientService as any).executableService =
      new NativeExecutableService("/test");
    const executable = (
      languageClientService as any
    ).executableService.getNativeLanguageClient();
    expect(executable.command).toBe("./server-linux");
    expect(executable.options.cwd).toBe(join("/test", "native"));
  });

  test("LanguageClientServer detects executable path for Mac", () => {
    const spy = jest.spyOn(os, "type");
    spy.mockReturnValue("Darwin");
    (languageClientService as any).executableService =
      new NativeExecutableService("/test");
    const executable = (
      languageClientService as any
    ).executableService.getNativeLanguageClient();
    expect(executable.command).toBe("./server-mac");
    expect(executable.options.cwd).toBe(join("/test", "native"));
  });

  test("LanguageClientServer detects executable path for unKnown OS", () => {
    const spy = jest.spyOn(os, "type");
    spy.mockReturnValue("Android");
    (languageClientService as any).executableService =
      new NativeExecutableService("/test");
    const executable = (
      languageClientService as any
    ).executableService.getNativeLanguageClient();
    expect(executable).toBeFalsy();
  });
});

describe("LanguageClientService negative scenario.", () => {
  test("LSP port not defined and jar path doesn't exists", async () => {
    (fs.existsSync as any) = jest.fn().mockReturnValue(false);
    try {
      await new LanguageClientService(jest.fn() as any).checkPrerequisites();
    } catch (error: any) {
      expect(error.toString()).toBe("Error: LSP server for cobol not found");
    }
  });
});
