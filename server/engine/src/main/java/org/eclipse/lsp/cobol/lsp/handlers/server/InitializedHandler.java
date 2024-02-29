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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;

import com.google.inject.Inject;
import javax.annotation.Nullable;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.utils.LogLevelUtils;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.InitializedParams;

/**
 * LSP Initialized Handler
 */
public class InitializedHandler {
  private final WatcherService watchingService;
  private final CopybookNameService copybookNameService;
  private final Keywords keywords;
  private final SettingsService settingsService;
  private final LocaleStore localeStore;
  private final CodeLayoutStore codeLayoutStore;
  private final AnalysisService analysisService;
  private final MessageService messageService;

  @Inject
  public InitializedHandler(WatcherService watchingService,
                            CopybookNameService copybookNameService,
                            Keywords keywords,
                            SettingsService settingsService,
                            LocaleStore localeStore,
                            AnalysisService analysisService,
                            MessageService messageService,
                            CodeLayoutStore codeLayoutStore) {
    this.watchingService = watchingService;
    this.copybookNameService = copybookNameService;
    this.keywords = keywords;
    this.settingsService = settingsService;
    this.localeStore = localeStore;
    this.analysisService = analysisService;
    this.messageService = messageService;
    this.codeLayoutStore = codeLayoutStore;
  }

  /**
   * Handle LSP initialized request.
   * @param params InitializedParams.
   */
  public void initialized(@Nullable InitializedParams params) {
    watchingService.watchConfigurationChange();
    getLocaleFromClient();
    getLogLevelFromClient();
    getCobolProgramLayout();
    copybookNameService.collectLocalCopybookNames();
    keywords.updateStorage();
    messageService.reloadMessages();
    notifyConfiguredCopybookExtensions();
  }

  private void getCobolProgramLayout() {
    settingsService.fetchConfiguration(COBOL_PROGRAM_LAYOUT.label).thenAccept(codeLayoutStore.updateCodeLayout());
  }

  private void getLocaleFromClient() {
    settingsService.fetchConfiguration(LOCALE.label).thenAccept(localeStore.notifyLocaleStore());
  }

  private void notifyConfiguredCopybookExtensions() {
    settingsService
            .fetchTextConfiguration(CPY_EXTENSIONS.label)
            .thenAccept(analysisService::setExtensionConfig);
  }

  private void getLogLevelFromClient() {
    settingsService
            .fetchConfiguration(LOGGING_LEVEL.label)
            .thenAccept(LogLevelUtils.updateLogLevel());
  }
}
