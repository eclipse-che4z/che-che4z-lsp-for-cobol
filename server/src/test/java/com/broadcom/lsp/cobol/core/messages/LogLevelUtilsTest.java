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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.cobol.core.messages;

import ch.qos.logback.classic.Level;
import com.google.gson.JsonPrimitive;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test checks the runtime root log level update provided by {@link
 * com.broadcom.lsp.cobol.core.messages.LogLevelUtils}
 */
class LogLevelUtilsTest {

  /** Test the runtime root log level update provided by {@link LogLevelUtils#updateLogLevel()} */
  @Test
  void updateLogLevel() {
    ch.qos.logback.classic.Logger logger =
        (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
    LogLevelUtils.updateLogLevel().accept(List.of("DEBUG"));
    assertEquals(Level.DEBUG, logger.getLevel());

    LogLevelUtils.updateLogLevel().accept(List.of("INFO"));
    assertEquals(Level.INFO, logger.getLevel());

    LogLevelUtils.updateLogLevel().accept(List.of(new JsonPrimitive("ERROR")));
    assertEquals(Level.ERROR, logger.getLevel());
  }

  /** Assert {@link IllegalArgumentException} is thrown when invalid inputs are provided. */
  @Test
  void whenUnSupportedObjectPassed_thenThrowException() {
    Assertions.assertThrows(
        IllegalArgumentException.class,
        () -> LogLevelUtils.updateLogLevel().accept(List.of(new DummyElement("INFO"))));
  }

  private static class DummyElement {
    private final String info;

    public DummyElement(String info) {
      this.info = info;
    }
  }
}
