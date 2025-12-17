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
import type { JavaServer } from "../../services/languageClient/ServerTypes";

import { LanguageClientService } from "../../services/LanguageClientService";
import { LanguageClient } from "vscode-languageclient/node";

jest.mock("../../services/JavaCheck", () => ({
  getJavaVersion: jest.fn().mockResolvedValue(17),
}));

const javaServer: JavaServer = {
  kind: "JAVA",
  command: "/test/bin/java",
  jar: vscode.Uri.parse("file:///test/server/server.jar"),
  dialects: vscode.Uri.parse("file:///test/dialectsFolder"),
};

beforeEach(() => {
  jest.clearAllMocks();
});

describe("LanguageClientService", () => {
  let languageClientService: LanguageClientService;

  beforeEach(() => {
    languageClientService = new LanguageClientService(
      "Publisher.Extension-Name",
      [vscode.Uri.parse("cobol:///storagePath")],
      {},
    );
  });

  test("Start is called first, then handler registration", async () => {
    const callSequence: string[] = [];
    const originalStart = LanguageClient.prototype.start;
    LanguageClient.prototype.start = jest.fn().mockImplementation(function (
      this: unknown,
    ) {
      callSequence.push("start");
      return originalStart.apply(this);
    });
    LanguageClient.prototype.onRequest = jest.fn().mockImplementation(() => {
      callSequence.push("onRequest");
    });
    LanguageClient.prototype.onNotification = jest
      .fn()
      .mockImplementation(() => {
        callSequence.push("onNotification");
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
