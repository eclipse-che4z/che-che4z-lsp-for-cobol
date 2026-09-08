/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.dialects;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.net.URI;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Collections;
import java.util.List;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.junit.jupiter.api.Test;

/** Test for DialectDiscoveryFolderService */
class DialectDiscoveryFolderServiceTest {
  @Test
  void testLoadDialects() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    when(workingFolderService.getFilenames(any())).thenReturn(ImmutableList.of("dialect-test.jar"));

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testLoadDialects_working_folder_failed() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    when(workingFolderService.getWorkingFolder()).thenThrow(new RuntimeException());

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testLoadDialects_get_filenames_failed() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    when(workingFolderService.getFilenames(any())).thenThrow(new RuntimeException());

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testLoadDialects_specifiedPath() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    when(workingFolderService.getFilenames(any())).thenReturn(ImmutableList.of("dialect-test.jar"));

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(
            URI.create(""), mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testReplaceClassLoader_closesPreviousLoaderForSameJar() throws Exception {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);

    URI jarUri = URI.create("file:///dialect-test.jar");
    URLClassLoader firstLoader = spy(new URLClassLoader(new URL[0]));
    URLClassLoader secondLoader = new URLClassLoader(new URL[0]);

    service.replaceClassLoader(jarUri, firstLoader);
    verify(firstLoader, never()).close();

    // A second load for the *same* jar must close the previous classloader, otherwise the
    // jar file handle it holds is never released (locks the file on Windows).
    service.replaceClassLoader(jarUri, secondLoader);
    verify(firstLoader, times(1)).close();
  }

  @Test
  void testReplaceClassLoader_doesNotCloseLoaderForDifferentJar() throws Exception {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);

    URLClassLoader firstLoader = spy(new URLClassLoader(new URL[0]));
    URLClassLoader secondLoader = new URLClassLoader(new URL[0]);

    service.replaceClassLoader(URI.create("file:///dialect-a.jar"), firstLoader);
    service.replaceClassLoader(URI.create("file:///dialect-b.jar"), secondLoader);

    verify(firstLoader, never()).close();
  }

  @Test
  void testRegisterExecuteCommandCapabilities() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    service.registerExecuteCommandCapabilities(Collections.emptyList(), "test");
    verify(communications).registerExecuteCommandCapability(Collections.emptyList(), "test");
  }

  @Test
  void testUnRegisterExecuteCommandCapabilities() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    service.unregisterExecuteCommandCapabilities("test");
    verify(communications).unregisterExecuteCommandCapability("test");
  }

  @Test
  void testRegisterDialectCodeActionProviders() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(workingFolderService, communications, actions);
    service.registerDialectCodeActionProviders(Collections.emptyList());
    verify(actions).registerNewProviders(Collections.emptyList());
  }
}
