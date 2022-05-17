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
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

/**
 * This class is a unit test for the {@link WatcherServiceImpl} and asserts that it creates correct
 * JSON object structures on each watching request.
 */
class WatcherServiceImplTest {

  @Test
  void watchConfigurationChange() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider);

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
  void watchPredefinedFolder() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider);

    watcherService.watchPredefinedFolder();

    verify(client).registerCapability(captor.capture());
    assertRegistrationParams(captor.getValue());
  }

  @Test
  void addWatchers() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<RegistrationParams> captor = forClass(RegistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider);

    watcherService.addWatchers(ImmutableList.of("foo/bar", "baz", "bar\\foo"));
    assertEquals(ImmutableList.of("foo/bar", "baz", "bar\\foo"), watcherService.getWatchingFolders());

    verify(client).registerCapability(captor.capture());
    RegistrationParams params = captor.getValue();

    assertEquals(3, params.getRegistrations().size());

    assertRegistration(params.getRegistrations().get(0), "foo/bar");
    assertRegistration(params.getRegistrations().get(1), "baz");
    assertRegistration(params.getRegistrations().get(2), "bar\\foo");
  }

  @Test
  void removeWatchers() {
    CobolLanguageClient client = mock(CobolLanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    ArgumentCaptor<UnregistrationParams> captor = forClass(UnregistrationParams.class);
    WatcherService watcherService = new WatcherServiceImpl(provider);

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

  private void assertRegistration(Registration registration, String glob) {
    assertEquals(glob, registration.getId());
    assertEquals("workspace/didChangeWatchedFiles", registration.getMethod());

    List<FileSystemWatcher> watchers =
        ((DidChangeWatchedFilesRegistrationOptions) registration.getRegisterOptions())
            .getWatchers();
    assertEquals(2, watchers.size());
    FileSystemWatcher fileWatcher = watchers.get(0);
    assertEquals("**/" + glob + "/**/*", fileWatcher.getGlobPattern());
    assertEquals(7, fileWatcher.getKind().intValue());

    FileSystemWatcher folderWatcher = watchers.get(1);
    assertEquals("**/" + glob, folderWatcher.getGlobPattern());
    assertEquals(7, folderWatcher.getKind().intValue());
  }

  private void assertRegistrationParams(RegistrationParams params) {
    assertEquals(1, params.getRegistrations().size());
    Registration registration = params.getRegistrations().get(0);
    assertNotNull(registration.getId());
    assertEquals("workspace/didChangeWatchedFiles", registration.getMethod());

    List<FileSystemWatcher> watchers =
        ((DidChangeWatchedFilesRegistrationOptions) registration.getRegisterOptions())
            .getWatchers();

    FileSystemWatcher watcher = watchers.get(0);
    assertEquals("**/.copybooks/**/*", watcher.getGlobPattern());
    assertEquals(7, watcher.getKind().intValue());
  }
}
