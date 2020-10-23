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

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Locale;
import java.util.MissingResourceException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class PropertiesMessageServiceTest {

  private static MessageService messageService;
  private LocaleStore localeMock;

  @BeforeEach
  public void beforeAll() {
    localeMock = mock(LocaleStore.class);
    when(localeMock.getApplicationLocale()).thenReturn(Locale.ENGLISH);
    messageService = new PropertiesMessageService("message/test", localeMock);
  }

  @Test
  void whenValidMessageTemplateProvide_getFormattedMessage() {
    final String message = messageService.getMessage("1");
    assertEquals("This is a test.", message);

    final String message1 = messageService.getMessage("2", "TEST_PARAM");
    assertEquals("This is a test for parameters. Received params is -> TEST_PARAM .", message1);
  }

  @Test
  void whenValidMessageTemplateProvideFR_getFormattedMessage() {
    when(localeMock.getApplicationLocale()).thenReturn(Locale.FRENCH);
    MessageService messageServiceFR = new PropertiesMessageService("message/test", localeMock);
    assertEquals("French test selected.", messageServiceFR.getMessage("1"));

    assertEquals(
        "French test with parameters. Received params is -> TEST_PARAM .",
        messageServiceFR.getMessage("2", "TEST_PARAM"));
  }

  @Test
  void whenInValidMessageTemplatePathProvide_getException() {
    Assertions.assertThrows(
        MissingResourceException.class, () -> new PropertiesMessageService("dummy", localeMock));
  }

  @Test
  void whenEmptyMessageTemplateProvided_getException() {
    MessageService messageServiceLocal =
        new PropertiesMessageService("message/Test_messageServiceEmptyFile", localeMock);
    Assertions.assertThrows(
        MissingResourceException.class, () -> messageServiceLocal.getMessage("1"));
  }

  @Test
  void whenMultipleMsgServiceExist_thenSupportDuplicateKeys() {
    MessageService messageService1 = new PropertiesMessageService("message/test-2", localeMock);
    final String formattedMessage = messageService1.getMessage("1", localeMock);
    assertEquals("This is a duplicate key test for diff msg service.", formattedMessage);
  }
}
