package com.ca.lsp.cobol.service;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

public interface ClientService {
    CompletableFuture<String> callClient(String... section);
    String callClientSync(String... section) throws ExecutionException, InterruptedException;
}
