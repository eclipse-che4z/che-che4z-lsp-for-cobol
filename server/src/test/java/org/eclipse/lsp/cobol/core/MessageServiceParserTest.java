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
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.Locale;

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
}
