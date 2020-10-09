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

package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.core.model.ErrorCode;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.ExecutionException;

import static com.broadcom.lsp.cobol.service.utils.SettingsParametersEnum.LOCAL_PATHS;
import static com.broadcom.lsp.cobol.core.model.ErrorCode.values;
import static java.util.Arrays.stream;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.stream.Collectors.toList;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/** This test asserts functions of the {@link CobolLanguageServer}, such as initialization. */
class CobolLanguageServerTest {

  /**
   * Test the {@link CobolLanguageServer#initialized(InitializedParams)} method. Check that the
   * file system watchers registered correctly.
   */
  @Test
  void initialized() {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);

    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.getConfiguration(LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.toStrings(any())).thenCallRealMethod();

    CobolLanguageServer server =
        new CobolLanguageServer(null, null, watchingService, settingsService);

    server.initialized(new InitializedParams());

    verify(watchingService).watchConfigurationChange();
    verify(watchingService).watchPredefinedFolder();
    verify(settingsService).getConfiguration(LOCAL_PATHS.label);
    verify(watchingService).addWatchers(singletonList(path));
  }

  /**
   * Test the {@link CobolLanguageServer#initialize(InitializeParams)} method. It should initialize
   * the services and create a list of supported server capabilities. This test also asserts that
   * there are only supported capabilities add to the {@link InitializeResult} instance.
   */
  @Test
  void initialize() {
    CobolLanguageServer server = new CobolLanguageServer(null, null, null, null);
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

  private void checkOnlySupportedCapabilitiesAreSet(ServerCapabilities capabilities) {
    assertEquals(TextDocumentSyncKind.Full, capabilities.getTextDocumentSync().getLeft());
    assertTrue(capabilities.getWorkspace().getWorkspaceFolders().getSupported());
    assertTrue(capabilities.getCompletionProvider().getResolveProvider());
    assertTrue(capabilities.getDefinitionProvider());
    assertTrue(capabilities.getReferencesProvider());
    assertTrue(capabilities.getDocumentFormattingProvider());
    assertTrue(capabilities.getDocumentHighlightProvider());
    assertTrue(capabilities.getCodeActionProvider());
    assertTrue(capabilities.getDocumentSymbolProvider());
    assertEquals(
        stream(values()).map(ErrorCode::name).collect(toList()),
        capabilities.getExecuteCommandProvider().getCommands());

    assertNull(capabilities.getWorkspace().getWorkspaceFolders().getChangeNotifications());
    assertNull(capabilities.getDocumentRangeFormattingProvider());
    assertNull(capabilities.getHoverProvider());
    assertNull(capabilities.getRenameProvider());
    assertNull(capabilities.getWorkspaceSymbolProvider());
    assertNull(capabilities.getCodeLensProvider());
    assertNull(capabilities.getColorProvider());
    assertNull(capabilities.getTypeDefinitionProvider());
    assertNull(capabilities.getDocumentLinkProvider());
    assertNull(capabilities.getExperimental());
    assertNull(capabilities.getSignatureHelpProvider());
    assertNull(capabilities.getFoldingRangeProvider());
    assertNull(capabilities.getImplementationProvider());
  }
}
