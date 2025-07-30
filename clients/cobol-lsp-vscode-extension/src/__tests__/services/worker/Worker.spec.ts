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

import { DiagnosticSeverityDto } from "@code4z/analysis";
import { Logger } from "../../../services/worker/Worker";

describe("Wroker logger class tests", () => {
  test("Logger test trace", () => {
    const logger = new Logger();
    logger.trace("trace message");

    expect(logger.messages.length).toBe(1);
    expect(logger.messages[0].severity).toBe(
      DiagnosticSeverityDto.Hint.valueOf(),
    );
    expect(logger.messages[0].message).toBe("trace message");
  });

  test("Logger test debug", () => {
    const logger = new Logger();
    logger.debug("debug message");

    expect(logger.messages.length).toBe(1);
    expect(logger.messages[0].severity).toBe(
      DiagnosticSeverityDto.Hint.valueOf(),
    );
    expect(logger.messages[0].message).toBe("debug message");
  });

  test("Logger test info", () => {
    const logger = new Logger();
    logger.info("info message");

    expect(logger.messages.length).toBe(1);
    expect(logger.messages[0].severity).toBe(
      DiagnosticSeverityDto.Information.valueOf(),
    );
    expect(logger.messages[0].message).toBe("info message");
  });

  test("Logger test warn", () => {
    const logger = new Logger();
    logger.warn("warn message");

    expect(logger.messages.length).toBe(1);
    expect(logger.messages[0].severity).toBe(
      DiagnosticSeverityDto.Warning.valueOf(),
    );
    expect(logger.messages[0].message).toBe("warn message");
  });

  test("Logger test error", () => {
    const logger = new Logger();
    logger.error("error message");

    expect(logger.messages.length).toBe(1);
    expect(logger.messages[0].severity).toBe(
      DiagnosticSeverityDto.Error.valueOf(),
    );
    expect(logger.messages[0].message).toBe("error message");
  });
});

describe("Wroker module tests", () => {
  test("Logger send messages and clear message queue", () => {
    const logger = new Logger();
    for (let i = 0; i < 999; i++) {
      logger.debug("debug message");
    }

    expect(logger.messages.length).toBe(999);
    logger.debug("debug message");
    expect(logger.messages.length).toBe(0);
  });
});
