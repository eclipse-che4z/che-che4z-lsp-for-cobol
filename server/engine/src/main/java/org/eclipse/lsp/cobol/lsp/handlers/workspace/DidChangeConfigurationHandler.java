/*
 * Copyright (c) 2023 Broadcom.
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

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;

import com.google.inject.Inject;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.utils.LogLevelUtils;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.DidChangeConfigurationParams;

/**
 * LSP DidChangeConfiguration Handler
 */
@Slf4j
public class DidChangeConfigurationHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final SettingsService settingsService;
  private final CopybookNameService copybookNameService;
  private final WatcherService watchingService;
  private final LocaleStore localeStore;
  private final Keywords keywords;
  private final MessageService messageService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final CodeLayoutStore codeLayoutStore;

  @Inject
  public DidChangeConfigurationHandler(DisposableLSPStateService disposableLSPStateService,
                                       SettingsService settingsService,
                                       CopybookNameService copybookNameService,
                                       WatcherService watchingService,
                                       LocaleStore localeStore,
                                       Keywords keywords,
                                       MessageService messageService,
                                       AsyncAnalysisService asyncAnalysisService,
                                       CodeLayoutStore codeLayoutStore) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.settingsService = settingsService;
    this.copybookNameService = copybookNameService;
    this.watchingService = watchingService;
    this.localeStore = localeStore;
    this.keywords = keywords;
    this.messageService = messageService;
    this.asyncAnalysisService = asyncAnalysisService;
    this.codeLayoutStore = codeLayoutStore;
  }

  /**
   * Handle didChangeConfiguration LSP event.
   * @param params DidChangeConfigurationParams
   */
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    if (disposableLSPStateService.isServerShutdown()) {
      return;
    }

    messageService.reloadMessages();
    copybookNameService
        .copybookLocalFolders(null)
        .thenAccept(
            localFolders -> {
              try {
                acceptSettingsChange(localFolders);
              } catch (InterruptedException e) {
                LOG.error("InterruptedException while accepting settings changes");
                Thread.currentThread().interrupt();
              }
            });

    settingsService.fetchConfiguration(LOCALE.label).thenAccept(localeStore.notifyLocaleStore());
    settingsService.fetchConfiguration(LOGGING_LEVEL.label).thenAccept(LogLevelUtils.updateLogLevel());
    settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label).thenAccept(codeLayoutStore.updateCodeLayout());
    copybookNameService.collectLocalCopybookNames();
    keywords.updateStorage();
  }

  private void acceptSettingsChange(List<String> localFolders) throws InterruptedException {
    List<String> watchingFolders = watchingService.getWatchingFolders();

    updateWatchers(localFolders, watchingFolders);
    asyncAnalysisService.reanalyseOpenedPrograms();
  }

  private void updateWatchers(List<String> newPaths, List<String> existingPaths) {
    watchingService.addWatchers(
            newPaths.stream().filter(it -> !existingPaths.contains(it)).collect(toList()));

    watchingService.removeWatchers(
            existingPaths.stream().filter(it -> !newPaths.contains(it)).collect(toList()));
  }
}

