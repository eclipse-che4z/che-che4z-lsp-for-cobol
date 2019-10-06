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
  private final TextDocumentService textService;
  private final CobolWorkspaceServiceImpl workspaceService;
  private String copybookURIList;

  public MyLanguageServerImpl() {

    textService = new MyTextDocumentService(this);
    workspaceService = CobolWorkspaceServiceImpl.getInstance();
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

    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(Boolean.TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
        new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    // from a given URI the scan search for a folder that contains copybooks and return it as list
    // todo: this full-scan routine will be removed in favor of an on demand scan
    workspaceService.scanWorkspaceForCopybooks(params.getWorkspaceFolders());

    // snippet of code to show current progress on copybook scan - will be removed from next version
    StringBuilder copybooksFolderList = new StringBuilder();
    workspaceService
        .getCopybookList()
        .forEach(
            file ->
                copybooksFolderList
                    .append(file.toPath().toString())
                    .append(System.getProperty("line.separator")));
    setCopybookURIList(copybooksFolderList.toString());

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

  @Override
  public void setPipeRemoteProxy(LanguageClient languageClient) {
    client = languageClient;
  }

  @Override
  public Runnable setSocketRemoteProxy(LanguageClient languageClient) {
    return () -> client = languageClient;
  }

  @Override
  public LanguageClient getClient() {
    return client;
  }

  @Override
  public String getCopybookURIList() {
    return copybookURIList;
  }

  private void setCopybookURIList(String copybookURIList) {
    this.copybookURIList = copybookURIList;
  }
}
