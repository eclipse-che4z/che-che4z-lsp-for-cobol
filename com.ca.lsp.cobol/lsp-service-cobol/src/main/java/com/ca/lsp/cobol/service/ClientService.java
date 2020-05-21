package com.ca.lsp.cobol.service;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;

public interface ClientService {
  CompletableFuture<List<String>> callClient(String... section);

  Optional<List<String>> callClientSync(String... section);
}
