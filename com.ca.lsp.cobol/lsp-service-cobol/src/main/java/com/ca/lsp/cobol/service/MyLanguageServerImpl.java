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
import java.util.List;
import java.util.concurrent.CompletableFuture;

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
  /** Glob patterns to watch the copybooks folder and copybook files */
  private static final List<String> WATCHER_PATTERNS =
      asList("**/.copybooks/**/*.cpy", "**/.copybooks/**/*.CPY", "**/.copybooks");

  /**
   * The kind of events of interest, for watchers calculated as WatchKind.Create | WatchKind.Change
   * | WatchKind.Delete which is 7
   */
  private static final int WATCH_ALL_KIND = 7;

  private TextDocumentService textService;
  private WorkspaceService workspaceService;
  private Provider<LanguageClient> clientProvider;
  private CopybookService copybookService;

  @Inject
  MyLanguageServerImpl(
      TextDocumentService textService,
      WorkspaceService workspaceService,
      Provider<LanguageClient> clientProvider,
      CopybookService copybookService) {
    this.textService = textService;
    this.workspaceService = workspaceService;
    this.clientProvider = clientProvider;
    this.copybookService = copybookService;
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
