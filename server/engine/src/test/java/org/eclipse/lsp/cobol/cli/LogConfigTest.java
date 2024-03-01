/*
 * Copyright (c) 2024 Broadcom.
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
import ch.qos.logback.classic.spi.Configurator.ExecutionStatus;
import ch.qos.logback.core.ConsoleAppender;
import org.eclipse.lsp.cobol.LangServerBootstrap;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.verify;

/**
 * Test for {@link LogConfig}
 */
class LogConfigTest {
    @Test
    void testConfigure() {
        LoggerContext loggerContext = mock(LoggerContext.class);
        Logger rootLogger = mock(Logger.class);
        LangServerBootstrap.cliMode = true;
        when(loggerContext.getLogger(Logger.ROOT_LOGGER_NAME)).thenReturn(rootLogger);
        LogConfig logConfig = new LogConfig();
        ExecutionStatus result = logConfig.configure(loggerContext);

        verify(loggerContext).getLogger(Logger.ROOT_LOGGER_NAME);
        verify(rootLogger).addAppender(any(ConsoleAppender.class));
        verify(rootLogger).setLevel(Level.INFO);

        assertEquals(ExecutionStatus.DO_NOT_INVOKE_NEXT_IF_ANY, result);
    }
}
