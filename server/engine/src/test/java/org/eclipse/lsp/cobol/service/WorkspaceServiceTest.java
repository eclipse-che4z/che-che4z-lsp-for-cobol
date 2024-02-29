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
package org.eclipse.lsp.cobol.service;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.eclipse.lsp4j.FileChangeType.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.lsp.*;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.CodeActionQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.CodeActionHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeConfigurationHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.ExecuteCommandHandler;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.WorkspaceService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * This test checks the entry points of the {@link org.eclipse.lsp4j.services.WorkspaceService}
 * implementation.
 */
@Slf4j
@SuppressWarnings("unchecked")
class WorkspaceServiceTest {
  /** Test of the workspace/executeCommand entry point. */
  private DisposableLSPStateService stateService;
  private UriDecodeService uriDecodeService = mock(UriDecodeService.class);

  @BeforeEach
  void initialize() {
    stateService = new CobolLSPServerStateService();
  }

  @Test
  void testExecuteCommand() throws InterruptedException {
    CopybookService copybookService = mock(CopybookService.class);
    String copybookName = "COPYBOOK";
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    LspMessageBroker messageDispatcher = mock(LspMessageBroker.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            null,
            copybookNameService,
            null,
            null,
            null,
            messageService,
            asyncAnalysisService, getMockLayoutStore());
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, asyncAnalysisService);

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    WorkspaceService service = new CobolWorkspaceServiceImpl(
            lspMessageBroker,
            executeCommandHandler,
            documentGraph,
            didChangeConfigurationHandler,
            asyncAnalysisService,
            uriDecodeService);
    ((LspEventConsumer) service).startConsumer();
    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                ErrorCodes.MISSING_COPYBOOK.getLabel(),
                ImmutableList.of(
                    new JsonPrimitive(copybookName),
                    new JsonPrimitive(UseCaseUtils.DOCUMENT_URI))));
    waitingQuery(lspMessageBroker).join();
    lspMessageBroker.stop();
    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  /**
   * Test of the workspace/executeCommand entry point. Assert no changes applied if the command name
   * not recognized.
   */
  @Test
  void testExecuteNonExistingCommand() throws InterruptedException {
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            null,
            copybookNameService,
            null,
            null,
            null,
            null,
            asyncAnalysisService, getMockLayoutStore());
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, asyncAnalysisService);

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    WorkspaceService service = new CobolWorkspaceServiceImpl(
            lspMessageBroker,
            executeCommandHandler,
            documentGraph,
            didChangeConfigurationHandler,
            asyncAnalysisService, uriDecodeService);
    ((LspEventConsumer) service).startConsumer();

    CompletableFuture<Object> result =
        service.executeCommand(new ExecuteCommandParams("Missing command name", emptyList()));

    lspMessageBroker.stop();
    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private static CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery(
      LspMessageBroker lspMessageBroker) {
    CodeActionParams params = mock(CodeActionParams.class);
    CodeActionHandler codeActionHandler = mock(CodeActionHandler.class);
    when(codeActionHandler.codeAction(params)).thenReturn(emptyList());
    CodeActionQuery codeActionQuery = new CodeActionQuery(params, codeActionHandler);
    lspMessageBroker.query(codeActionQuery);
    return codeActionQuery.getResult();
  }

  /** Test configuration change method is delegated to the handler */
  @Test
  void testChangeConfigurationDelegatesRequestToHandler() throws InterruptedException {
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    DidChangeConfigurationHandler didChangeConfigurationHandler = mock(DidChangeConfigurationHandler.class);
    ExecuteCommandHandler executeCommandHandler = mock(ExecuteCommandHandler.class);
    doNothing().when(didChangeConfigurationHandler).didChangeConfiguration(any(DidChangeConfigurationParams.class));

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(
            lspMessageBroker,
            executeCommandHandler,
            documentGraph,
            didChangeConfigurationHandler,
            asyncAnalysisService, uriDecodeService);
    ((LspEventConsumer) workspaceService).startConsumer();
    DidChangeConfigurationParams didChangeConfigurationParams = new DidChangeConfigurationParams(new Object());
    workspaceService.didChangeConfiguration(didChangeConfigurationParams);
    waitingQuery(lspMessageBroker).join();
    lspMessageBroker.stop();
    verify(didChangeConfigurationHandler).didChangeConfiguration(didChangeConfigurationParams);
  }

  /**
   * This test verifies that the Workspace Service reacts on the file created watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileCreated() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Created));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileChanged() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file deleted watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileDeleted() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Deleted));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesFolderContentChanged() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks", Changed));
  }

  private void checkWatchers(FileEvent event) throws InterruptedException {
    CopybookService copybookService = mock(CopybookService.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler =
        new DidChangeConfigurationHandler(
            stateService, null, copybookNameService, null, null, null, null, asyncAnalysisService, getMockLayoutStore());

    ExecuteCommandHandler executeCommandHandler =
        new ExecuteCommandHandler(stateService, asyncAnalysisService);

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    WorkspaceService service =
        new CobolWorkspaceServiceImpl(
            lspMessageBroker,
            executeCommandHandler,
            documentGraph,
            didChangeConfigurationHandler,
            asyncAnalysisService, uriDecodeService);

    ((LspEventConsumer) service).startConsumer();
    DidChangeWatchedFilesParams params = new DidChangeWatchedFilesParams(singletonList(event));
    service.didChangeWatchedFiles(params);
    CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery =
        waitingQuery(lspMessageBroker);
    waitingQuery.join();
    lspMessageBroker.stop();
  }

  private CodeLayoutStore getMockLayoutStore() {
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
    return layoutStore;
  }
}
