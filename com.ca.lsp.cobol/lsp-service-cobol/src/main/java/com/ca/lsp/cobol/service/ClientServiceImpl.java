package com.ca.lsp.cobol.service;

import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.StringJoiner;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.LSP_PREFIX;

@Slf4j
@Singleton
public class ClientServiceImpl implements ClientService {
    private Provider<LanguageClient> clientProvider;

    @Inject
    ClientServiceImpl(Provider<LanguageClient> clientProvider) {
        this.clientProvider = clientProvider;
    }

    @Override
    public CompletableFuture<String> callClient(String... param) {
        ConfigurationItem item = new ConfigurationItem();
        StringJoiner joiner = new StringJoiner(".");
        joiner.add(LSP_PREFIX.label);
        Arrays.asList(param).forEach(joiner::add);
        item.setSection(joiner.toString());
        item.setScopeUri(null);
        List<ConfigurationItem> itemList = Collections.singletonList(item);
        ConfigurationParams params = new ConfigurationParams(itemList);
        return clientProvider.get().configuration(params).thenApply(data -> ((JsonPrimitive)data.get(0)).getAsString());
    }

    @Override
    public String callClientSync(String... section) throws ExecutionException, InterruptedException {
        return callClient(section).get();
    }
}
