package com.ca.lsp.cobol.service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

public interface ClientService {
  // TODO:provide more descriptive name for this class
  CompletableFuture<List<Object>> callClient(String... section);
}
