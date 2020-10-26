package com.broadcom.lsp.cobol.core.messages;

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
 */
@UtilityClass
public class LogLevel {

  private static final ch.qos.logback.classic.Logger rootLogger =
      (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);

  /**
   * Update loglevel for the entire application.
   *
   * @return Consumer#List#Object , currently supports List#String and List#JsonPrimitive
   */
  public static Consumer<List<Object>> updateLogLevel() {
    return loglevel -> {
      if (Objects.nonNull(loglevel)) {
        Object localeNode = Iterables.getFirst(loglevel, "");
        if (localeNode instanceof JsonPrimitive) {
          updateLogLevel((JsonPrimitive) localeNode);
        }
        if (localeNode instanceof String) {
          updateLogLevel((String) localeNode);
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
    rootLogger.setLevel(logLevel);
  }
}
