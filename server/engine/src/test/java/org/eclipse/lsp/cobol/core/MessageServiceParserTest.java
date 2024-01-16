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

package org.eclipse.lsp.cobol.core;

import org.antlr.v4.runtime.Parser;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.WorkingFolderService;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.Locale;
import java.util.function.Consumer;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

/** Test for {@link MessageServiceParser} */
class MessageServiceParserTest {

  private Parser mockParser;

  @BeforeEach
  void beforeEach() {
    mockParser = mock(MessageServiceParser.class);
    doCallRealMethod().when((MessageServiceParser) mockParser).notifyError(anyString());
    LocaleStore localeMock = mock(LocaleStore.class);
    SettingsService settingsService = mock(SettingsService.class);
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    when(localeMock.getApplicationLocale()).thenReturn(Locale.ENGLISH);
    MessageService messageService =
        new PropertiesMessageService("resourceBundles/test", localeMock, settingsService, workingFolderService);
    CobolErrorStrategy errorStrategy = mock(CobolErrorStrategy.class);
    when(mockParser.getErrorHandler()).thenReturn(errorStrategy);
    when(errorStrategy.getMessageService()).thenReturn(messageService);
  }

  @Test
  void whenValidMsgIdIsPassed_thenExpectStringExternalization() {
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    ((MessageServiceParser) mockParser).notifyError("1");
    verify((MessageServiceParser) mockParser).notifyListeners(captor.capture());
    assertEquals("This is a test.", captor.getValue());
  }

  @Test
  void whenInvalidKeyIsPassed_thenExpectNoException() {
    Assertions.assertDoesNotThrow(() -> ((MessageServiceParser) mockParser).notifyError("dummy"));
  }

  @Test
  void whenInvalidTokenIsPassed_thenExpectErrorNotification() {
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    String value = "value to parse";
    doCallRealMethod().when((MessageServiceParser) mockParser).validateTokenWithRegex(anyString(), anyString(), anyString());
    ((MessageServiceParser) mockParser).validateTokenWithRegex(value, "\\d+[Gg]", "db2SqlParser.size");
    verify((MessageServiceParser) mockParser).notifyError(eq("db2SqlParser.size"), captor.capture());

    assertEquals(value, captor.getValue());
  }

  @Test
  void whenLessThanMinimumIsPassed_thenExpectErrorNotification() {
    checkErrorForRealMethod("0", p -> {
      doCallRealMethod().when(p).validateDb2MaxInt(anyString());
      ((MessageServiceParser) mockParser).validateDb2MaxInt("0");
    }, "db2SqlParser.maxIntValue");
  }

  @Test
  void whenMoreThanMaximumIsPassed_thenExpectErrorNotification() {
    checkErrorForRealMethod("32768", p -> {
      doCallRealMethod().when(p).validateDb2MaxInt(anyString());
      ((MessageServiceParser) mockParser).validateDb2MaxInt("32768");
    }, "db2SqlParser.maxIntValue");
  }

  @Test
  void whenValidIntIsPassed_thenExpectNoErrorNotifications() {
    doCallRealMethod().when((MessageServiceParser) mockParser).validateDb2MaxInt(anyString());
    ((MessageServiceParser) mockParser).validateDb2MaxInt("50");
    verify(((MessageServiceParser) mockParser), never()).notifyError(any(), any());
  }

  @Test
  @Disabled("Seems issue related to mockito version update")
  void whenValidatedTextIsOutOfRange_thenExpectErrorNotification() {
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    doCallRealMethod().when((MessageServiceParser) mockParser).validateTextInRange(anyString(), anyInt(), anyInt());
    ((MessageServiceParser) mockParser).validateTextInRange("0", 0, 10);
    verify((MessageServiceParser) mockParser).notifyError(eq("parsers.validValueMsg"), captor.capture());
    assertEquals("in range 1 to 9", captor.getValue());
  }

  @Test
  void whenValidatedTextInValidRange_thenExpectNoErrorNotification() {
    doCallRealMethod().when((MessageServiceParser) mockParser).validateTextInRange(anyString(), anyInt(), anyInt());
    ((MessageServiceParser) mockParser).validateTextInRange("5", 0, 10);
    verify(((MessageServiceParser) mockParser), never()).notifyError(any(), any());
  }

  @Test
  @Disabled("Seems issue related to mockito version update")
  void whenPassNot34Nor16_thenExpectErrorNotification() {
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    doCallRealMethod().when((MessageServiceParser) mockParser).validate34or16(anyString());
    ((MessageServiceParser) mockParser).validate34or16("10");
    verify((MessageServiceParser) mockParser).notifyError(eq("parsers.validValueMsg"), captor.capture());
    assertEquals("34 or 16", captor.getValue());
  }

  @Test
  void whenPass34_thenExpectNoErrorNotification() {
    doCallRealMethod().when((MessageServiceParser) mockParser).validate34or16(anyString());
    ((MessageServiceParser) mockParser).validate34or16("34");
    verify(((MessageServiceParser) mockParser), never()).notifyError(any(), any());
  }

  private void checkErrorForRealMethod(String value, Consumer<MessageServiceParser> consumer, String errorCode) {
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);
    consumer.accept((MessageServiceParser) mockParser);
    verify((MessageServiceParser) mockParser).notifyError(eq(errorCode), captor.capture());
    assertEquals(value, captor.getValue());
  }
}
