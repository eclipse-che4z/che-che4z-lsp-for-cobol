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

import type {
  JavaServer,
  SocketServer,
} from "../../services/languageClient/ServerTypes";

import { LanguageClientService } from "../../services/LanguageClientService";
import { LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID } from "../../constants";
import { outputChannel } from "../../services/util/OutputChannel";

import * as vscode from "vscode";
import * as JavaCheck from "../../services/JavaCheck";
import { Middleware, LanguageClient, State } from "vscode-languageclient/node";

jest.mock("vscode");
jest.mock("vscode-languageclient/node", () => {
  return jest.requireActual("vscode-languageclient/node");
});

jest.mock("vscode-languageclient/node", () => {
  const originalModule = jest.requireActual("vscode-languageclient/node");
  class LanguageClient extends jest.fn() {
    public state = State.Stopped;
    createDefaultErrorHandler() {
      return jest.fn();
    }
    start() {
      this.state = State.Running;
    }
    dispose() {
      this.state = State.Stopped;
    }
  }

  return {
    __esModule: true,
    ...originalModule,
    LanguageClient,
  };
});

const SERVER_NAME = "COBOL Language Support";

const javaServer: JavaServer = {
  kind: "JAVA",
  command: "/test/bin/java",
  dialects: vscode.Uri.file("/test/dialectsFolder"),
  jar: vscode.Uri.file("/test/server/server.jar"),
};

beforeEach(() => {
  jest.clearAllMocks();
  vscode.workspace.createFileSystemWatcher = jest.fn();
});

const SERVER_STOPPED_MSG = "server stopped";
describe("LanguageClientService positive scenario", () => {
  let languageClientService: LanguageClientService;
  let middleware: Middleware;

  beforeEach(() => {
    middleware = {};
    languageClientService = new LanguageClientService(
      "Publisher.Extension-Name",
      outputChannel,
      [vscode.Uri.file("/storagePath")],
      middleware,
    );

    jest.spyOn(JavaCheck, "getJavaVersion").mockResolvedValue(17);
  });

  test("Test LanguageClientService starts language client", async () => {
    await languageClientService.start([javaServer]);

    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      LANGUAGE_ID,
      SERVER_NAME,
      {
        args: [
          "-Dline.separator=\r\n",
          "-Ddialect.path=/test/dialectsFolder",
          "-Xmx768M",
          "-jar",
          "/test/server/server.jar",
          "pipeEnabled",
        ],
        command: "/test/bin/java",
        options: { detached: false },
      },
      {
        documentSelector: [LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID],
        errorHandler: expect.any(Function),
        middleware: {},
        outputChannel: outputChannel,
        synchronize: {
          fileEvents: [undefined, undefined, undefined, undefined, undefined],
        },
      },
    );
  });

  test("LanguageClientService starts the language server when port is provided", async () => {
    vscode.workspace.getConfiguration().get = jest.fn().mockReturnValue(9999);
    const socketServer: SocketServer = {
      kind: "SOCKET",
      port: 8192,
    };
    expect(await languageClientService.start([socketServer])).toBe(undefined);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      LANGUAGE_ID,
      SERVER_NAME,
      expect.any(Function),
      {
        documentSelector: [LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID],
        errorHandler: expect.any(Function),
        middleware: {},
        outputChannel,
        synchronize: {
          fileEvents: [undefined, undefined, undefined, undefined],
        },
      },
    );
  });

  test("Test LanguageClientService retrieve analysis passes", async () => {
    const expectedResult = { programs: ["A", "B", "C"] };
    LanguageClient.prototype.sendRequest = () =>
      Promise.resolve(expectedResult);
    expect(await languageClientService.start([javaServer])).toBe(undefined);
    expect(
      await languageClientService.retrieveAnalysis(
        "test",
        "text",
        new vscode.Position(0, 0),
      ),
    ).toBe(expectedResult);
  });

  test("Test LanguageClientService fire a dispose() command on LanguageClient", async () => {
    const spy = jest.spyOn(LanguageClient.prototype, "dispose");
    await languageClientService.start([javaServer]);
    expect(spy).not.toHaveBeenCalled();
    const returnedValue = await languageClientService.dispose();
    expect(spy).toHaveBeenCalled();
  });
});
