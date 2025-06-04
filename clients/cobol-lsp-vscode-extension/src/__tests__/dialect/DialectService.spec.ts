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

import { Diagnostic, OutputChannel, Uri } from "vscode";
import { DialectService } from "../../dialect/DialectService";
import { LanguageClientService } from "../../services/LanguageClientService";

let languageclient: LanguageClientService;
let outputChannel: OutputChannel;

describe("DialectService test", () => {
  beforeEach(() => {
    languageclient = {
      addNotificationHandler: jest.fn(),
    } as unknown as LanguageClientService;
    outputChannel = {} as OutputChannel;
  });

  test("Test DialectService constructor creates handlers for LSP client", () => {
    new DialectService(languageclient, outputChannel);
    expect(languageclient.addNotificationHandler).toHaveBeenCalled();
  });

  test("Test DialectService registerStartHandler creates handlers for LSP client", () => {
    const service = new DialectService(languageclient, outputChannel);

    service.registerStartHandler(
      "DIALECT",
      (_programUri: string, _text: string) => {
        return Promise.resolve(new Map<string, Diagnostic[]>());
      },
    );
    expect(service["handlers"].size).toBe(1);
  });
});
