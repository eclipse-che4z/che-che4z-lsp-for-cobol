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

import com.ca.lsp.core.cobol.model.ErrorCode;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static com.ca.lsp.cobol.service.utils.SettingsParametersEnum.LOCAL_PATHS;
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
public class MyLanguageServerImpl implements LanguageServer {

  private TextDocumentService textService;
  private WorkspaceService workspaceService;
  private WatcherService watchingService;
  private SettingsService settingsService;

  @Inject
  MyLanguageServerImpl(
      TextDocumentService textService,
      WorkspaceService workspaceService,
      WatcherService watchingService,
      SettingsService settingsService) {
    this.textService = textService;
    this.workspaceService = workspaceService;
    this.watchingService = watchingService;
    this.settingsService = settingsService;
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
    watchingService.watchConfigurationChange();
    watchingService.watchPredefinedFolder();
    addLocalFilesWatcher();
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

    return supplyAsync(() -> new InitializeResult(capabilities));
  }

  private void addLocalFilesWatcher() {
    settingsService
        .getConfiguration(LOCAL_PATHS.label)
        .thenAccept(it -> watchingService.addWatchers(toStrings(it)));
  }

  private List<String> toStrings(List<Object> it) {
    return it.stream()
        .map(obj -> (JsonArray) obj)
        .flatMap(Streams::stream)
        .map(JsonElement::getAsString)
        .collect(toList());
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
  private ExecuteCommandOptions collectExecuteCommandList() {
    return new ExecuteCommandOptions(
        stream(ErrorCode.values()).map(ErrorCode::name).collect(toList()));
  }
}
