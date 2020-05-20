package com.ca.lsp.cobol.service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

public interface ClientService {
    CompletableFuture<List<Object>> callClient(String param);
}
