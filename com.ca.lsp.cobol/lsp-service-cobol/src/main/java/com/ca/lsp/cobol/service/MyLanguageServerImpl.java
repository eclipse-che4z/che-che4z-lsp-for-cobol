/*
 * Copyright (c) 2019 Broadcom.
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

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Singleton
public class MyLanguageServerImpl implements LanguageServer {
  /** Glob patterns to watch COPYBOOKS folder and copybook files */
  private static final List<String> WATCHER_PATTERNS =
      Arrays.asList("**/COPYBOOKS/*.cpy", "**/COPYBOOKS/*.CPY", "**/COPYBOOKS");

  /**
   * The kind of events of interest for watchers calculated as WatchKind.Create | WatchKind.Change |
   * WatchKind.Delete which is 7
   */
  private static final int WATCH_ALL_KIND = 7;

  private TextDocumentService textService;
  private CobolWorkspaceService workspaceService;
  private final FileSystemService fileSystemService;
  private Provider<LanguageClient> clientProvider;

  @Inject
  MyLanguageServerImpl(
      FileSystemService fileSystemService,
      TextDocumentService textService,
      CobolWorkspaceService workspaceService,
      Provider<LanguageClient> clientProvider) {
    this.textService = textService;
    this.fileSystemService = fileSystemService;
    this.workspaceService = workspaceService;
    this.clientProvider = clientProvider;
  }

  /**
   * Initialized request is sent from the client after the 'initialize' request is resolved. It is
   * used as hook to dynamically register capabilities, e.g. file system watchers.
   *
   * @param params - InitializedParams sent by a client
   */
  @Override
  public void initialized(@Nullable InitializedParams params) {
    LanguageClient client = clientProvider.get();
    Registration registration =
        new Registration("copybooksWatcher", "workspace/didChangeWatchedFiles", createWatcher());
    RegistrationParams registrationParams =
        new RegistrationParams(Collections.singletonList(registration));
    client.registerCapability(registrationParams);
  }

  @Override
  public CompletableFuture<InitializeResult> initialize(InitializeParams params) {
    ServerCapabilities capabilities = new ServerCapabilities();

    capabilities.setTextDocumentSync(TextDocumentSyncKind.Full);
    capabilities.setCompletionProvider(new CompletionOptions(true, new ArrayList<>()));
    capabilities.setSignatureHelpProvider(null);
    capabilities.setDefinitionProvider(Boolean.TRUE);
    capabilities.setHoverProvider(Boolean.FALSE);
    capabilities.setCodeActionProvider(Boolean.FALSE);
    capabilities.setReferencesProvider(Boolean.TRUE);
    capabilities.setDocumentSymbolProvider(Boolean.FALSE);
    capabilities.setCodeLensProvider(null);
    capabilities.setDocumentFormattingProvider(Boolean.TRUE);
    capabilities.setDocumentHighlightProvider(Boolean.TRUE);

    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(Boolean.TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
        new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    fileSystemService.setWorkspaceFolders(params.getWorkspaceFolders());
    return CompletableFuture.supplyAsync(() -> new InitializeResult(capabilities));
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    return CompletableFuture.supplyAsync(() -> Boolean.TRUE);
  }

  @Override
  public void exit() {
    // not supported
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return textService;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return workspaceService;
  }

  @Nonnull
  private DidChangeWatchedFilesRegistrationOptions createWatcher() {
    return new DidChangeWatchedFilesRegistrationOptions(
        WATCHER_PATTERNS.stream()
            .map(it -> new FileSystemWatcher(it, WATCH_ALL_KIND))
            .collect(Collectors.toList()));
  }
}
