/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
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

/**
 * This service fetch configuration settings from the client.
 */
@Slf4j
@Singleton
public class SettingsServiceImpl implements SettingsService {
  private Provider<LanguageClient> clientProvider;

  @Inject
  SettingsServiceImpl(Provider<LanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @Override
  public CompletableFuture<List<Object>> getConfiguration(String... param) {
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
