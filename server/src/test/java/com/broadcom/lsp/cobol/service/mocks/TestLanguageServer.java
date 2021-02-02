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
package com.broadcom.lsp.cobol.service.mocks;

import com.broadcom.lsp.cobol.service.DisposableLanguageServer;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializeResult;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.util.concurrent.CompletableFuture;

/** Mock implementation of language server. Only for testing purposes. */
@Singleton
public class TestLanguageServer implements LanguageServer, DisposableLanguageServer {
  private int exitCode = 1;

  @Inject
  public TestLanguageServer() {}

  @Override
  public CompletableFuture<InitializeResult> initialize(InitializeParams params) {
    return null;
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    exitCode = 0;
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
  public int getExitCode() {
    return exitCode;
  }

  /**
   * Revoke shutdown for testing purpose.
   */
  public void revokeShutdown() {
    exitCode = 1;
  }
}
