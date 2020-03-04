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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.providers.SettingsProvider;
import com.ca.lsp.core.cobol.model.ErrorCode;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.CPY_MANAGER;
import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.LSP_PREFIX;
import static java.lang.Boolean.TRUE;
import static java.util.Arrays.asList;
import static java.util.Arrays.stream;
import static java.util.Collections.emptyList;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp4j.TextDocumentSyncKind.Full;

/**
 * This class sets up the initial state of the services and applies other initialization activities,
 * such as set server capabilities and register file system watchers.
 */
@Slf4j
@Singleton
public class MyLanguageServerImpl implements LanguageServer {
  /** Glob patterns to watch COPYBOOKS folder and copybook files */
  private static final List<String> WATCHER_PATTERNS =
      asList("**/COPYBOOKS/*.cpy", "**/COPYBOOKS/*.CPY", "**/COPYBOOKS");

  /**
   * The kind of events of interest, for watchers calculated as WatchKind.Create | WatchKind.Change
   * | WatchKind.Delete which is 7
   */
  private static final int WATCH_ALL_KIND = 7;

  private TextDocumentService textService;
  private CobolWorkspaceService workspaceService;
  private CopybookService copybookService;
  private Provider<LanguageClient> clientProvider;

  private Provider<SettingsProvider> settingsProvider;

  @Inject
  MyLanguageServerImpl(
      CopybookService copybookService,
      TextDocumentService textService,
      CobolWorkspaceService workspaceService,
      Provider<LanguageClient> clientProvider,
      // TODO: Remove the provider and inject the settings directly
      Provider<SettingsProvider> settingsProvider) {
    this.textService = textService;
    this.copybookService = copybookService;
    this.workspaceService = workspaceService;
    this.clientProvider = clientProvider;
    this.settingsProvider = settingsProvider;
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return textService;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return workspaceService;
  }

  /**
   * Initialized request sent from the client after the 'initialize' request resolved. It is used as
   * hook to dynamically register capabilities, e.g. file system watchers.
   *
   * @param params - InitializedParams sent by a client
   */
  @Override
  public void initialized(@Nullable InitializedParams params) {
    LanguageClient client = clientProvider.get();

    RegistrationParams registrationParams =
        new RegistrationParams(
            asList(
                new Registration(
                    "copybooksWatcher", "workspace/didChangeWatchedFiles", createWatcher()),
                new Registration("configurationChange", "workspace/didChangeConfiguration", null)));
    client.registerCapability(registrationParams);
    try {
      retrieveAndStoreConfiguration();
    } catch (RuntimeException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * Retrieve configuration settings by using fetchSettings() method, validate the JSON and later
   * store it in the SettingProvider for further use
   */
  void retrieveAndStoreConfiguration() {
    fetchSettings(LSP_PREFIX.label + "." + CPY_MANAGER.label, null)
        .thenAccept(e -> getSettingsFromProvider().set(parseJsonIfValid((JsonObject) e.get(0))));
  }

  private SettingsProvider getSettingsFromProvider() {
    return settingsProvider.get();
  }

  /**
   * @param jsonObject - the object which comes from the client and contains configuration settings
   * @return a custom object of type ConfigurableSettingsStorable if the JSON is valid or an empty
   *     ConfigurableSettingsStorable if it is failing the parsing
   */
  private ConfigurationSettingsStorable parseJsonIfValid(JsonObject jsonObject) {
    Gson gson = new Gson();
    try {
      return gson.fromJson(jsonObject, ConfigurationSettingsStorable.class);
    } catch (JsonSyntaxException e) {
      log.error(e.getMessage());
      return ConfigurationSettingsStorable.builder().build();
    }
  }

  private CompletableFuture<List<Object>> fetchSettings(String section, String scope) {
    ConfigurationParams params =
        new ConfigurationParams(provideConfigurationItemList(section, scope));
    return clientProvider.get().configuration(params);
  }

  @Nonnull
  private List<ConfigurationItem> provideConfigurationItemList(String section, String scope) {
    ConfigurationItem item = new ConfigurationItem();
    item.setSection(section);
    item.setScopeUri(scope);
    return Collections.singletonList(item);
  }

  @Override
  @Nonnull
  public CompletableFuture<InitializeResult> initialize(@Nonnull InitializeParams params) {
    ServerCapabilities capabilities = new ServerCapabilities();

    capabilities.setTextDocumentSync(Full);
    capabilities.setCompletionProvider(new CompletionOptions(true, emptyList()));
    capabilities.setDefinitionProvider(TRUE);
    capabilities.setReferencesProvider(TRUE);
    capabilities.setDocumentFormattingProvider(TRUE);
    capabilities.setDocumentHighlightProvider(TRUE);
    capabilities.setCodeActionProvider(TRUE);
    capabilities.setExecuteCommandProvider(collectExecuteCommandList());

    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
        new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    copybookService.setWorkspaceFolders(params.getWorkspaceFolders());
    return supplyAsync(() -> new InitializeResult(capabilities));
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    return supplyAsync(() -> TRUE);
  }

  @Override
  public void exit() {
    // not supported
  }

  @Nonnull
  private DidChangeWatchedFilesRegistrationOptions createWatcher() {
    return new DidChangeWatchedFilesRegistrationOptions(
        WATCHER_PATTERNS.stream()
            .map(it -> new FileSystemWatcher(it, WATCH_ALL_KIND))
            .collect(toList()));
  }

  @Nonnull
  private ExecuteCommandOptions collectExecuteCommandList() {
    return new ExecuteCommandOptions(
        stream(ErrorCode.values()).map(ErrorCode::name).collect(toList()));
  }
}
