/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.daco.utils;

import static com.google.inject.multibindings.Multibinder.newSetBinder;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.auto.service.AutoService;
import com.google.common.collect.ImmutableList;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.multibindings.Multibinder;
import com.google.inject.name.Names;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectDiscoveryService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.CobolLSPServerStateService;
import org.eclipse.lsp.cobol.service.SubroutineServiceImpl;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.WatcherServiceImpl;
import org.eclipse.lsp.cobol.service.copybooks.*;
import org.eclipse.lsp.cobol.service.delegates.actions.FindCopybookCommand;
import org.eclipse.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.test.UseCaseInitializer;

/**
 * Initializer for use case engine
 */
@AutoService(UseCaseInitializer.class)
public class UseCaseInitializerService implements UseCaseInitializer {

  /**
   * Creates injector for testing purposes
   * @return injector object
   */
  @Override
  public Injector createInjector() {
    CobolLanguageClient languageClient = mock(CobolLanguageClient.class);
    SettingsService mockSettingsService = mock(SettingsService.class);
    when(mockSettingsService.fetchConfiguration(any()))
        .thenReturn(CompletableFuture.completedFuture(ImmutableList.of()));

    return
        Guice.createInjector(
            new EngineModule(),
            new DatabusModule(),
            new AbstractModule() {
              @Override
              protected void configure() {
                bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
                bind(CopybookService.class).to(CopybookServiceImpl.class);
                bind(SettingsService.class).toInstance(mockSettingsService);
                bind(FileSystemService.class).toInstance(new WorkspaceFileService());
                bind(CobolLanguageClient.class).toInstance(languageClient);
                bind(SubroutineService.class).to(SubroutineServiceImpl.class);
                bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
                bind(CleanerPreprocessor.class).to(TextPreprocessorImpl.class);
                bind(WatcherService.class).to(WatcherServiceImpl.class);
                bind(DialectDiscoveryService.class).to(ExplicitDialectDiscoveryService.class);
                bind(CopybookIdentificationService.class)
                        .annotatedWith(Names.named("contentStrategy"))
                        .to(CopybookIdentificationServiceBasedOnContent.class);
                bind(CopybookIdentificationService.class)
                        .annotatedWith(Names.named("suffixStrategy"))
                        .to(CopybookIdentificationBasedOnExtension.class);
                bind(CopybookIdentificationService.class)
                        .annotatedWith(Names.named("combinedStrategy"))
                        .to(CopybookIdentificationCombinedStrategy.class);
                Multibinder<CodeActionProvider> codeActionBinding =
                        newSetBinder(binder(), CodeActionProvider.class);
                codeActionBinding.addBinding().to(FindCopybookCommand.class);
                bind(DisposableLSPStateService.class).to(CobolLSPServerStateService.class);
              }
            });
  }
}
