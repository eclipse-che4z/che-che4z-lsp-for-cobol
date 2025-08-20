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

import { Diagnostic, ExtensionContext, OutputChannel } from "vscode";
import { DialectService } from "../../dialect/DialectService";
import { LanguageClientService } from "../../services/LanguageClientService";
import { GenericRequestHandler } from "vscode-languageclient";
import { LanguageClient } from "vscode-languageclient/node";

describe("DialectService test", () => {
  let languageClientService: LanguageClientService;
  let outputChannel: OutputChannel;
  let dialectHandler: GenericRequestHandler<unknown, unknown>;
  let languageClient: LanguageClient;
  const context = {
    subscriptions: [],
  };

  beforeEach(() => {
    languageClient = {
      sendNotification: jest.fn(),
    } as unknown as LanguageClient;

    languageClientService = {
      addRequestHandler: jest
        .fn()
        .mockImplementation(
          (route: string, handler: GenericRequestHandler<unknown, unknown>) => {
            dialectHandler = handler;
          },
        ),
      getLanguageClient: () => languageClient,
    } as unknown as LanguageClientService;
    outputChannel = {
      appendLine: jest.fn(),
    } as unknown as OutputChannel;
    dialectHandler = jest.fn();
  });

  test("Test DialectService constructor creates handlers for LSP client", () => {
    new DialectService(
      context as unknown as ExtensionContext,
      languageClientService,
      outputChannel,
    );
    expect(languageClientService.addRequestHandler).toHaveBeenCalled();
  });

  test("Test DialectService registerStartHandler creates handlers for LSP client", () => {
    const service = new DialectService(
      context as unknown as ExtensionContext,
      languageClientService,
      outputChannel,
    );

    service.registerStartHandler("DIALECT", () => {
      return Promise.resolve(new Map<string, Diagnostic[]>());
    });
    expect(service["handlers"].size).toBe(1);
  });

  test("Test DialectService log error to the output channel if handler was not found", () => {
    new DialectService(
      context as unknown as ExtensionContext,
      languageClientService,
      outputChannel,
    );
    dialectHandler("DIALECT", "URI", "TEXT");
    expect(outputChannel.appendLine).toHaveBeenCalledWith(
      "Handler for the dialect DIALECT was not found, dialect processing ignored",
    );
  });

  test("Test DialectService handles dialect processing event", () => {
    const service = new DialectService(
      context as unknown as ExtensionContext,
      languageClientService,
      outputChannel,
    );
    let processDialect = false;

    service.registerStartHandler("DIALECT", () => {
      processDialect = true;
      return Promise.resolve(new Map<string, Diagnostic[]>());
    });
    dialectHandler("DIALECT", "URI", "TEXT");
    expect(processDialect).toBeTruthy();
  });
});
