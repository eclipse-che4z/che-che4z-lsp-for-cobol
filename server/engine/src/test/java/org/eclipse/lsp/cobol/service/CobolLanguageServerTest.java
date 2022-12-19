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

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.common.error.ErrorCode;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp4j.ClientCapabilities;
import org.eclipse.lsp4j.ClientInfo;
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
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.internal.verification.Times;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;

import static java.util.Arrays.stream;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static org.eclipse.lsp4j.DiagnosticTag.Unnecessary;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/** This test asserts functions of the {@link CobolLanguageServer}, such as initialization. */
class CobolLanguageServerTest {

  private static CustomThreadPoolExecutor customExecutor;
  private DisposableLSPStateService stateService;

  @BeforeAll
  static void init() {
    customExecutor = mock(CustomThreadPoolExecutor.class);
    when(customExecutor.getThreadPoolExecutor()).thenReturn(Executors.newFixedThreadPool(3));
    when(customExecutor.getScheduledThreadPoolExecutor())
        .thenReturn(Executors.newSingleThreadScheduledExecutor());
  }

  @BeforeEach
  void getStateService() {
    stateService = new CobolLSPServerStateService();
  }

  /**
   * Test the {@link CobolLanguageServer#initialized(InitializedParams)} method. Check that the file
   * system watchers registered correctly.
   */
  @Test
  void initialized() {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);

    when(settingsService.fetchTextConfiguration(anyString())).thenCallRealMethod();
    prepareSettingsService(settingsService, localeStore);

    CobolLanguageServer server =
        new CobolLanguageServer(
            null,
            null,
            watchingService,
            settingsService,
            localeStore,
            customExecutor,
            stateService,
            configurationService,
            copybookNameService,
            keywords);

    server.initialized(new InitializedParams());

    verify(watchingService).watchConfigurationChange();
    verify(watchingService).watchPredefinedFolder();
    verify(settingsService).fetchConfiguration(CPY_LOCAL_PATHS.label);
    verify(settingsService).fetchConfiguration(DACO_CPY_LOCAL_PATHS.label);
    verify(settingsService).fetchConfiguration(IDMS_CPY_LOCAL_PATHS.label);
    verify(settingsService).fetchConfiguration(LOCALE.label);
    verify(settingsService).fetchConfiguration(CPY_EXTENSIONS.label);
    verify(watchingService, new Times(3)).addWatchers(singletonList("foo/bar"));
    verify(localeStore).notifyLocaleStore();
    verify(configurationService).updateConfigurationFromSettings();
  }

  private void prepareSettingsService(SettingsService settingsService, LocaleStore localeStore) {
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.fetchConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(DACO_CPY_LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(IDMS_CPY_LOCAL_PATHS.label))
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
  }

  @Test
  void initializedConfig() {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    CobolTextDocumentService textService = mock(CobolTextDocumentService.class);

    when(settingsService.fetchTextConfiguration(anyString()))
        .thenReturn(CompletableFuture.supplyAsync(ImmutableList::of));
    prepareSettingsService(settingsService, localeStore);

    CobolLanguageServer server =
        new CobolLanguageServer(
            textService,
            null,
            watchingService,
            settingsService,
            localeStore,
            customExecutor,
            stateService,
            configurationService,
            copybookNameService,
            keywords);

    server.initialized(new InitializedParams());
    verify(textService, times(1)).notifyExtensionConfig(any());

  }

  /**
   * Test the {@link CobolLanguageServer#initialize(InitializeParams)} method. It should initialize
   * the services and create a list of supported server capabilities. This test also asserts that
   * there are only supported capabilities add to the {@link InitializeResult} instance.
   */
  @Test
  void initialize() {
    CobolLanguageServer server =
        new CobolLanguageServer(
            null,
            null,
            null,
            null,
            null,
            customExecutor,
            stateService,
            null,
            null,
            null);
    InitializeParams initializeParams = getInitializeParams();

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
    TextDocumentClientCapabilities textDocumentClientCapabilities = new TextDocumentClientCapabilities();
    PublishDiagnosticsCapabilities publishDiagnosticsCapabilities = new PublishDiagnosticsCapabilities();
    publishDiagnosticsCapabilities.setTagSupport(new DiagnosticsTagSupport(ImmutableList.of(Unnecessary, DiagnosticTag.Deprecated)));
    textDocumentClientCapabilities.setPublishDiagnostics(publishDiagnosticsCapabilities);
    CompletionCapabilities completionCapabilities = new CompletionCapabilities();
    CompletionItemCapabilities completionItemCapabilities = new CompletionItemCapabilities();
    completionItemCapabilities.setTagSupport(new CompletionItemTagSupportCapabilities(ImmutableList.of(CompletionItemTag.Deprecated)));
    completionCapabilities.setCompletionItem(completionItemCapabilities);
    textDocumentClientCapabilities.setCompletion(completionCapabilities);
    clientCapabilities.setTextDocument(textDocumentClientCapabilities);
    clientCapabilities.setWorkspace(new WorkspaceClientCapabilities());
    clientCapabilities.setGeneral(new GeneralClientCapabilities());
    initializeParams.setCapabilities(clientCapabilities);
    return initializeParams;
  }

  /** Test change in server exit status upon shutdown call. */
  @Test
  void shutdown() {
    TextDocumentService textDocumentService = mock(CobolTextDocumentService.class);
    CobolLanguageServer server =
        new CobolLanguageServer(
            textDocumentService,
            null,
            null,
            null,
            null,
            customExecutor,
            stateService,
            null,
            null,
            null);
    assertEquals(1, stateService.getExitCode());
    server.shutdown();
    assertEquals(0, stateService.getExitCode());
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
    assertEquals(
        stream(ErrorCode.values()).map(ErrorCode::getLabel).collect(toList()),
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
