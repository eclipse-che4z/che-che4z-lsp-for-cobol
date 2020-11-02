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
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.core.messages.LocaleStore;
import com.broadcom.lsp.cobol.core.messages.LogLevelUtils;
import com.broadcom.lsp.cobol.core.model.ErrorCode;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.concurrent.CompletableFuture;

import static com.broadcom.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static java.lang.Boolean.TRUE;
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
public class CobolLanguageServer implements LanguageServer {

  private TextDocumentService textService;
  private WorkspaceService workspaceService;
  private WatcherService watchingService;
  private SettingsService settingsService;
  private LocaleStore localeStore;

  @Inject
  CobolLanguageServer(
      TextDocumentService textService,
      WorkspaceService workspaceService,
      WatcherService watchingService,
      SettingsService settingsService,
      LocaleStore localeStore) {
    this.textService = textService;
    this.workspaceService = workspaceService;
    this.watchingService = watchingService;
    this.settingsService = settingsService;
    this.localeStore = localeStore;
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return textService;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return workspaceService;
  }

  @Override
  @NonNull
  public CompletableFuture<InitializeResult> initialize(@NonNull InitializeParams params) {
    ServerCapabilities capabilities = new ServerCapabilities();

    capabilities.setTextDocumentSync(Full);
    capabilities.setCompletionProvider(new CompletionOptions(true, emptyList()));
    capabilities.setDefinitionProvider(TRUE);
    capabilities.setReferencesProvider(TRUE);
    capabilities.setDocumentFormattingProvider(TRUE);
    capabilities.setDocumentHighlightProvider(TRUE);
    capabilities.setCodeActionProvider(TRUE);
    capabilities.setExecuteCommandProvider(collectExecuteCommandList());
    capabilities.setDocumentSymbolProvider(TRUE);

    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
        new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    return supplyAsync(() -> new InitializeResult(capabilities));
  }

  /**
   * Initialized request sent from the client after the 'initialize' request resolved. It is used as
   * hook to dynamically register capabilities, e.g. file system watchers.
   *
   * @param params - InitializedParams sent by a client
   */
  @Override
  public void initialized(@Nullable InitializedParams params) {
    watchingService.watchConfigurationChange();
    watchingService.watchPredefinedFolder();
    addLocalFilesWatcher();
    getLocaleFromClient();
    getLogLevelFromClient();
  }

  private void getLogLevelFromClient() {
    settingsService
        .getConfiguration(LOGGING_LEVEL.label)
        .thenAccept(LogLevelUtils.updateLogLevel());
  }

  private void getLocaleFromClient() {
    settingsService.getConfiguration(LOCALE.label).thenAccept(localeStore.notifyLocaleStore());
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    return supplyAsync(() -> TRUE);
  }

  @Override
  public void exit() {
    // not supported
  }

  private void addLocalFilesWatcher() {
    settingsService
        .getConfiguration(LOCAL_PATHS.label)
        .thenAccept(it -> watchingService.addWatchers(settingsService.toStrings(it)));
  }

  @NonNull
  private ExecuteCommandOptions collectExecuteCommandList() {
    return new ExecuteCommandOptions(
        stream(ErrorCode.values()).map(ErrorCode::name).collect(toList()));
  }
}
