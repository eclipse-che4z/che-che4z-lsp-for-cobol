package com.broadcom.lsp.cobol.core.strategy;

public class KeyAlreadyExistException extends RuntimeException {
    public KeyAlreadyExistException(String errorMsg) {
        super(errorMsg);
    }
}
