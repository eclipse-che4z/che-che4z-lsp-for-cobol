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
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.core.model.ErrorCode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.delegates.completions.Snippets;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;

import static java.util.Arrays.stream;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.ErrorCode.values;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;
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
    Snippets snippets = mock(Snippets.class);

    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.getConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.toStrings(any())).thenCallRealMethod();
    when(localeStore.notifyLocaleStore()).thenReturn(System.out::println);
    when(settingsService.getConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.getConfiguration(SUBROUTINE_LOCAL_PATHS.label))
        .thenReturn(completedFuture(ImmutableList.of()));
    when(settingsService.getConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(ImmutableList.of("INFO")));
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
            keywords,
            snippets);

    server.initialized(new InitializedParams());

    verify(watchingService).watchConfigurationChange();
    verify(watchingService).watchPredefinedFolder();
    verify(settingsService).getConfiguration(CPY_LOCAL_PATHS.label);
    verify(settingsService).getConfiguration(LOCALE.label);
    verify(watchingService).addWatchers(singletonList(path));
    verify(localeStore).notifyLocaleStore();
    verify(configurationService).updateConfigurationFromSettings();
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
            null, null, null, null, null, customExecutor, stateService, null, null, null, null);
    InitializeParams initializeParams = new InitializeParams();

    List<WorkspaceFolder> workspaceFolders = singletonList(new WorkspaceFolder("uri", "name"));
    initializeParams.setWorkspaceFolders(workspaceFolders);

    try {
      InitializeResult result = server.initialize(initializeParams).get();
      checkOnlySupportedCapabilitiesAreSet(result.getCapabilities());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
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
    assertTrue(capabilities.getDocumentSymbolProvider().getLeft());
    assertTrue(capabilities.getFoldingRangeProvider().getLeft());
    assertEquals(
        stream(values()).map(ErrorCode::name).collect(toList()),
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
