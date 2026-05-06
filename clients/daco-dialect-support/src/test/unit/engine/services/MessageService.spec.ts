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

import { MessageService } from "../../../../engine/services/MessageService";

describe("MessageService test", () => {
  const messages = {
    "test.key": "Hello, {0}!",
  };

  const messageService = new MessageService(messages);

  it("should format messages with parameters", () => {
    const result = messageService.get("test.key", "World");
    expect(result).toBe("Hello, World!");
  });

  it("should throw error for missing keys", () => {
    expect(() => messageService.get("unknown.key")).toThrow(
      "Missing message: unknown.key",
    );
  });
});
