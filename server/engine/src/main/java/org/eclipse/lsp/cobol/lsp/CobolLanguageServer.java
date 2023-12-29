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
package org.eclipse.lsp.cobol.lsp;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.concurrent.CompletableFuture;
import javax.annotation.Nullable;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.events.notifications.InitializedNotification;
import org.eclipse.lsp.cobol.lsp.events.queries.InitializeQuery;
import org.eclipse.lsp.cobol.lsp.events.queries.ShutdownQuery;
import org.eclipse.lsp.cobol.lsp.handlers.server.ExitHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializeHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializedHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.ShutdownHandler;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

/**
 * This class sets up the initial state of the services and applies other initialization activities,
 * such as set server capabilities and register file system watchers.
 */
@Slf4j
@Singleton
public class CobolLanguageServer implements LanguageServer {

  private final LspMessageBroker lspMessageBroker;
  private final LspEventConsumer lspEventConsumer;
  private final TextDocumentService textService;
  private final WorkspaceService workspaceService;
  private final ExitHandler exitHandler;
  private final ShutdownHandler shutdownHandler;
  private final InitializeHandler initializeHandler;
  private final InitializedHandler initializedHandler;

  @Inject
  @SuppressWarnings("squid:S107")
  public CobolLanguageServer(
          LspMessageBroker lspMessageBroker,
          TextDocumentService textService,
          WorkspaceService workspaceService,
          ExitHandler exitHandler,
          ShutdownHandler shutdownHandler,
          InitializeHandler initializeHandler,
          InitializedHandler initializedHandler,
          LspEventConsumer lspEventConsumer) {
    this.lspMessageBroker = lspMessageBroker;
    this.textService = textService;
    this.workspaceService = workspaceService;
    this.exitHandler = exitHandler;
    this.shutdownHandler = shutdownHandler;
    this.initializeHandler = initializeHandler;
    this.initializedHandler = initializedHandler;
    this.lspEventConsumer = lspEventConsumer;
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
  public void setTrace(SetTraceParams params) {
    // TODO: implement me
  }

  @Override
  @NonNull
  public CompletableFuture<InitializeResult> initialize(@NonNull InitializeParams params) {
    lspEventConsumer.startConsumer();
    return lspMessageBroker.query(new InitializeQuery(params, initializeHandler));
  }

  /**
   * Initialized request sent from the client after the 'initialize' request resolved. It is used as
   * hook to dynamically register capabilities, e.g. file system watchers.
   *
   * @param params - InitializedParams sent by a client
   */
  @Override
  public void initialized(@Nullable InitializedParams params) {
    lspMessageBroker.notify(new InitializedNotification(params, initializedHandler));
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    return lspMessageBroker.query(new ShutdownQuery(shutdownHandler));
  }

  @Override
  public void exit() {
    // Kill the server (loop should be already stopped at this time)
    exitHandler.exit();
  }
}
