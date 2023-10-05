/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp4j.*;

import java.util.Optional;

import static java.lang.Boolean.TRUE;
import static java.util.Collections.emptyList;
import static org.eclipse.lsp4j.TextDocumentSyncKind.Full;

/**
 * LSP Initialize Handler
 */
public class InitializeHandler {
  private final WatcherService watchingService;

  @Inject
  public InitializeHandler(WatcherService watchingService) {
    this.watchingService = watchingService;
  }

  /**
   * Handle LSP initialize request.
   *
   * @param params InitializeParams.
   * @return Initialize result.
   */
  public InitializeResult initialize(@NonNull InitializeParams params) {
    Optional.ofNullable(params.getWorkspaceFolders())
            .ifPresent(workspace -> watchingService.getWorkspaceFolders().addAll(workspace));

    ServerCapabilities capabilities = new ServerCapabilities();

    capabilities.setTextDocumentSync(Full);
    capabilities.setCompletionProvider(new CompletionOptions(false, emptyList()));
    capabilities.setDefinitionProvider(TRUE);
    capabilities.setReferencesProvider(TRUE);
    capabilities.setDocumentFormattingProvider(TRUE);
    capabilities.setDocumentHighlightProvider(TRUE);
    capabilities.setCodeActionProvider(TRUE);
    capabilities.setExecuteCommandProvider(collectExecuteCommandList());
    DocumentSymbolOptions documentSymbolOptions = new DocumentSymbolOptions();
    documentSymbolOptions.setWorkDoneProgress(TRUE);
    capabilities.setDocumentSymbolProvider(documentSymbolOptions);
    capabilities.setHoverProvider(TRUE);
    capabilities.setFoldingRangeProvider(TRUE);
    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
            new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    return new InitializeResult(capabilities);
  }

  @NonNull
  private ExecuteCommandOptions collectExecuteCommandList() {
    return new ExecuteCommandOptions(ImmutableList.of(ErrorCodes.MISSING_COPYBOOK.getLabel()));
  }

}
