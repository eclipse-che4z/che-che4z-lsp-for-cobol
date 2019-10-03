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

import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.util.ArrayList;
import java.util.concurrent.CompletableFuture;

public class MyLanguageServerImpl implements IMyLanguageServer {

  private LanguageClient client;
  private TextDocumentService textService;
  private WorkspaceService workspaceService;

  public MyLanguageServerImpl() {
    textService = new MyTextDocumentService(this);
    workspaceService = new MyWorkspaceService();
  }

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

    return CompletableFuture.supplyAsync(() -> new InitializeResult(capabilities));
  }

  public CompletableFuture<Object> shutdown() {
    return CompletableFuture.supplyAsync(() -> Boolean.TRUE);
  }

  @Override
  public void exit() {
    // not supported
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return this.textService;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return this.workspaceService;
  }

  @Override
  public void setPipeRemoteProxy(LanguageClient languageClient) {
    this.client = languageClient;
  }

  @Override
  public Runnable setSocketRemoteProxy(LanguageClient languageClient) {
    return () -> this.client = languageClient;
  }

  @Override
  public LanguageClient getClient() {
    return client;
  }
}
