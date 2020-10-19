package com.broadcom.lsp.cobol.core.messages;

import lombok.NonNull;

public class KeyNotFoundException extends RuntimeException {
  public KeyNotFoundException(@NonNull String s) {}
}
