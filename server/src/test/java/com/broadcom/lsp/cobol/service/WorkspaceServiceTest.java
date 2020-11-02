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

import com.broadcom.lsp.cobol.core.messages.LocaleStore;
import com.broadcom.lsp.cobol.domain.databus.api.DataBusBroker;
import com.broadcom.lsp.cobol.domain.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.cobol.domain.event.model.RunAnalysisEvent;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.ExecuteCommandParams;
import org.eclipse.lsp4j.FileEvent;
import org.eclipse.lsp4j.services.WorkspaceService;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static com.broadcom.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static com.broadcom.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static org.eclipse.lsp4j.FileChangeType.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.*;

/**
 * This test checks the entry points of the {@link org.eclipse.lsp4j.services.WorkspaceService}
 * implementation.
 */
@Slf4j
@SuppressWarnings("unchecked")
class WorkspaceServiceTest {
  /**
   * Test of the workspace/executeCommand entry point.
   */
  @Test
  void testExecuteCommand() {
    DataBusBroker broker = mock(DataBusBroker.class);
    CopybookService copybookService = mock(CopybookService.class);
    String copybookName = "COPYBOOK";

    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null, null, copybookService, null);

    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                MISSING_COPYBOOK.name(),
                List.of(new JsonPrimitive(copybookName), new JsonPrimitive(UseCaseUtils.DOCUMENT_URI))));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(broker, timeout(10000)).postData(any(RunAnalysisEvent.class));
  }

  /**
   * Test of the workspace/executeCommand entry point. Assert no changes applied if the command name
   * not recognized.
   */
  @Test
  void testExecuteNonExistingCommand() {
    DataBusBroker broker = mock(DataBusBroker.class);
    CopybookService copybookService = mock(CopybookService.class);
    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null, null, copybookService, null);

    CompletableFuture<Object> result =
        service.executeCommand(new ExecuteCommandParams("Missing command name", emptyList()));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(broker, timeout(1000).times(0)).postData(any());
  }

  /** Test a new watcher created when a new path add in setting.json */
  @Test
  void testChangeConfigurationNewPath() {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(broker, settingsService, watchingService, copybookService, localeStore);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.getConfiguration(LOCAL_PATHS.label))
            .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.getConfiguration(LOCALE.label))
            .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.getConfiguration(LOGGING_LEVEL.label))
            .thenReturn(completedFuture(singletonList("INFO")));
    when(settingsService.toStrings(any())).thenCallRealMethod();
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(null));

    verify(watchingService).addWatchers(watcherCaptor.capture());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
    verify(localeStore).notifyLocaleStore();

    assertEquals(path, watcherCaptor.getValue().get(0));

    verify(broker).postData(any(RunAnalysisEvent.class));
  }

  /** Test no watchers added or removed when the path list not changed */
  @Test
  void testChangeConfigurationNoChangesInPaths() {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(broker, settingsService, watchingService, copybookService, localeStore);

    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.getConfiguration(LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.getConfiguration(LOCALE.label))
            .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.getConfiguration(LOGGING_LEVEL.label))
            .thenReturn(completedFuture(singletonList("INFO")));
    when(settingsService.toStrings(any())).thenCallRealMethod();
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(null));

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
    verify(localeStore).notifyLocaleStore();
  }

  /** Test an existing watcher removed when its path doesn't exist in setting.json */
  @Test
  void testChangeConfigurationPathRemoved() {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(broker, settingsService, watchingService, copybookService, localeStore);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.getConfiguration(LOCAL_PATHS.label))
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.getConfiguration(LOCALE.label))
            .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.getConfiguration(LOGGING_LEVEL.label))
            .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(localeStore));

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(watcherCaptor.capture());
    verify(copybookService).invalidateCache();
    assertEquals(path, watcherCaptor.getValue().get(0));

    verify(broker).postData(any(RunAnalysisEvent.class));
  }

  /** Test no watchers added or removed when the path is empty */
  @Test
  void testChangeConfigurationNoPathToRegister() {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(broker, settingsService, watchingService, copybookService, localeStore);

    when(settingsService.getConfiguration(LOCAL_PATHS.label))
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.getConfiguration(LOCALE.label))
            .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.getConfiguration(LOGGING_LEVEL.label))
            .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(null));

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
  }

  /**
   * This test verifies that the Workspace Service reacts on the file created watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileCreated() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks/CpyName.cpy", Created));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileChanged() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks/CpyName.cpy", Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file deleted watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileDeleted() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks/CpyName.cpy", Deleted));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesFolderContentChanged() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks", Changed));
  }

  private void checkWatchers(FileEvent event) {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    CopybookService copybookService = mock(CopybookService.class);

    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null, null, copybookService, null);

    DidChangeWatchedFilesParams params = new DidChangeWatchedFilesParams(singletonList(event));
    service.didChangeWatchedFiles(params);

    verify(broker).postData(any(RunAnalysisEvent.class));
  }
}
