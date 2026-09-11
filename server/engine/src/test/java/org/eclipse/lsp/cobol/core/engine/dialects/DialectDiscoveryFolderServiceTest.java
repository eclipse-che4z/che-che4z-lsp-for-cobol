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
import static org.junit.jupiter.api.Assertions.assertNotSame;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Paths;
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
public class DialectDiscoveryFolderServiceTest {
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
  void testLoadDialects_reusesClassLoaderForSameJar() throws Exception {
    DialectDiscoveryFolderService service = createServiceWithDialect();
    URI jarUri = Paths.get("dialect-test.jar").toUri();
    URLClassLoader classLoader = mockDialectClassLoader();
    doReturn(classLoader).when(service).createClassLoader(jarUri);
    CopybookService copybookService = mock(CopybookService.class);
    MessageService messageService = mock(MessageService.class);
    List<CobolDialect> firstDialects =
        service.loadDialects(jarUri, copybookService, messageService);
    assertEquals(1, firstDialects.size());
    List<CobolDialect> secondDialects =
        service.loadDialects(jarUri, copybookService, messageService);
    assertEquals(1, secondDialects.size());
    assertNotSame(firstDialects.get(0), secondDialects.get(0));

    verify(service, times(1)).createClassLoader(jarUri);
    verify(classLoader, atLeastOnce()).loadClass(TestDialect.class.getName());
    verify(classLoader, never()).close();
  }

  @Test
  void testLoadDialects_usesSeparateClassLoadersForDifferentJars() throws Exception {
    DialectDiscoveryFolderService service = createServiceWithDialect();
    URI firstJar = Paths.get("dialect-a.jar").toUri();
    URI secondJar = Paths.get("dialect-b.jar").toUri();
    URLClassLoader firstLoader = mockDialectClassLoader();
    URLClassLoader secondLoader = mockDialectClassLoader();
    doReturn(firstLoader).when(service).createClassLoader(firstJar);
    doReturn(secondLoader).when(service).createClassLoader(secondJar);
    CopybookService copybookService = mock(CopybookService.class);
    MessageService messageService = mock(MessageService.class);
    List<CobolDialect> firstDialects =
        service.loadDialects(firstJar, copybookService, messageService);
    assertEquals(1, firstDialects.size());
    List<CobolDialect> secondDialects =
        service.loadDialects(secondJar, copybookService, messageService);
    assertEquals(1, secondDialects.size());

    verify(service).createClassLoader(firstJar);
    verify(service).createClassLoader(secondJar);
    verify(firstLoader).loadClass(TestDialect.class.getName());
    verify(secondLoader).loadClass(TestDialect.class.getName());
    verify(firstLoader, never()).close();
    verify(secondLoader, never()).close();
  }

  private DialectDiscoveryFolderService createServiceWithDialect() throws IOException {
    DialectDiscoveryFolderService service =
        spy(
            new DialectDiscoveryFolderService(
                mock(WorkingFolderService.class),
                mock(Communications.class),
                mock(CodeActions.class)));
    doReturn(ImmutableList.of(TestDialect.class.getName())).when(service).getClassNames(any());
    return service;
  }

  private URLClassLoader mockDialectClassLoader() throws ClassNotFoundException {
    // Class.forName requires the loader's JVM state to be initialized even when loadClass is
    // mocked.
    URLClassLoader classLoader =
        mock(
            URLClassLoader.class,
            withSettings().useConstructor(new URL[0], getClass().getClassLoader()));
    doReturn(TestDialect.class).when(classLoader).loadClass(TestDialect.class.getName());
    return classLoader;
  }

  /** A dialect fixture returned by the mocked classloaders. */
  public static class TestDialect implements CobolDialect {
    public TestDialect(CopybookService copybookService, MessageService messageService) {}

    @Override
    public String getName() {
      return "test";
    }
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
