package com.ca.lsp.cobol;

import org.eclipse.lsp4j.jsonrpc.services.JsonNotification;
import org.eclipse.lsp4j.services.LanguageClient;

public interface OtherLangClient extends LanguageClient {
  @JsonNotification("poc/toClient")
  void sendFoobar(Message msg);
}
