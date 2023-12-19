/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.cli;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.layout.TTLLLayout;
import ch.qos.logback.classic.spi.Configurator;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.ConsoleAppender;
import ch.qos.logback.core.encoder.LayoutWrappingEncoder;
import ch.qos.logback.core.spi.ContextAwareBase;
import org.eclipse.lsp.cobol.LangServerBootstrap;

import static org.slf4j.Logger.ROOT_LOGGER_NAME;

/**
 * The LogConfig class is a {@link Configurator} implementation that configures the logger for different modes (CLI/LSP).
 */
public class LogConfig extends ContextAwareBase implements Configurator {
  @Override
  public ExecutionStatus configure(LoggerContext loggerContext) {
    // Reconfigure logger for CLI mode
    if (LangServerBootstrap.cliMode) {
      addInfo("Setting up CLI configuration.");
      Logger rootLogger = loggerContext.getLogger(ROOT_LOGGER_NAME);
      rootLogger.addAppender(createAppender(loggerContext));
      rootLogger.setLevel(Level.INFO);
      return ExecutionStatus.DO_NOT_INVOKE_NEXT_IF_ANY;
    }
    return ExecutionStatus.NEUTRAL;
  }

  private static ConsoleAppender<ILoggingEvent> createAppender(LoggerContext loggerContext) {
    ConsoleAppender<ILoggingEvent> console = new ConsoleAppender<>();
    console.setContext(loggerContext);
    console.setName("console");
    console.setTarget("System.err");
    console.setEncoder(createEncoder(loggerContext, createLayout(loggerContext)));
    console.start();
    return console;
  }

  private static LayoutWrappingEncoder<ILoggingEvent> createEncoder(LoggerContext loggerContext, TTLLLayout layout) {
    LayoutWrappingEncoder<ILoggingEvent> encoder = new LayoutWrappingEncoder<>();
    encoder.setContext(loggerContext);
    encoder.setLayout(layout);
    encoder.start();
    return encoder;
  }

  private static TTLLLayout createLayout(LoggerContext loggerContext) {
    TTLLLayout layout = new TTLLLayout();
    layout.setContext(loggerContext);
    layout.start();
    return layout;
  }
}
