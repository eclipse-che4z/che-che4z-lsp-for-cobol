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

import { Diagnostic, OutputChannel } from "vscode";
import { DialectService } from "../../dialect/DialectService";
import { LanguageClientService } from "../../services/LanguageClientService";
import { GenericNotificationHandler } from "vscode-languageclient";
import { LanguageClient } from "vscode-languageclient/node";

let languageClientService: LanguageClientService;
let outputChannel: OutputChannel;
let dialectHandler: GenericNotificationHandler;
let languageClient: LanguageClient;

describe("DialectService test", () => {
  beforeEach(() => {
    languageClient = {
      sendNotification: jest.fn(),
    } as unknown as LanguageClient;

    languageClientService = {
      addNotificationHandler: (
        route: string,
        handler: GenericNotificationHandler,
      ) => {
        dialectHandler = handler;
      },
      getLanguageClient: () => languageClient,
    } as unknown as LanguageClientService;
    outputChannel = {
      appendLine: jest.fn(),
    } as unknown as OutputChannel;
  });

  test("Test DialectService constructor creates handlers for LSP client", () => {
    languageClientService.addNotificationHandler = jest.fn();
    new DialectService(languageClientService, outputChannel);
    expect(languageClientService.addNotificationHandler).toHaveBeenCalled();
  });

  test("Test DialectService registerStartHandler creates handlers for LSP client", () => {
    const service = new DialectService(languageClientService, outputChannel);

    service.registerStartHandler(
      "DIALECT",
      (_programUri: string, _text: string) => {
        return Promise.resolve(new Map<string, Diagnostic[]>());
      },
    );
    expect(service["handlers"].size).toBe(1);
  });

  test("Test DialectService log error to the output channel if handler was not found", () => {
    new DialectService(languageClientService, outputChannel);
    dialectHandler("DIALECT", "URI", "TEXT");
    expect(outputChannel.appendLine).toHaveBeenCalledWith(
      "Handler for the dialect DIALECT was not found, dialect processing ignored",
    );
  });

  test("Test DialectService handles dialect processing event", () => {
    const service = new DialectService(languageClientService, outputChannel);
    let processDialect = false;

    service.registerStartHandler(
      "DIALECT",
      (_programUri: string, _text: string) => {
        processDialect = true;
        return Promise.resolve(new Map<string, Diagnostic[]>());
      },
    );
    dialectHandler("DIALECT", "URI", "TEXT");
    expect(processDialect).toBeTruthy();
  });
});
