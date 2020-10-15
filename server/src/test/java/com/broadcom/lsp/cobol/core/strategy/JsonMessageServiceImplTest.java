package com.broadcom.lsp.cobol.core.strategy;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class JsonMessageServiceImplTest {

    private static MessageService messageService = new JsonMessageServiceImpl("src/test/java/com/broadcom/lsp/cobol/core/strategy/test.json");

    @Test
    void whenValidMessageTemplateProvide_getFormattedMessage() {
        final ExternalizeMessage message = messageService.getMessage("1");
        assertEquals("This is a test.", message.getFormattedMessage());

        final ExternalizeMessage message1 = messageService.getMessage("2", "TEST_PARAM");
        assertEquals("This is a test for parameters. Received params is -> TEST_PARAM .", message1.getFormattedMessage());
    }

    @Test
    void whenInValidMessageTemplatePathProvide_getException() {
        Assertions.assertThrows(MessageTemplateLoadException.class, () -> {
            MessageService messageServiceLocal = new JsonMessageServiceImpl("dummy.json");
        });
    }

    @Test
    void whenEmptyMessageTemplateProvided_getException() {
        MessageService messageServiceLocal =
                new JsonMessageServiceImpl("src/test/java/com/broadcom/lsp/cobol/core/strategy/Test_messageServiceEmptyFile.json");
        Assertions.assertThrows(MessageTemplateLoadException.class, () -> messageServiceLocal.getMessage("1"));
    }

    @Test
    void whenInValidMessageTemplateKeyProvided_getInvalidMessageString() {
        final ExternalizeMessage message = messageService.getMessage("3");
        String expectedString = "Invalid key '3' supplied. Please check the externalized message files.";
        assertEquals(expectedString, message.getFormattedMessage());
    }

    @Test
    void addMessageTemplates() {
        MessageTemplate messageTemplate1 = new MessageTemplate("random-1", "Just for testing !!!");
        MessageTemplate messageTemplate2 = new MessageTemplate("random-2", "Just for testing params : %s");
        final List<MessageTemplate> messageTemplateList = List.of(messageTemplate1, messageTemplate2);
        messageService.addMessageTemplates(messageTemplateList);
        assertEquals("Just for testing !!!", messageService.getMessage("random-1").getFormattedMessage());
        assertEquals("Just for testing params : TADA!", messageService.getMessage("random-2", "TADA!").getFormattedMessage());
    }

    @Test
    void whenMessageTemplateKeyAlreadyExist_thenThrowException() {
        // KeyAlreadyExistException
        MessageTemplate messageTemplate1 = new MessageTemplate("1", "Just for testing !!!");
        final List<MessageTemplate> messageTemplateList = List.of(messageTemplate1);
        Assertions.assertThrows(KeyAlreadyExistException.class, () -> messageService.addMessageTemplates(messageTemplateList));
    }

    @Test
    void whenMultipleMsgServiceExist_thenSupportDuplicateKeys() {
        MessageService messageService1 = new JsonMessageServiceImpl("src/test/java/com/broadcom/lsp/cobol/core/strategy/test-2.json");
        final String formattedMessage = messageService1.getMessage("1").getFormattedMessage();
        assertEquals("This is a duplicate key test for diff msg service.", formattedMessage);

    }

    @Test
    void whenMultipleMsgJsonLoadedinOneService_thenDoNotSupportDuplicateKeys() {
        Assertions.assertThrows(KeyAlreadyExistException.class, () -> messageService.loadMessages("src/test/java/com/broadcom/lsp/cobol/core/strategy/test-2.json"));

    }
}