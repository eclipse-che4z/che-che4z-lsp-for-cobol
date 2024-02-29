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
import static java.util.concurrent.CompletableFuture.completedFuture;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;
import static org.eclipse.lsp4j.DiagnosticTag.Unnecessary;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.lsp.*;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.CodeActionQuery;
import org.eclipse.lsp.cobol.lsp.handlers.server.ExitHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializeHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializedHandler;
import org.eclipse.lsp.cobol.lsp.handlers.server.ShutdownHandler;
import org.eclipse.lsp.cobol.lsp.handlers.text.CodeActionHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeConfigurationHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.ExecuteCommandHandler;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.ClientCapabilities;
import org.eclipse.lsp4j.ClientInfo;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.CompletionCapabilities;
import org.eclipse.lsp4j.CompletionItemCapabilities;
import org.eclipse.lsp4j.CompletionItemTag;
import org.eclipse.lsp4j.CompletionItemTagSupportCapabilities;
import org.eclipse.lsp4j.DiagnosticTag;
import org.eclipse.lsp4j.DiagnosticsTagSupport;
import org.eclipse.lsp4j.GeneralClientCapabilities;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializeResult;
import org.eclipse.lsp4j.InitializedParams;
import org.eclipse.lsp4j.PublishDiagnosticsCapabilities;
import org.eclipse.lsp4j.ServerCapabilities;
import org.eclipse.lsp4j.TextDocumentClientCapabilities;
import org.eclipse.lsp4j.TextDocumentSyncKind;
import org.eclipse.lsp4j.WorkspaceClientCapabilities;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * This test asserts functions of the {@link CobolLanguageServer}, such as initialization.
 */
class CobolLanguageServerTest {

  private DisposableLSPStateService stateService;
  private final UriDecodeService uriDecodeService = mock(UriDecodeService.class);

  @BeforeEach
  void getStateService() {
    stateService = new CobolLSPServerStateService();
  }

  /**
   * Test the {@link CobolLanguageServer#initialized(InitializedParams)} method. Check that the file
   * system watchers registered correctly.
   */
  @Test
  void initialized() throws InterruptedException {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
//    WatcherService watchingService = mock(WatcherService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    MessageService messageService = mock(MessageService.class);
    Keywords keywords = mock(Keywords.class);
    ExecuteCommandHandler executeCommandHandler = mock(ExecuteCommandHandler.class);
    SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
    DidChangeConfigurationHandler didChangeConfigurationHandler = mock(DidChangeConfigurationHandler.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getWatchingFolderSettings()).thenReturn(ImmutableList.of("dialect"));

    when(settingsService.fetchTextConfiguration(anyString())).thenCallRealMethod();
    prepareSettingsService(settingsService, localeStore);

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    CobolWorkspaceServiceImpl lspEventConsumer = new CobolWorkspaceServiceImpl(lspMessageBroker, executeCommandHandler, sourceUnitGraph, didChangeConfigurationHandler, asyncAnalysisService, uriDecodeService);

    lspEventConsumer.startConsumer();
    InitializedHandler initializedHandler = mock(InitializedHandler.class);
    doNothing().when(initializedHandler).initialized(any(InitializedParams.class));
    CobolLanguageServer server =
            new CobolLanguageServer(
                    lspMessageBroker,
                    null,
                    null,
                    new ExitHandler(stateService),
                    new ShutdownHandler(stateService, lspMessageBroker),
                    mock(InitializeHandler.class),
                    initializedHandler,
                    lspEventConsumer);


    server.initialized(new InitializedParams());
    waitingQuery(lspMessageBroker).join();
    lspMessageBroker.stop();
    verify(initializedHandler).initialized(any(InitializedParams.class));
  }

  private static CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery(LspMessageBroker lspMessageBroker) {
    CodeActionParams params = mock(CodeActionParams.class);
    CodeActionHandler codeActionHandler = mock(CodeActionHandler.class);
    when(codeActionHandler.codeAction(params)).thenReturn(emptyList());
    CodeActionQuery codeActionQuery = new CodeActionQuery(params, codeActionHandler);
    lspMessageBroker.query(codeActionQuery);
    return codeActionQuery.getResult();
  }

