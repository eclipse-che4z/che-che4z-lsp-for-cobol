/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.domain.modules;

import com.google.inject.AbstractModule;
import com.google.inject.Provides;
import com.google.inject.name.Named;
import org.eclipse.lsp.cobol.core.annotation.CheckThreadInterruption;
import org.eclipse.lsp.cobol.core.annotation.ProxyUtil;
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.service.*;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

/**
 * Provide CGLIB proxy guice binding for classes to handle {@link CheckThreadInterruption} and
 * {@link org.eclipse.lsp.cobol.core.annotation.CheckServerShutdownState} annotation.
 */
public abstract class ProxyServiceProviders extends AbstractModule {
  /**
   * Provides binding for {@link CopybookService}
   *
   * @param dataBus
   * @param settingsService
   * @param files
   * @param cacheSize
   * @param duration
   * @param timeUnitName
   * @return CopybookService
   */
  @Provides
  public CopybookService getCopybookService(
      DataBusBroker dataBus,
      SettingsService settingsService,
      FileSystemService files,
      @Named("CACHE-MAX-SIZE") int cacheSize,
      @Named("CACHE-DURATION") int duration,
      @Named("CACHE-TIME-UNIT") String timeUnitName) {

    return ProxyUtil.getThreadInterruptionProxyObject(
        CopybookServiceImpl.class,
        new Class[] {
          DataBusBroker.class,
          SettingsService.class,
          FileSystemService.class,
          Integer.TYPE,
          Integer.TYPE,
          String.class
        },
        new Object[] {dataBus, settingsService, files, cacheSize, duration, timeUnitName});
  }

  /**
   * Provides binding for {@link TextDocumentService}. This is a CGLIB proxy instance.
   *
   * @param communications
   * @param engine
   * @param formations
   * @param completions
   * @param occurrences
   * @param dataBus
   * @param actions
   * @param executors
   * @param hoverProvider
   * @param cfastBuilder
   * @param server
   * @return TextDocumentService
   */
  @Provides
  public TextDocumentService getTextDocumentService(
      Communications communications,
      LanguageEngineFacade engine,
      Formations formations,
      Completions completions,
      Occurrences occurrences,
      DataBusBroker dataBus,
      CodeActions actions,
      CustomThreadPoolExecutor executors,
      HoverProvider hoverProvider,
      CFASTBuilder cfastBuilder,
      LanguageServer server) {
    return ProxyUtil.getShutDownProxyObject(
        CobolTextDocumentService.class,
        server,
        new Class[] {
          Communications.class,
          LanguageEngineFacade.class,
          Formations.class,
          Completions.class,
          Occurrences.class,
          DataBusBroker.class,
          CodeActions.class,
          CustomThreadPoolExecutor.class,
          HoverProvider.class,
          CFASTBuilder.class
        },
        new Object[] {
          communications,
          engine,
          formations,
          completions,
          occurrences,
          dataBus,
          actions,
          executors,
          hoverProvider,
          cfastBuilder
        });
  }

  /**
   * Provides binding for {@link WorkspaceService}. This is a CGLIB proxy instance.
   *
   * @param dataBus
   * @param settingsService
   * @param watchingService
   * @param copybookService
   * @param localeStore
   * @param subroutineService
   * @param server
   * @return WorkspaceService
   */
  @Provides
  public WorkspaceService getWorkspaceService(
      DataBusBroker dataBus,
      SettingsService settingsService,
      WatcherService watchingService,
      CopybookService copybookService,
      LocaleStore localeStore,
      SubroutineService subroutineService,
      LanguageServer server) {

    return ProxyUtil.getShutDownProxyObject(
        CobolWorkspaceServiceImpl.class,
        server,
        new Class[] {
          DataBusBroker.class,
          SettingsService.class,
          WatcherService.class,
          CopybookService.class,
          LocaleStore.class,
          SubroutineService.class
        },
        new Object[] {
          dataBus, settingsService, watchingService, copybookService, localeStore, subroutineService
        });
  }
}
