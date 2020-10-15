package com.broadcom.lsp.cobol.core.strategy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageTemplate {
    private String key;
    private String message;

    public boolean isValidKey() {
       return !key.equals(MessageService.INVALID_KEY);
    }
}