  private void prepareSettingsService(SettingsService settingsService, LocaleStore localeStore) {
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.fetchConfiguration(CPY_LOCAL_PATHS.label))
            .thenReturn(completedFuture(singletonList(arr)));
    when(localeStore.notifyLocaleStore()).thenReturn(System.out::println);
    when(settingsService.fetchConfiguration(LOCALE.label))
            .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(SUBROUTINE_LOCAL_PATHS.label))
            .thenReturn(completedFuture(ImmutableList.of()));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
            .thenReturn(completedFuture(ImmutableList.of("INFO")));
    when(settingsService.fetchConfiguration(CPY_EXTENSIONS.label))
            .thenReturn(completedFuture(ImmutableList.of("cpy")));
    when(settingsService.fetchConfiguration("dialect"))
            .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
        .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));
  }

  @Test
  void initializedConfig() throws InterruptedException {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    CobolTextDocumentService textService = mock(CobolTextDocumentService.class);
    AnalysisService analysisService = mock(AnalysisService.class);
    MessageService messageService = mock(MessageService.class);
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    ExecuteCommandHandler executeCommandHandler = mock(ExecuteCommandHandler.class);
    SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
    DidChangeConfigurationHandler didChangeConfigurationHandler = mock(DidChangeConfigurationHandler.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getSettingsSections()).thenReturn(ImmutableList.of("daco"));

    when(settingsService.fetchTextConfiguration(anyString())).thenReturn(CompletableFuture.supplyAsync(ImmutableList::of));
    prepareSettingsService(settingsService, localeStore);

    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    CobolWorkspaceServiceImpl lspEventConsumer = new CobolWorkspaceServiceImpl(lspMessageBroker, executeCommandHandler, sourceUnitGraph, didChangeConfigurationHandler, asyncAnalysisService, uriDecodeService);

    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
    when(layoutStore.updateCodeLayout()).thenReturn(mock -> {});

    lspEventConsumer.startConsumer();
    CobolLanguageServer server =
            new CobolLanguageServer(
                    lspMessageBroker,
                    textService,
                    null,
                    new ExitHandler(stateService),
                    new ShutdownHandler(stateService, lspMessageBroker),
                    new InitializeHandler(watchingService),
                    new InitializedHandler(watchingService, copybookNameService, keywords, settingsService, localeStore, analysisService, messageService, layoutStore),
                    lspEventConsumer);

    server.initialized(new InitializedParams());
    waitingQuery(lspMessageBroker).join();
    lspMessageBroker.stop();
    verify(analysisService, timeout(TimeUnit.SECONDS.toMillis(5))
            .times(1)).setExtensionConfig(any());
  }

  /**
   * Test the {@link CobolLanguageServer#initialize(InitializeParams)} method. It should initialize
   * the services and create a list of supported server capabilities. This test also asserts that
   * there are only supported capabilities add to the {@link InitializeResult} instance.
   */
  @Test
  void initialize() {
    testServerInitialization(getInitializeParams());
  }

  @Test
  @Disabled("Fails the build intermittently. Disabled until reason identified")
  void initializeWithoutWorkspace() {
    InitializeParams initializeParams = getInitializeParams();
    initializeParams.setWorkspaceFolders(null);
    testServerInitialization(initializeParams);
  }


  private void testServerInitialization(InitializeParams initializeParams) {
    ExecuteCommandHandler executeCommandHandler = mock(ExecuteCommandHandler.class);
    SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
    DidChangeConfigurationHandler didChangeConfigurationHandler = mock(DidChangeConfigurationHandler.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    CobolWorkspaceServiceImpl lspEventConsumer = new CobolWorkspaceServiceImpl(lspMessageBroker, executeCommandHandler, sourceUnitGraph, didChangeConfigurationHandler, asyncAnalysisService, uriDecodeService);
    lspEventConsumer.startConsumer();
    CobolLanguageServer server =
            new CobolLanguageServer(
                    lspMessageBroker,
                    null,
                    null,
                    new ExitHandler(stateService),
                    new ShutdownHandler(stateService, lspMessageBroker),
                    new InitializeHandler(mock(WatcherServiceImpl.class)),
                    new InitializedHandler(mock(WatcherServiceImpl.class), null, null, null, null, null, null, null),
                    lspEventConsumer);

    try {
      InitializeResult result = server.initialize(initializeParams).get();
      checkOnlySupportedCapabilitiesAreSet(result.getCapabilities());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private InitializeParams getInitializeParams() {
    InitializeParams initializeParams = new InitializeParams();

    List<WorkspaceFolder> workspaceFolders = singletonList(new WorkspaceFolder("uri", "name"));
    initializeParams.setWorkspaceFolders(workspaceFolders);
    initializeParams.setClientInfo(new ClientInfo("clientName", "Version-1.x"));
    initializeParams.setLocale("en");
    ClientCapabilities clientCapabilities = new ClientCapabilities();
    TextDocumentClientCapabilities textDocumentClientCapabilities =
            new TextDocumentClientCapabilities();
    PublishDiagnosticsCapabilities publishDiagnosticsCapabilities =
            new PublishDiagnosticsCapabilities();
    publishDiagnosticsCapabilities.setTagSupport(
            new DiagnosticsTagSupport(ImmutableList.of(Unnecessary, DiagnosticTag.Deprecated)));
    textDocumentClientCapabilities.setPublishDiagnostics(publishDiagnosticsCapabilities);
    CompletionCapabilities completionCapabilities = new CompletionCapabilities();
    CompletionItemCapabilities completionItemCapabilities = new CompletionItemCapabilities();
    completionItemCapabilities.setTagSupport(
            new CompletionItemTagSupportCapabilities(ImmutableList.of(CompletionItemTag.Deprecated)));
    completionCapabilities.setCompletionItem(completionItemCapabilities);
    textDocumentClientCapabilities.setCompletion(completionCapabilities);
    clientCapabilities.setTextDocument(textDocumentClientCapabilities);
    clientCapabilities.setWorkspace(new WorkspaceClientCapabilities());
    clientCapabilities.setGeneral(new GeneralClientCapabilities());
    initializeParams.setCapabilities(clientCapabilities);
    return initializeParams;
  }

  /**
   * Test change in server exit status upon shutdown call.
   */
  @Test
  void shutdown() {
    TextDocumentService textDocumentService = mock(CobolTextDocumentService.class);
    ExecuteCommandHandler executeCommandHandler = mock(ExecuteCommandHandler.class);
    SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
    DidChangeConfigurationHandler didChangeConfigurationHandler = mock(DidChangeConfigurationHandler.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    LspMessageBroker lspMessageBroker = new LspMessageBroker();
    CobolWorkspaceServiceImpl lspEventConsumer = new CobolWorkspaceServiceImpl(lspMessageBroker, executeCommandHandler, sourceUnitGraph, didChangeConfigurationHandler, asyncAnalysisService, uriDecodeService);
    lspEventConsumer.startConsumer();

    CobolLanguageServer server =
            new CobolLanguageServer(
                    lspMessageBroker,
                    textDocumentService,
                    null,
                    new ExitHandler(stateService),
                    new ShutdownHandler(stateService, lspMessageBroker),
                    new InitializeHandler(null),
                    new InitializedHandler(null, null, null, null, null, null, null, null),
                    lspEventConsumer);
    assertEquals(1, stateService.getExitCode());
    server.shutdown();
    try {
      waitingQuery(lspMessageBroker).get(1, TimeUnit.SECONDS);
    } catch (InterruptedException | ExecutionException | TimeoutException e) {
      assertEquals(0, stateService.getExitCode());
    }
  }

  private void checkOnlySupportedCapabilitiesAreSet(ServerCapabilities capabilities) {
    assertEquals(TextDocumentSyncKind.Full, capabilities.getTextDocumentSync().getLeft());
    assertTrue(capabilities.getWorkspace().getWorkspaceFolders().getSupported());
    assertTrue(capabilities.getDefinitionProvider().getLeft());
    assertTrue(capabilities.getReferencesProvider().getLeft());
    assertTrue(capabilities.getDocumentFormattingProvider().getLeft());
    assertTrue(capabilities.getDocumentHighlightProvider().getLeft());
    assertTrue(capabilities.getCodeActionProvider().getLeft());
    assertTrue(capabilities.getDocumentSymbolProvider().getRight().getWorkDoneProgress());
    assertTrue(capabilities.getFoldingRangeProvider().getLeft());
    assertEquals(ImmutableList.of(ErrorCodes.MISSING_COPYBOOK.getLabel()),
            capabilities.getExecuteCommandProvider().getCommands());

    assertFalse(capabilities.getCompletionProvider().getResolveProvider());
    assertNull(capabilities.getWorkspace().getWorkspaceFolders().getChangeNotifications());
    assertNull(capabilities.getDocumentRangeFormattingProvider());
    assertTrue(capabilities.getHoverProvider().getLeft());
    assertNull(capabilities.getRenameProvider());
    assertNull(capabilities.getWorkspaceSymbolProvider());
    assertNull(capabilities.getCodeLensProvider());
    assertNull(capabilities.getColorProvider());
    assertNull(capabilities.getTypeDefinitionProvider());
    assertNull(capabilities.getDocumentLinkProvider());
    assertNull(capabilities.getExperimental());
    assertNull(capabilities.getSignatureHelpProvider());
    assertNull(capabilities.getImplementationProvider());
  }
}
