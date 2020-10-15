package com.broadcom.lsp.cobol.core.strategy;

import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.IllegalFormatConversionException;
import java.util.MissingFormatArgumentException;

@AllArgsConstructor
@Builder
public class ExternalizeMessage {
    private final MessageTemplate messageTemplate;
    private final Object[] parameters;
    private final String key;

    /***
     *
     * @return a formatted text for a {@link ExternalizeMessage} object.
     * @throws MissingFormatArgumentException   when the amount of parameters is less than required.
     * @throws IllegalFormatConversionException when format is invalid.
     */
    public String getFormattedMessage() {
        return String.format(messageTemplate.getMessage(), parameters);
    }
}
