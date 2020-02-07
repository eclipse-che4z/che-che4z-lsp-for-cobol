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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.WorkspaceService;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements WorkspaceService {
  private final DefaultDataBusBroker dataBus;
  private Provider<LanguageClient> clientProvider;

  @Inject
  public CobolWorkspaceServiceImpl(
      DefaultDataBusBroker dataBus, Provider<LanguageClient> clientProvider) {
    this.dataBus = dataBus;
    this.clientProvider = clientProvider;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT);
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    /* section and scope has to be set to whatever we agree on for the dependencies graph */
    try {
      fetchSettings(null, null)
          .thenAccept(e -> dataBus.postData(FetchedSettingsEvent.builder().content(e).build()));
    } catch (RuntimeException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * After client notifies the server that there is a setting change we need to request the client
   * those changing by sending a workspace/configuration JSON request
   *
   * @param section - The configuration section asked for.
   * @param scope - The scope to get the configuration section for.
   * @return - CompletedFuture which contains an object with the settings asked for.
   */
  private CompletableFuture<List<Object>> fetchSettings(String section, String scope) {
    LanguageClient client = clientProvider.get();
    ConfigurationParams params = new ConfigurationParams();
    params.setItems(elemToList(section, scope));
    return client.configuration(params);
  }

  @Nonnull
  private List<ConfigurationItem> elemToList(String section, String scope) {
    List<ConfigurationItem> list = new ArrayList<>();
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(section);
    item.setScopeUri(scope);
    list.add(item);
    return list;
  }

  @Override
  public void didChangeWatchedFiles(@Nonnull DidChangeWatchedFilesParams params) {
    dataBus.invalidateCache();
    log.info("Cache invalidated due to a copybooks file watcher was triggered");
    dataBus.postData(new RunAnalysisEvent());
  }
}
