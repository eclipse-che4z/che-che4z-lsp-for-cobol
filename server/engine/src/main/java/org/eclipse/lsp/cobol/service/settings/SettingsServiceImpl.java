/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.settings;

import com.google.common.base.Joiner;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.LSP_PREFIX;

/** This service fetch configuration settings from the client. */
@Slf4j
@Singleton
public class SettingsServiceImpl implements SettingsService {
  private final Provider<CobolLanguageClient> clientProvider;

  @Inject
  SettingsServiceImpl(Provider<CobolLanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @NonNull
  @Override
  public CompletableFuture<List<Object>> fetchConfiguration(@NonNull String... param) {
    return fetchConfigurations(singletonList(Joiner.on(".").join(param)));
  }

  @Override
  public CompletableFuture<List<String>> fetchTextConfiguration(@NonNull String... section) {
    return fetchConfiguration(section).thenApply(objects -> objects.stream()
            .filter(JsonArray.class::isInstance)
            .map(JsonArray.class::cast)
            .flatMap(Streams::stream)
            .filter(ele -> !(ele instanceof JsonNull))
            .map(JsonElement::getAsString)
            .collect(toList()));
  }

  @Override
  public CompletableFuture<List<String>> fetchTextConfigurationWithScope(String scopeUri, String section) {
    return fetchConfigurations(scopeUri, singletonList(section)).thenApply(objects -> objects.stream()
            .filter(JsonArray.class::isInstance)
            .map(JsonArray.class::cast)
            .flatMap(Streams::stream)
            .filter(ele -> !(ele instanceof JsonNull))
            .map(JsonElement::getAsString)
            .collect(toList()));
  }

  @Override
  public CompletableFuture<List<String>> fetchTextConfigurationWithScope(String scopeUri, String section, String dialect) {
    CobolConfigItem item = new CobolConfigItem();
    item.setSection(section);
    item.setDialect(dialect);
    item.setScopeUri(scopeUri);
    return clientProvider.get().configuration(new ConfigurationParams(singletonList(item)))
            .thenApply(objects -> objects.stream()
                    .filter(JsonArray.class::isInstance)
                    .map(JsonArray.class::cast)
                    .flatMap(Streams::stream)
                    .filter(ele -> !(ele instanceof JsonNull))
                    .map(JsonElement::getAsString)
                    .collect(toList()));
  }

  @NonNull
  @Override
  public CompletableFuture<List<Object>> fetchConfigurations(@NonNull List<String> sections) {
    return fetchConfigurations(null, sections);
  }

  @NonNull
  @Override
  public CompletableFuture<List<Object>> fetchConfigurations(String documentUri, List<String> sections) {
    List<ConfigurationItem> configurationItems = sections.stream()
            .map(section -> LSP_PREFIX.label + "." + section)
            .map(SettingsServiceImpl::buildConfigurationItem)
            .collect(toList());

    if (documentUri != null) {
      configurationItems.forEach(ci -> ci.setScopeUri(documentUri));
    }

    return clientProvider.get().configuration(new ConfigurationParams(configurationItems));
  }

  @NonNull
  private static ConfigurationItem buildConfigurationItem(@NonNull String section) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(section);
    return item;
  }
}
