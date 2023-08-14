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
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.internal.verification.Times;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import static java.util.Collections.singletonList;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.SUBROUTINE_LOCAL_PATHS;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * This class is a unit test for the {@link WatcherServiceImpl} and asserts that it creates correct
 * JSON object structures on each watching request.
 */
class WatcherServiceImplTest {

  private static final String WORKSPACE_URI = "workspace-uri";
  private static final String WORKSPACE_NAME = "workspace-name";

  @Test
  void watchConfigurationChange() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider, configurationService);

    watcherService.watchConfigurationChange();

    verify(client).registerCapability(captor.capture());

    RegistrationParams params = captor.getValue();
    assertEquals(1, params.getRegistrations().size());

    Registration registration = params.getRegistrations().get(0);
    assertNotNull(registration.getId());
    assertEquals("workspace/didChangeConfiguration", registration.getMethod());
    assertNull(registration.getRegisterOptions());
  }

  @Test
  void addWatchers() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider, configurationService);
    watcherService.getWorkspaceFolders().add(new WorkspaceFolder(WORKSPACE_URI, WORKSPACE_NAME));

    watcherService.addWatchers(ImmutableList.of("foo/bar", "baz", "bar/foo"));
    assertEquals(
        ImmutableList.of("foo/bar", "baz", "bar/foo"), watcherService.getWatchingFolders());

    verify(client).registerCapability(captor.capture());
    RegistrationParams params = captor.getValue();

    assertEquals(3, params.getRegistrations().size());

    assertRegistration(params.getRegistrations().get(0), "foo/bar");
    assertRegistration(params.getRegistrations().get(1), "baz");
    assertRegistration(params.getRegistrations().get(2), "bar/foo");
  }

  @Test
  void addRuntimeWatchers() {
    ConfigurationService configurationService = mockConfigurationService();

    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider, configurationService);
    watcherService.getWorkspaceFolders().add(new WorkspaceFolder(WORKSPACE_URI, WORKSPACE_NAME));
    watcherService.addRuntimeWatchers("document.cbl");

    verify(client, new Times(3)).registerCapability(captor.capture());
    List<RegistrationParams> params = captor.getAllValues();

    assertRegisterParams(params);
  }

  private ConfigurationService mockConfigurationService() {
    ConfigurationService configurationService = mock(ConfigurationService.class);
    when(configurationService.getListConfiguration("document.cbl", CPY_LOCAL_PATHS.label))
        .thenReturn(CompletableFuture.completedFuture(singletonList("cobol/copybook")));
    when(configurationService.getListConfiguration("document.cbl", SUBROUTINE_LOCAL_PATHS.label))
        .thenReturn(CompletableFuture.completedFuture(singletonList("sub/routine")));
    when(configurationService.getDialectWatchingFolders())
        .thenReturn(singletonList("dialect/testDialect"));
    when(configurationService.getListConfiguration("document.cbl", "dialect/testDialect"))
        .thenReturn(CompletableFuture.completedFuture(singletonList("dialect/watchFolder")));
    return configurationService;
  }

  @Test
  void removeWatchers() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<UnregistrationParams> captor = forClass(UnregistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider, configurationService);
    watcherService.getWorkspaceFolders().add(new WorkspaceFolder(WORKSPACE_URI, WORKSPACE_NAME));

    watcherService.addWatchers(ImmutableList.of("foo/bar", "baz", "bar\\foo"));
    watcherService.removeWatchers(ImmutableList.of("non-existing", "foo/bar"));

    assertEquals(ImmutableList.of("baz", "bar\\foo"), watcherService.getWatchingFolders());

    verify(client).unregisterCapability(captor.capture());
    UnregistrationParams params = captor.getValue();

    List<Unregistration> unregistrations = params.getUnregisterations();
    assertEquals(1, unregistrations.size());

    Unregistration unregistration = unregistrations.get(0);
    assertEquals("foo/bar", unregistration.getId());
    assertEquals("workspace/didChangeWatchedFiles", unregistration.getMethod());
  }

  @Test
  void removeRuntimeWatchers() {
    ConfigurationService configurationService = mockConfigurationService();

    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<UnregistrationParams> captor = forClass(UnregistrationParams.class);
    ArgumentCaptor<RegistrationParams> registerRequest = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider, configurationService);
    watcherService.getWorkspaceFolders().add(new WorkspaceFolder(WORKSPACE_URI, WORKSPACE_NAME));
    watcherService.addRuntimeWatchers("document.cbl");
    watcherService.removeRuntimeWatchers("document.cbl");

    verify(client, new Times(3)).registerCapability(registerRequest.capture());
    List<RegistrationParams> allValues = registerRequest.getAllValues();

    assertRegisterParams(allValues);

    verify(client).unregisterCapability(captor.capture());
    UnregistrationParams params = captor.getValue();

    List<Unregistration> unregistrations = params.getUnregisterations();
    assertEquals(3, unregistrations.size());

    assertEquals("cobol/copybook", unregistrations.get(0).getId());
    assertEquals("dialect/watchFolder", unregistrations.get(1).getId());
    assertEquals("sub/routine", unregistrations.get(2).getId());
    assertEquals("workspace/didChangeWatchedFiles", unregistrations.get(0).getMethod());
  }

  private void assertRegisterParams(List<RegistrationParams> allValues) {
    assertEquals(3, allValues.size());
    assertEquals(allValues.get(0).getRegistrations().get(0).getId(), "cobol/copybook");
    assertRegistration(allValues.get(0).getRegistrations().get(0), "cobol/copybook");
    assertEquals(allValues.get(1).getRegistrations().get(0).getId(), "dialect/watchFolder");
    assertRegistration(allValues.get(1).getRegistrations().get(0), "dialect/watchFolder");
    assertEquals(allValues.get(2).getRegistrations().get(0).getId(), "sub/routine");
    assertRegistration(allValues.get(2).getRegistrations().get(0), "sub/routine");
  }

  private void assertRegistration(Registration registration, String glob) {
    assertEquals(glob, registration.getId());
    assertEquals("workspace/didChangeWatchedFiles", registration.getMethod());

    List<FileSystemWatcher> watchers =
        ((DidChangeWatchedFilesRegistrationOptions) registration.getRegisterOptions())
            .getWatchers();
    assertEquals(2, watchers.size());
    FileSystemWatcher fileWatcher = watchers.get(0);
    assertEquals("**/*", fileWatcher.getGlobPattern().getRight().getPattern());
    assertEquals(WORKSPACE_URI, fileWatcher
            .getGlobPattern()
            .getRight()
            .getBaseUri()
            .getLeft().getUri());
    assertEquals(7, fileWatcher.getKind().intValue());

    FileSystemWatcher folderWatcher = watchers.get(1);
    assertEquals(WORKSPACE_URI, folderWatcher
            .getGlobPattern()
            .getRight()
            .getBaseUri()
            .getLeft().getUri());
    assertNull(folderWatcher.getGlobPattern().getRight().getPattern());
    assertEquals(7, folderWatcher.getKind().intValue());
  }
}
