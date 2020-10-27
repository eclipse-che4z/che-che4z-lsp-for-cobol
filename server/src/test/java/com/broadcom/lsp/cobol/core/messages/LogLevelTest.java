package com.broadcom.lsp.cobol.core.messages;

import ch.qos.logback.classic.Level;
import com.google.gson.JsonPrimitive;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class LogLevelTest {

  @Test
  void updateLogLevel() {
    ch.qos.logback.classic.Logger logger =
        (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
    LogLevel.updateLogLevel().accept(List.of("DEBUG"));
    assertEquals(Level.DEBUG, logger.getLevel());

    LogLevel.updateLogLevel().accept(List.of("INFO"));
    assertEquals(Level.INFO, logger.getLevel());

    LogLevel.updateLogLevel().accept(List.of(new JsonPrimitive("ERROR")));
    assertEquals(Level.ERROR, logger.getLevel());
  }
}
