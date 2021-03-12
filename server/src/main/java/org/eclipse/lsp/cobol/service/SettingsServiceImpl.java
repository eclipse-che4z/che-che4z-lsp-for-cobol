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
package org.eclipse.lsp.cobol.service;

import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import com.google.common.base.Joiner;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.LSP_PREFIX;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

/** This service fetch configuration settings from the client. */
@Slf4j
@Singleton
public class SettingsServiceImpl implements SettingsService {
  private Provider<CobolLanguageClient> clientProvider;

  @Inject
  SettingsServiceImpl(Provider<CobolLanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @NonNull
  @Override
  public CompletableFuture<List<Object>> getConfiguration(@NonNull String... param) {
    return getConfigurations(singletonList(Joiner.on(".").join(param)));
  }

  @NonNull
  @Override
  public CompletableFuture<List<Object>> getConfigurations(@NonNull List<String> sections) {
    return clientProvider
        .get()
        .configuration(
            new ConfigurationParams(
                sections.stream()
                    .map(section -> LSP_PREFIX.label + "." + section)
                    .map(SettingsServiceImpl::buildConfigurationItem)
                    .collect(toList())));
  }

  @NonNull
  @Override
  public List<String> toStrings(@NonNull List<Object> objects) {
    return objects.stream()
        .map(obj -> (JsonArray) obj)
        .flatMap(Streams::stream)
        .map(JsonElement::getAsString)
        .collect(toList());
  }

  @NonNull
  private static ConfigurationItem buildConfigurationItem(@NonNull String section) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(section);
    item.setScopeUri(null);
    return item;
  }
}
