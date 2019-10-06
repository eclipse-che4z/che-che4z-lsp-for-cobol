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
package com.ca.lsp.cobol.service.mocks;

import com.ca.lsp.cobol.service.IMyLanguageServer;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializeResult;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.util.concurrent.CompletableFuture;

/**
 * Mock implementation of language server. Only for testing purposes.
 *
 * @author teman02
 */
public class TestLanguageServer implements IMyLanguageServer {
  private LanguageClient client = null;

  public TestLanguageServer() {}

  public TestLanguageServer(LanguageClient client) {
    this.client = client;
  }

  @Override
  public CompletableFuture<InitializeResult> initialize(InitializeParams params) {
    return null;
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    return null;
  }

  @Override
  public void exit() {
    throw new UnsupportedOperationException("Method not implemented.");
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return null;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return null;
  }

  @Override
  public LanguageClient getClient() {
    return client;
  }

  @Override
  public Runnable setSocketRemoteProxy(LanguageClient client) {
    return () -> this.client = client;
  }

  @Override
  public void setPipeRemoteProxy(LanguageClient client) {
    this.client = client;
  }

  @Override
  public String getCopybookURIList() {
    return null;
  }
}
