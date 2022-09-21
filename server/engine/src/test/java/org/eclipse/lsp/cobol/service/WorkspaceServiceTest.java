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
import static org.eclipse.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.LOCALE;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.LOGGING_LEVEL;
import static org.eclipse.lsp4j.FileChangeType.Changed;
import static org.eclipse.lsp4j.FileChangeType.Created;
import static org.eclipse.lsp4j.FileChangeType.Deleted;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.timeout;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.impl.DefaultDataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.ExecuteCommandParams;
import org.eclipse.lsp4j.FileEvent;
import org.eclipse.lsp4j.services.WorkspaceService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

/**
 * This test checks the entry points of the {@link org.eclipse.lsp4j.services.WorkspaceService}
 * implementation.
 */
@Slf4j
@SuppressWarnings("unchecked")
class WorkspaceServiceTest {
  /** Test of the workspace/executeCommand entry point. */
  private DisposableLSPStateService stateService;

  @BeforeEach
  void initialize() {
    stateService = new CobolLSPServerStateService();
  }

  @Test
  void testExecuteCommand() {
    DataBusBroker broker = mock(DataBusBroker.class);
    CopybookService copybookService = mock(CopybookService.class);
    String copybookName = "COPYBOOK";
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);

    WorkspaceService service =
        new CobolWorkspaceServiceImpl(
            broker,
            null,
            null,
            copybookService,
            null,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService,
            null);

    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                MISSING_COPYBOOK.getLabel(),
                ImmutableList.of(
                    new JsonPrimitive(copybookName),
                    new JsonPrimitive(UseCaseUtils.DOCUMENT_URI))));

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
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    WorkspaceService service =
        new CobolWorkspaceServiceImpl(
            broker,
            null,
            null,
            copybookService,
            null,
            null,
            configurationService,
            stateService,
            copybookNameService,
            null);

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
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(
            broker,
            settingsService,
            watchingService,
            copybookService,
            localeStore,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService,
                keywords);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    String path = "foo/bar";

    when(copybookNameService.copybookLocalFolders())
        .thenReturn(completedFuture(singletonList(path)));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams());

    verify(watchingService).addWatchers(watcherCaptor.capture());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
    verify(subroutineService).invalidateCache();
    verify(localeStore).notifyLocaleStore();
    verify(configurationService).updateConfigurationFromSettings();

    assertEquals(path, watcherCaptor.getValue().get(0));

    verify(broker).postData(any(RunAnalysisEvent.class));
  }

  /** Test no watchers added or removed when the path list not changed */
  @Test
  void testChangeConfigurationNoChangesInPaths() {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(
            broker,
            settingsService,
            watchingService,
            copybookService,
            localeStore,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService,
                keywords);

    String path = "foo/bar";

    when(copybookNameService.copybookLocalFolders())
        .thenReturn(completedFuture(singletonList(path)));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams());

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
    verify(subroutineService).invalidateCache();
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
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(
            broker,
            settingsService,
            watchingService,
            copybookService,
            localeStore,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService, keywords);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(copybookNameService.copybookLocalFolders())
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(localeStore));

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(watcherCaptor.capture());
    verify(copybookService).invalidateCache();
    verify(subroutineService).invalidateCache();
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
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);

    WorkspaceService workspaceService =
        new CobolWorkspaceServiceImpl(
            broker,
            settingsService,
            watchingService,
            copybookService,
            localeStore,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService, keywords);

    when(copybookNameService.copybookLocalFolders())
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams());

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(copybookService).invalidateCache();
    verify(subroutineService).invalidateCache();
  }

  /**
   * This test verifies that the Workspace Service reacts on the file created watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileCreated() {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Created));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileChanged() {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file deleted watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileDeleted() {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Deleted));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesFolderContentChanged() {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks", Changed));
  }

  private void checkWatchers(FileEvent event) {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    CopybookService copybookService = mock(CopybookService.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    ConfigurationService configurationService = mock(ConfigurationService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);

    WorkspaceService service =
        new CobolWorkspaceServiceImpl(
            broker,
            null,
            null,
            copybookService,
            null,
            subroutineService,
            configurationService,
            stateService,
            copybookNameService, null);

    DidChangeWatchedFilesParams params = new DidChangeWatchedFilesParams(singletonList(event));
    service.didChangeWatchedFiles(params);

    verify(broker).postData(any(RunAnalysisEvent.class));
  }
}
