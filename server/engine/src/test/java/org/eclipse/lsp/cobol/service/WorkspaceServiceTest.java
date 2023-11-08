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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.CobolWorkspaceServiceImpl;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.LspMessageDispatcher;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeConfigurationHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeWatchedFilesHandler;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.ExecuteCommandHandler;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.ExecuteCommandParams;
import org.eclipse.lsp4j.FileEvent;
import org.eclipse.lsp4j.services.WorkspaceService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.LOCALE;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.LOGGING_LEVEL;
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
  /** Test of the workspace/executeCommand entry point. */
  private DisposableLSPStateService stateService;

  @BeforeEach
  void initialize() {
    stateService = new CobolLSPServerStateService();
  }

  @Test
  void testExecuteCommand() throws InterruptedException {
    CopybookService copybookService = mock(CopybookService.class);
    String copybookName = "COPYBOOK";
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            null,
            copybookNameService,
            null,
            null,
            null,
            messageService,
            asyncAnalysisService);
    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService service = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                    ErrorCodes.MISSING_COPYBOOK.getLabel(),
                ImmutableList.of(
                    new JsonPrimitive(copybookName),
                    new JsonPrimitive(UseCaseUtils.DOCUMENT_URI))));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    lspMessageDispatcher.stop();
    done.join();
  }

  /**
   * Test of the workspace/executeCommand entry point. Assert no changes applied if the command name
   * not recognized.
   */
  @Test
  void testExecuteNonExistingCommand() throws InterruptedException {
    CopybookService copybookService = mock(CopybookService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            null,
            copybookNameService,
            null,
            null,
            null,
            null,
            asyncAnalysisService);
    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, null);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService service = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);


    CompletableFuture<Object> result =
        service.executeCommand(new ExecuteCommandParams("Missing command name", emptyList()));

    lspMessageDispatcher.stop();
    done.join();
    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  /** Test a new watcher created when a new path add in setting.json */
  @Test
  void testChangeConfigurationNewPath() throws InterruptedException {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            settingsService,
            copybookNameService,
            watchingService,
            localeStore,
            keywords,
            messageService,
            asyncAnalysisService);
    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService workspaceService = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    String path = "foo/bar";

    when(copybookNameService.copybookLocalFolders(null))
        .thenReturn(completedFuture(singletonList(path)));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));

    lspMessageDispatcher.stop();
    done.join();
    verify(watchingService).addWatchers(watcherCaptor.capture());
    verify(watchingService).removeWatchers(emptyList());
    verify(asyncAnalysisService).reanalyseOpenedPrograms();
    verify(localeStore).notifyLocaleStore();

    assertEquals(path, watcherCaptor.getValue().get(0));
  }

  /** Test no watchers added or removed when the path list not changed */
  @Test
  void testChangeConfigurationNoChangesInPaths() throws InterruptedException {
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            settingsService,
            copybookNameService,
            watchingService,
            localeStore,
            keywords,
            messageService,
            asyncAnalysisService);

    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService workspaceService = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    String path = "foo/bar";

    when(copybookNameService.copybookLocalFolders(null))
        .thenReturn(completedFuture(singletonList(path)));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));
    lspMessageDispatcher.stop();
    done.join();
    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(asyncAnalysisService).reanalyseOpenedPrograms();
    verify(localeStore).notifyLocaleStore();
  }

  /** Test an existing watcher removed when its path doesn't exist in setting.json */
  @Test
  void testChangeConfigurationPathRemoved() throws InterruptedException {
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            settingsService,
            copybookNameService,
            watchingService,
            localeStore,
            keywords,
            messageService,
            asyncAnalysisService);

    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService workspaceService = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(copybookNameService.copybookLocalFolders(null))
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(localeStore));
    lspMessageDispatcher.stop();
    done.join();

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(watcherCaptor.capture());
    verify(asyncAnalysisService).reanalyseOpenedPrograms();
    assertEquals(path, watcherCaptor.getValue().get(0));
  }

  /** Test no watchers added or removed when the path is empty */
  @Test
  void testChangeConfigurationNoPathToRegister() throws InterruptedException {
    SettingsService settingsService = mock(SettingsService.class);
    WatcherService watchingService = mock(WatcherService.class);
    CopybookService copybookService = mock(CopybookService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    Keywords keywords = mock(Keywords.class);
    MessageService messageService = mock(MessageService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            settingsService,
            copybookNameService,
            watchingService,
            localeStore,
            keywords,
            messageService,
            asyncAnalysisService);

    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService,
            asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService workspaceService = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    when(copybookNameService.copybookLocalFolders(null))
        .thenReturn(completedFuture(emptyList()));
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList("LOCALE")));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(singletonList("INFO")));
    when(watchingService.getWatchingFolders()).thenReturn(emptyList());
    when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

    workspaceService.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));
    lspMessageDispatcher.stop();
    done.join();

    verify(watchingService).addWatchers(emptyList());
    verify(watchingService).removeWatchers(emptyList());
    verify(asyncAnalysisService).reanalyseOpenedPrograms();

  }

  /**
   * This test verifies that the Workspace Service reacts on the file created watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileCreated() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Created));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileChanged() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the file deleted watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesExistingFileDeleted() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks/CpyName.cpy", Deleted));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  void testDidChangeWatchedFilesFolderContentChanged() throws InterruptedException {
    checkWatchers(new FileEvent("file:///c:/workspace/COBOL/.copybooks", Changed));
  }

  private void checkWatchers(FileEvent event) throws InterruptedException {
    CopybookService copybookService = mock(CopybookService.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

    DidChangeConfigurationHandler didChangeConfigurationHandler = new DidChangeConfigurationHandler(stateService,
            null,
            copybookNameService,
            null,
            null,
            null,
            null, asyncAnalysisService);

    DidChangeWatchedFilesHandler didChangeWatchedFilesHandler = new DidChangeWatchedFilesHandler(
            stateService,
            copybookNameService, asyncAnalysisService);
    ExecuteCommandHandler executeCommandHandler = new ExecuteCommandHandler(stateService, copybookService, subroutineService);

    LspMessageDispatcher lspMessageDispatcher = new LspMessageDispatcher();
    CompletableFuture<Void> done = lspMessageDispatcher.startEventLoop();
    WorkspaceService service = new CobolWorkspaceServiceImpl(
            lspMessageDispatcher,
            didChangeConfigurationHandler,
            didChangeWatchedFilesHandler,
            executeCommandHandler);

    DidChangeWatchedFilesParams params = new DidChangeWatchedFilesParams(singletonList(event));
    service.didChangeWatchedFiles(params);
    lspMessageDispatcher.stop();
    done.join();
  }
}
