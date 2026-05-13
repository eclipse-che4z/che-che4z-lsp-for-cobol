/*
 * Copyright (c) 2026 Broadcom.
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
import { URI } from "vscode-uri";
import { MessageService } from "../../../../engine/services/MessageService";

jest.mock("vscode");

describe("MessageService test", () => {
  const messages = {
    "test.key": "Hello, {0}!",
  };

  const messageService = new MessageService(messages);

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should format messages with parameters", () => {
    const result = messageService.get("test.key", "World");
    expect(result).toBe("Hello, World!");
  });

  it("should throw error for missing keys", () => {
    expect(() => messageService.get("unknown.key")).toThrow(
      "Missing message: unknown.key",
    );
  });

  it("should format number instead of message for missing parameter", () => {
    const result = messageService.get("test.key");
    expect(result).toBe("Hello, {0}!");
  });

  it("should create MessageService object with correct messages", async () => {
    const context = {
      extensionUri: URI.file("/path/to/extension"),
    };
    jest
      .spyOn(vscode.workspace.fs, "readFile")
      .mockResolvedValue(Buffer.from(JSON.stringify(messages)));

    const service = await MessageService.create(context as any);
    expect(service).toBeInstanceOf(MessageService);
  });
});
