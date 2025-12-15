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
import type {
  JavaServer,
  NativeServer,
  SocketServer,
} from "../../services/languageClient/ServerTypes";

import { LanguageClientService } from "../../services/LanguageClientService";
import { outputChannel } from "../../services/util/OutputChannel";
import { LanguageClient, State } from "vscode-languageclient/node";

jest.mock("vscode");
jest.mock("vscode-languageclient/node", () => {
  const originalModule = jest.requireActual<{ State: State }>(
    "vscode-languageclient/node",
  );
  class LanguageClient extends jest.fn() {
    public state = State.Stopped;
    start() {
      this.state = State.Running;
    }
    dispose() {
      this.state = State.Stopped;
    }
    createDefaultErrorHandler() {
      return jest.fn();
    }
  }

  return {
    __esModule: true,
    State: originalModule.State,
    LanguageClient,
  };
});
jest.mock("../../services/JavaCheck", () => ({
  getJavaVersion: jest.fn().mockResolvedValue(17),
}));

const javaServer: JavaServer = {
  kind: "JAVA",
  command: "/test/bin/java",
  dialects: vscode.Uri.file("/test/dialectsFolder"),
  jar: vscode.Uri.file("/test/server/server.jar"),
};

beforeEach(() => {
  jest.clearAllMocks();
});

describe("LanguageClientService", () => {
  let languageClientService: LanguageClientService;

  beforeEach(() => {
    languageClientService = new LanguageClientService(
      "Publisher.Extension-Name",
      [vscode.Uri.file("/storagePath")],
      {},
    );
  });

  test("Starts java language server", async () => {
    await languageClientService.start([javaServer]);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      "cobol",
      "COBOL Language Support",
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
        documentSelector: ["cobol", "expcobol", "hpcobol"],
        errorHandler: expect.any(Function) as unknown,
        middleware: {},
        outputChannel,
        synchronize: { fileEvents: expect.any(Array) as unknown },
      },
    );
  });

  test("Starts native language server", async () => {
    const nativeServer: NativeServer = {
      kind: "NATIVE",
      command: vscode.Uri.parse("file:///native/server/folder/executable"),
    };
    await languageClientService.start([nativeServer]);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        args: [
          "pipeEnabled",
          "-Dline.separator=\r\n",
          "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
          "-DserverType=NATIVE",
        ],
        command: "/native/server/folder/executable",
        options: { cwd: "/native/server/folder", detached: false },
      },
      {
        documentSelector: ["cobol", "expcobol", "hpcobol"],
        errorHandler: expect.any(Function) as unknown,
        middleware: {},
        outputChannel,
        synchronize: { fileEvents: expect.any(Array) as unknown },
      },
    );
  });

  test("Starts socket language server", async () => {
    const socketServer: SocketServer = {
      kind: "SOCKET",
      port: 8192,
    };
    await languageClientService.start([socketServer]);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      "cobol",
      "COBOL Language Support",
      expect.any(Function),
      {
        documentSelector: ["cobol", "expcobol", "hpcobol"],
        errorHandler: expect.any(Function) as unknown,
        middleware: {},
        outputChannel,
        synchronize: { fileEvents: expect.any(Array) as unknown },
      },
    );
  });

  test("Start is called first, then handler registration", async () => {
    const callSequence: String[] = [];
    LanguageClient.prototype.onRequest = jest.fn().mockImplementation(() => {
      callSequence.push("onRequest");
    });
    LanguageClient.prototype.onNotification = jest
      .fn()
      .mockImplementation(() => {
        callSequence.push("onNotification");
      });
    const originalStart = LanguageClient.prototype.start;
    LanguageClient.prototype.start = jest.fn().mockImplementation(function (
      this: any,
    ) {
      originalStart.apply(this);
      callSequence.push("start");
    });
    languageClientService.addRequestHandler("request/name", jest.fn());
    languageClientService.addNotificationHandler("event/name", jest.fn());
    await languageClientService.start([javaServer]);
    expect(callSequence).toEqual(["start", "onRequest", "onNotification"]);
  });
  test("Retrieve analysis passes", async () => {
    const expectedResult = { programs: ["A", "B", "C"] };
    LanguageClient.prototype.sendRequest = () =>
      Promise.resolve(expectedResult);
    await languageClientService.start([javaServer]);
    const analysisResult = await languageClientService.retrieveAnalysis(
      "test",
      "text",
      new vscode.Position(0, 0),
    );
    expect(analysisResult).toBe(expectedResult);
  });

  test("Fire a .dispose() on LanguageClient", async () => {
    const spy = jest.spyOn(LanguageClient.prototype, "dispose");
    await languageClientService.start([javaServer]);
    expect(spy).not.toHaveBeenCalled();
    await languageClientService.dispose();
    expect(spy).toHaveBeenCalled();
  });
});
