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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.verify;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.InitializedParams;
import org.junit.jupiter.api.Test;

/** Tests {@link InitializedHandler} */
class InitializedHandlerTest {

  @Test
  void test() {
    SettingsService settingsService = mock(SettingsServiceImpl.class);
    WatcherService watchingService = mock(WatcherService.class);
    LocaleStore localeStore = mock(LocaleStore.class);
    CopybookNameService copybookNameService = mock(CopybookNameService.class);
    MessageService messageService = mock(MessageService.class);
    Keywords keywords = mock(Keywords.class);

    DialectService dialectService = mock(DialectService.class);
    when(dialectService.getWatchingFolderSettings()).thenReturn(ImmutableList.of("dialect"));

    when(settingsService.fetchTextConfiguration(anyString())).thenCallRealMethod();
    prepareSettingsService(settingsService, localeStore);

    CodeLayoutStore codeLayoutStore = mock(CodeLayoutStore.class);
    when(codeLayoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
    when(codeLayoutStore.updateCodeLayout()).thenReturn(mock -> {});

    InitializedHandler initializedHandler =
        new InitializedHandler(
            watchingService,
            copybookNameService,
            keywords,
            settingsService,
            localeStore,
            mock(AnalysisService.class),
            messageService, codeLayoutStore);
    initializedHandler.initialized(new InitializedParams());
    verify(watchingService).watchConfigurationChange();
    verify(settingsService).fetchConfiguration(LOCALE.label);
    verify(settingsService).fetchConfiguration(LOGGING_LEVEL.label);
    verify(settingsService).fetchConfiguration(CPY_EXTENSIONS.label);
    verify(localeStore).notifyLocaleStore();
  }

  private void prepareSettingsService(SettingsService settingsService, LocaleStore localeStore) {
    JsonArray arr = new JsonArray();
    String path = "foo/bar";
    arr.add(new JsonPrimitive(path));

    when(settingsService.fetchConfiguration(CPY_LOCAL_PATHS.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(localeStore.notifyLocaleStore()).thenReturn(System.out::println);
    when(settingsService.fetchConfiguration(LOCALE.label))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(SUBROUTINE_LOCAL_PATHS.label))
        .thenReturn(completedFuture(ImmutableList.of()));
    when(settingsService.fetchConfiguration(LOGGING_LEVEL.label))
        .thenReturn(completedFuture(ImmutableList.of("INFO")));
    when(settingsService.fetchConfiguration(CPY_EXTENSIONS.label))
        .thenReturn(completedFuture(ImmutableList.of("cpy")));
    when(settingsService.fetchConfiguration("dialect"))
        .thenReturn(completedFuture(singletonList(arr)));
    when(settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label))
        .thenReturn(completedFuture(ImmutableList.of(new CobolProgramLayout())));
  }
}
