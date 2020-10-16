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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;

class JsonMessageServiceImplTest {

  public static final Optional<Locale> EN_LOCALE = Optional.of(new Locale("en", "en"));
  public static final Optional<Locale> FR_LOCALE = Optional.of(new Locale("fr", "fr"));
  private static MessageService messageService = new JsonMessageServiceImpl("test", EN_LOCALE);

  @Test
  void whenValidMessageTemplateProvide_getFormattedMessage() {
    final ExternalizedMessage message = messageService.getMessage("1");
    assertEquals("This is a test.", message.getFormattedMessage());

    final ExternalizedMessage message1 = messageService.getMessage("2", "TEST_PARAM");
    assertEquals(
        "This is a test for parameters. Received params is -> TEST_PARAM .",
        message1.getFormattedMessage());
  }

  @Test
  void whenValidMessageTemplateProvideFR_getFormattedMessage() {
    MessageService messageServiceFR = new JsonMessageServiceImpl("test", FR_LOCALE);
    final ExternalizedMessage message = messageServiceFR.getMessage("1");
    assertEquals("French test selected.", message.getFormattedMessage());

    final ExternalizedMessage message1 = messageServiceFR.getMessage("2", "TEST_PARAM");
    assertEquals(
            "French test with parameters. Received params is -> TEST_PARAM .",
            message1.getFormattedMessage());
  }

  @Test
  void whenInValidMessageTemplatePathProvide_getException() {
    Assertions.assertThrows(
        MissingResourceException.class,
        () -> {
          MessageService messageServiceLocal = new JsonMessageServiceImpl("dummy", EN_LOCALE);
        });
  }

  @Test
  void whenEmptyMessageTemplateProvided_getException() {
    MessageService messageServiceLocal =
        new JsonMessageServiceImpl("Test_messageServiceEmptyFile", EN_LOCALE);
    Assertions.assertThrows(
        MessageTemplateLoadException.class, () -> messageServiceLocal.getMessage("1"));
  }

  @Test
  void whenInValidMessageTemplateKeyProvided_getInvalidMessageString() {
    final ExternalizedMessage message = messageService.getMessage("3");
    String expectedString =
        "Invalid key '3' supplied. Please check the externalized message files.";
    assertEquals(expectedString, message.getFormattedMessage());
  }

  @Test
  void addMessageTemplates() {
    MessageTemplate messageTemplate1 = new MessageTemplate("random-1", "Just for testing !!!");
    MessageTemplate messageTemplate2 =
        new MessageTemplate("random-2", "Just for testing params : %s");
    final List<MessageTemplate> messageTemplateList = List.of(messageTemplate1, messageTemplate2);
    messageService.addMessageTemplates(messageTemplateList);
    assertEquals(
        "Just for testing !!!", messageService.getMessage("random-1").getFormattedMessage());
    assertEquals(
        "Just for testing params : TADA!",
        messageService.getMessage("random-2", "TADA!").getFormattedMessage());
  }

  @Test
  void whenMessageTemplateKeyAlreadyExist_thenThrowException() {
    // KeyAlreadyExistException
    MessageTemplate messageTemplate1 = new MessageTemplate("1", "Just for testing !!!");
    final List<MessageTemplate> messageTemplateList = List.of(messageTemplate1);
    Assertions.assertThrows(
        KeyAlreadyExistException.class,
        () -> messageService.addMessageTemplates(messageTemplateList));
  }

  @Test
  void whenMultipleMsgServiceExist_thenSupportDuplicateKeys() {
    MessageService messageService1 = new JsonMessageServiceImpl("test-2", EN_LOCALE);
    final String formattedMessage = messageService1.getMessage("1").getFormattedMessage();
    assertEquals("This is a duplicate key test for diff msg service.", formattedMessage);
  }

  @Test
  void whenMultipleMsgJsonLoadedinOneService_thenDoNotSupportDuplicateKeys() {
    Assertions.assertThrows(
        KeyAlreadyExistException.class, () -> messageService.loadMessages("test-2", EN_LOCALE));
  }
}
