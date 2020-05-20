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

package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.service.providers.ClientProvider;
import com.ca.lsp.core.cobol.model.ErrorCode;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.Test;
import org.mockito.ArgumentCaptor;

import java.util.List;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.core.cobol.model.ErrorCode.values;
import static java.util.Arrays.stream;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;
import static org.junit.Assert.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

/** This test asserts functions of the {@link MyLanguageServerImpl}, such as initialization. */
public class MyLanguageServerImplTest {

  /**
   * Test the {@link MyLanguageServerImpl#initialized(InitializedParams)} method. Check that the
   * file system watchers registered correctly.
   */
  @Test
  public void initialized() {
    LanguageClient client = mock(LanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.set(client);

    MyLanguageServerImpl server = new MyLanguageServerImpl(null, null, provider, null);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    server.initialized(new InitializedParams());

    verify(client).registerCapability(captor.capture());
    RegistrationParams params = captor.getValue();
    assertRegistrationParams(params);
  }

  /**
   * Test the {@link MyLanguageServerImpl#initialize(InitializeParams)} method. It should initialize
   * the services and create a list of supported server capabilities. This test also asserts that
   * there are only supported capabilities add to the {@link InitializeResult} instance.
   */
  @Test
  public void initialize() {
    MyLanguageServerImpl server = new MyLanguageServerImpl(null, null, null, null);
    InitializeParams initializeParams = new InitializeParams();

    List<WorkspaceFolder> workspaceFolders = singletonList(new WorkspaceFolder("uri", "name"));
    initializeParams.setWorkspaceFolders(workspaceFolders);

    try {
      InitializeResult result = server.initialize(initializeParams).get();
      checkOnlySupportedCapabilitiesAreSet(result.getCapabilities());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }

    //    verify(fileSystemService).setWorkspaceFolders(workspaceFolders);
  }

  private void assertRegistrationParams(RegistrationParams params) {
    Registration registration = params.getRegistrations().get(0);
    assertNotNull(registration.getId());
    assertEquals("workspace/didChangeWatchedFiles", registration.getMethod());

    List<FileSystemWatcher> watchers =
        ((DidChangeWatchedFilesRegistrationOptions) registration.getRegisterOptions())
            .getWatchers();

    watchers.forEach(it -> assertTrue(it.getGlobPattern().startsWith("**/.copybooks")));
    watchers.forEach(it -> assertEquals(7, it.getKind().intValue()));
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
    assertEquals(
        stream(values()).map(ErrorCode::name).collect(toList()),
        capabilities.getExecuteCommandProvider().getCommands());

    assertNull(capabilities.getWorkspace().getWorkspaceFolders().getChangeNotifications());
    assertNull(capabilities.getDocumentRangeFormattingProvider());
    assertNull(capabilities.getHoverProvider());
    assertNull(capabilities.getRenameProvider());
    assertNull(capabilities.getWorkspaceSymbolProvider());
    assertNull(capabilities.getDocumentSymbolProvider());
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
