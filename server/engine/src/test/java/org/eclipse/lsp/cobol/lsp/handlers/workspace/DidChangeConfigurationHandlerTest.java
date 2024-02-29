/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.workspace;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.lsp.*;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolLSPServerStateService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

/**
 * Tests {@link DidChangeConfigurationHandler}
 */
class DidChangeConfigurationHandlerTest {
    /** Test no watchers added or removed when the path is empty */
    @Test
    void testChangeConfigurationNoPathToRegister() throws InterruptedException {
        DisposableLSPStateService stateService = new CobolLSPServerStateService();
        SettingsService settingsService = mock(SettingsService.class);
        WatcherService watchingService = mock(WatcherService.class);
        LocaleStore localeStore = mock(LocaleStore.class);
        CopybookNameService copybookNameService = mock(CopybookNameService.class);
        Keywords keywords = mock(Keywords.class);
        MessageService messageService = mock(MessageService.class);
        AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

        DidChangeConfigurationHandler didChangeConfigurationHandler =
                new DidChangeConfigurationHandler(
                        stateService,
                        settingsService,
                        copybookNameService,
                        watchingService,
                        localeStore,
                        keywords,
                        messageService,
                        asyncAnalysisService, getMockLayoutStore());


        when(copybookNameService.copybookLocalFolders(null))
                .thenReturn(completedFuture(emptyList()));
        when(settingsService.fetchConfiguration(LOCALE.label))
                .thenReturn(completedFuture(singletonList("LOCALE")));
        when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
                .thenReturn(completedFuture(singletonList("INFO")));
        when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
                .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));
        when(watchingService.getWatchingFolders()).thenReturn(emptyList());
        when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

        didChangeConfigurationHandler.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));
        verify(watchingService).addWatchers(emptyList());
        verify(watchingService).removeWatchers(emptyList());
        verify(asyncAnalysisService).reanalyseOpenedPrograms();
    }

    /** Test no watchers added or removed when the path list not changed */
    @Test
    void testChangeConfigurationNoChangesInPaths() throws InterruptedException {
        DisposableLSPStateService stateService = new CobolLSPServerStateService();
        SettingsService settingsService = mock(SettingsService.class);
        WatcherService watchingService = mock(WatcherService.class);
        LocaleStore localeStore = mock(LocaleStore.class);
        CopybookNameService copybookNameService = mock(CopybookNameService.class);
        Keywords keywords = mock(Keywords.class);
        MessageService messageService = mock(MessageService.class);
        AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

        DidChangeConfigurationHandler didChangeConfigurationHandler =
                new DidChangeConfigurationHandler(
                        stateService,
                        settingsService,
                        copybookNameService,
                        watchingService,
                        localeStore,
                        keywords,
                        messageService,
                        asyncAnalysisService,
                        getMockLayoutStore());

        String path = "foo/bar";

        when(copybookNameService.copybookLocalFolders(null))
                .thenReturn(completedFuture(singletonList(path)));
        when(settingsService.fetchConfiguration(LOCALE.label))
                .thenReturn(completedFuture(singletonList("LOCALE")));
        when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
                .thenReturn(completedFuture(singletonList("INFO")));
        when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
                .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));
        when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
        when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

        didChangeConfigurationHandler.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));
        verify(watchingService).addWatchers(emptyList());
        verify(watchingService).removeWatchers(emptyList());
        verify(asyncAnalysisService).reanalyseOpenedPrograms();
        verify(localeStore).notifyLocaleStore();
    }

    /** Test a new watcher created when a new path add in setting.json */
    @Test
    void testChangeConfigurationNewPath() throws InterruptedException {
        DisposableLSPStateService stateService = new CobolLSPServerStateService();
        SettingsService settingsService = mock(SettingsServiceImpl.class);
        WatcherService watchingService = mock(WatcherService.class);
        LocaleStore localeStore = mock(LocaleStore.class);
        CopybookNameService copybookNameService = mock(CopybookNameService.class);
        Keywords keywords = mock(Keywords.class);
        MessageService messageService = mock(MessageService.class);
        AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

        DidChangeConfigurationHandler didChangeConfigurationHandler =
                new DidChangeConfigurationHandler(
                        stateService,
                        settingsService,
                        copybookNameService,
                        watchingService,
                        localeStore,
                        keywords,
                        messageService,
                        asyncAnalysisService,
                        getMockLayoutStore());

        ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
        String path = "foo/bar";

        when(copybookNameService.copybookLocalFolders(null))
                .thenReturn(completedFuture(singletonList(path)));
        when(settingsService.fetchConfiguration(LOCALE.label))
                .thenReturn(completedFuture(singletonList("LOCALE")));
        when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
                .thenReturn(completedFuture(singletonList("INFO")));
        when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
                .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));
        when(watchingService.getWatchingFolders()).thenReturn(emptyList());
        when(localeStore.notifyLocaleStore()).thenReturn(e -> {});

        didChangeConfigurationHandler.didChangeConfiguration(new DidChangeConfigurationParams(new Object()));

        verify(watchingService).addWatchers(watcherCaptor.capture());
        verify(watchingService).removeWatchers(emptyList());
        verify(asyncAnalysisService).reanalyseOpenedPrograms();
        verify(localeStore).notifyLocaleStore();

        assertEquals(path, watcherCaptor.getValue().get(0));
    }

    /** Test an existing watcher removed when its path doesn't exist in setting.json */
    @Test
    void testChangeConfigurationPathRemoved() throws InterruptedException {
        DisposableLSPStateService stateService = new CobolLSPServerStateService();
        SettingsService settingsService = mock(SettingsService.class);
        WatcherService watchingService = mock(WatcherService.class);
        LocaleStore localeStore = mock(LocaleStore.class);
        CopybookNameService copybookNameService = mock(CopybookNameService.class);
        Keywords keywords = mock(Keywords.class);
        MessageService messageService = mock(MessageService.class);
        AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);

        DidChangeConfigurationHandler didChangeConfigurationHandler =
                new DidChangeConfigurationHandler(
                        stateService,
                        settingsService,
                        copybookNameService,
                        watchingService,
                        localeStore,
                        keywords,
                        messageService,
                        asyncAnalysisService,
                        getMockLayoutStore());
        ArgumentCaptor<List<String>> watcherCaptor = forClass(List.class);
        JsonArray arr = new JsonArray();
        String path = "foo/bar";
        arr.add(new JsonPrimitive(path));

        CompletableFuture<List<String>> copybookFuture = completedFuture(emptyList());
        when(copybookNameService.copybookLocalFolders(null)).thenReturn(copybookFuture);
        when(settingsService.fetchConfiguration(LOCALE.label))
                .thenReturn(completedFuture(singletonList("LOCALE")));
        when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
                .thenReturn(completedFuture(singletonList("INFO")));
        when(watchingService.getWatchingFolders()).thenReturn(singletonList(path));
        when(localeStore.notifyLocaleStore()).thenReturn(e -> {});
        when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
                .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));

        didChangeConfigurationHandler.didChangeConfiguration(new DidChangeConfigurationParams(localeStore));
        verify(watchingService).addWatchers(emptyList());
        verify(watchingService).removeWatchers(watcherCaptor.capture());
        verify(asyncAnalysisService).reanalyseOpenedPrograms();
        assertEquals(path, watcherCaptor.getValue().get(0));
    }

    private CodeLayoutStore getMockLayoutStore() {
        CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
        when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
        when(layoutStore.updateCodeLayout()).thenReturn(mock -> {});
        return layoutStore;
    }
}
