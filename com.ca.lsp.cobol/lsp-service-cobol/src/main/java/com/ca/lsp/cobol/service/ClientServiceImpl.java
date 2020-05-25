package com.ca.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.List;
import java.util.StringJoiner;
import java.util.concurrent.CompletableFuture;

import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.LSP_PREFIX;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;

@Slf4j
@Singleton
public class ClientServiceImpl implements ClientService {
  private Provider<LanguageClient> clientProvider;

  @Inject
  ClientServiceImpl(Provider<LanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @Override
  public CompletableFuture<List<Object>> callClient(String... param) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(buildRequestParam(param));
    item.setScopeUri(null);

    return clientProvider.get().configuration(new ConfigurationParams(singletonList(item)));
  }

  private String buildRequestParam(String[] param) {
    StringJoiner joiner = new StringJoiner(".");
    joiner.add(LSP_PREFIX.label);
    asList(param).forEach(joiner::add);
    return joiner.toString();
  }
}
