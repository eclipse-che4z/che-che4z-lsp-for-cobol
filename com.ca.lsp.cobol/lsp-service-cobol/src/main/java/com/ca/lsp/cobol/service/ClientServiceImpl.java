package com.ca.lsp.cobol.service;

import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.List;
import java.util.Optional;
import java.util.StringJoiner;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.LSP_PREFIX;
import static java.lang.Thread.currentThread;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static java.util.Optional.empty;
import static java.util.Optional.of;
import static java.util.stream.Collectors.toList;

@Slf4j
@Singleton
public class ClientServiceImpl implements ClientService {
  private Provider<LanguageClient> clientProvider;

  @Inject
  ClientServiceImpl(Provider<LanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @Override
  public CompletableFuture<List<String>> callClient(String... param) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(buildRequestParam(param));
    item.setScopeUri(null);

    return clientProvider
        .get()
        .configuration(new ConfigurationParams(singletonList(item)))
        .thenApply(this::toStrings);
  }

  @Override
  public Optional<List<String>> callClientSync(String... section) {
    try {
      return of(callClient(section).get());
    } catch (ExecutionException | InterruptedException e) {
      log.error("Error resolving copybook", e);
      currentThread().interrupt();
      return empty();
    }
  }

  private String buildRequestParam(String[] param) {
    StringJoiner joiner = new StringJoiner(".");
    joiner.add(LSP_PREFIX.label);
    asList(param).forEach(joiner::add);
    return joiner.toString();
  }

  private List<String> toStrings(List<Object> it) {
    return it.stream()
        .map(this::toArray)
        .flatMap(Streams::stream)
        .map(JsonElement::getAsString)
        .collect(toList());
  }

  private JsonArray toArray(Object obj) {
    if (obj instanceof JsonPrimitive) {
      JsonArray jsonElements = new JsonArray();
      jsonElements.add((JsonPrimitive) obj);
      return jsonElements;
    }
    return (JsonArray) obj;
  }
}
