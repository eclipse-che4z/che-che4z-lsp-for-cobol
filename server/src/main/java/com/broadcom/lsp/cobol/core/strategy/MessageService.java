package com.broadcom.lsp.cobol.core.strategy;

import java.util.List;

public interface MessageService {

    String INVALID_KEY = "invalid-key";
    String INVALID_KEY_S_SUPPLIED_PLEASE_CHECK_THE_EXTERNALIZED_MESSAGE_FILES = "Invalid key '%s' supplied. Please check the externalized message files.";

    ExternalizeMessage getMessage(String key, Object... parameters);

    void loadMessages(String filePath);

    void addMessageTemplates(List<MessageTemplate> messageTemplateList);
}
