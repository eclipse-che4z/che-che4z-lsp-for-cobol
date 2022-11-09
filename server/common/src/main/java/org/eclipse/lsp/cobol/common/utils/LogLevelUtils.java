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
package org.eclipse.lsp.cobol.common.utils;

import com.google.common.collect.Iterables;
import com.google.gson.JsonPrimitive;
import lombok.experimental.UtilityClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

/**
 * Update the log level for the application.
 *
 * <p>IMPORTANT: This class relies on the concrete implementations by logback. SLF4J don't expose
 * any contract to update the log level on runtime.
 *
 * <p>In case of wrong input, log level defaults to {@link ch.qos.logback.classic.Level#ERROR}
 */
@UtilityClass
public class LogLevelUtils {

  private static final ch.qos.logback.classic.Logger ROOT_LOGGER =
      (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
  private static final String NOT_SUPPORTED_MSG = " : not supported for log level update";

  /**
   * Update loglevel for the entire application.
   *
   * @return Consumer#List#Object , currently supports List#String and List#JsonPrimitive
   * @throws IllegalArgumentException currently supports only List#String and List#JsonPrimitive
   */
  public static Consumer<List<Object>> updateLogLevel() {
    return logNode -> {
      if (Objects.nonNull(logNode)) {
        Object localeNode = Iterables.getFirst(logNode, "");
        if (localeNode instanceof JsonPrimitive) {
          updateLogLevel((JsonPrimitive) localeNode);
        } else if (localeNode instanceof String) {
          updateLogLevel((String) localeNode);
        } else {
          throw new IllegalArgumentException(
              localeNode.getClass().getCanonicalName() + NOT_SUPPORTED_MSG);
        }
      }
    };
  }

  /**
   * Update the log level for the application. IMPORTANT: This method relies on the concrete
   * implementations by logback. SLF4J don't expose any contract to update the log level on runtime.
   *
   * @param logLevelNode {@link JsonPrimitive}
   */
  private static void updateLogLevel(JsonPrimitive logLevelNode) {
    updateLogLevel(logLevelNode.getAsString());
  }

  /**
   * Update the log level for the application. IMPORTANT: This method relies on the concrete
   * implementations by logback. SLF4J don't expose any contract to update the log level on runtime.
   *
   * @param level #String
   */
  private static void updateLogLevel(String level) {
    ch.qos.logback.classic.Level logLevel =
        ch.qos.logback.classic.Level.toLevel(
            level.toUpperCase(), ch.qos.logback.classic.Level.ERROR);
    ROOT_LOGGER.setLevel(logLevel);
  }
}
