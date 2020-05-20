package com.ca.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;

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
    public CompletableFuture<List<Object>> callClient(String param) {
        ConfigurationItem item = new ConfigurationItem();
        item.setSection(LSP_PREFIX.label + '.' + param);
        item.setScopeUri(null);
        List<ConfigurationItem> itemList = Collections.singletonList(item);
        ConfigurationParams params = new ConfigurationParams(itemList);
        return clientProvider.get().configuration(params);
    }
}
