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

describe("messages module tests", () => {
  test("LoggerItem test", () => {
    const item = { severity: 2, message: "message" };

    expect(item.severity).toBe(2);
    expect(item.message).toBe("message");
  });

  test("WorkerLoggerMessage test", () => {
    const item = { severity: 2, message: "message" };
    const workerMessage = { type: "log", payload: [item] };

    expect(workerMessage.payload.length).toBe(1);
    expect(workerMessage.payload[0].severity).toBe(2);
    expect(workerMessage.payload[0].message).toBe("message");
  });
});
