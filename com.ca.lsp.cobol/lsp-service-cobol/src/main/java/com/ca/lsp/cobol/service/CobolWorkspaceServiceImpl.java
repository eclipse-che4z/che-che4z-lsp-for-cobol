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
import com.broadcom.lsp.domain.cobol.databus.model.RegistryId;
import com.broadcom.lsp.domain.cobol.event.model.*;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Stream;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService {
  private final DefaultDataBusBroker dataBus;
  private Provider<LanguageClient> clientProvider;

  @Inject
  public CobolWorkspaceServiceImpl(
      DefaultDataBusBroker dataBus, Provider<LanguageClient> clientProvider) {
    this.dataBus = dataBus;
    this.clientProvider = clientProvider;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  /**
   * This is a notification triggered automatically when the user modify configuration settings in
   * the client
   *
   * @param params - LSPSpecification -> The actual changed settings; Actually -> null all the time.
   */
  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    /** section and scope has to be set to whatever we agree on for the dependencies graph */
    try {
      fetchSettings(null, null)
          .thenAccept(
              e -> {
                dataBus.postData(FetchedSettingsEvent.builder().content(e).build());
              });
    } catch (Exception e) {
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
    List<ConfigurationItem> itemList = new ArrayList<>();
    elemToList(itemList, section, scope);
    params.setItems(itemList);

    return client.configuration(params);
  }

  @Nonnull
  private List<ConfigurationItem> elemToList(
      List<ConfigurationItem> list, String section, String scope) {
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

  // TODO: Should be removed due to a change of responsability for this class..
  @Override
  public String getContentByCopybookName(String copybookName) throws IOException {
    return null;
  }

  // TODO: Should be removed due to a change of responsability for this class..
  @Override
  public void observerCallback(RequiredCopybookEvent adaptedDataEvent) {}
}
