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

import org.antlr.v4.runtime.*;
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
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
    when(localeMock.getApplicationLocale()).thenReturn(Locale.ENGLISH);
    MessageService messageService =
        new PropertiesMessageService("resourceBundles/test", localeMock);
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
  void whenValidatedTextIsOutOfRange_thenExpectErrorNotification() {
    checkErrorForRealMethod("in range 1 to 9", p -> {
      doCallRealMethod().when(p).validateTextInRange(anyString(), anyInt(), anyInt());
      ((MessageServiceParser) mockParser).validateTextInRange("0", 0, 10);
    }, "paser.validValueMsg");
  }

  @Test
  void whenValidatedTextInValidRange_thenExpectNoErrorNotification() {
    doCallRealMethod().when((MessageServiceParser) mockParser).validateTextInRange(anyString(), anyInt(), anyInt());
    ((MessageServiceParser) mockParser).validateTextInRange("5", 0, 10);
    verify(((MessageServiceParser) mockParser), never()).notifyError(any(), any());
  }

  @Test
  void whenPassNot34Nor16_thenExpectErrorNotification() {
    checkErrorForRealMethod("34 or 16", p -> {
      doCallRealMethod().when(p).validate34or16(anyString());
      ((MessageServiceParser) mockParser).validate34or16("10");
    }, "paser.validValueMsg");
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
