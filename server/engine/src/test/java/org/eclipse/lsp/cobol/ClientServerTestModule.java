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
package org.eclipse.lsp.cobol;

import static com.google.inject.multibindings.Multibinder.newSetBinder;
import static com.google.inject.name.Names.named;
import static java.lang.System.getProperty;
import static java.util.Optional.ofNullable;

import com.google.inject.AbstractModule;
import com.google.inject.multibindings.Multibinder;
import com.google.inject.name.Names;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.cfg.CFASTBuilderImpl;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectDiscoveryFolderService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectDiscoveryService;
import org.eclipse.lsp.cobol.core.messages.LocaleStoreImpl;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.lsp.CobolWorkspaceServiceImpl;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.*;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationBasedOnExtension;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationCombinedStrategy;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationServiceBasedOnContent;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameServiceImpl;
import org.eclipse.lsp.cobol.service.copybooks.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.actions.FindCopybookCommand;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.eclipse.lsp.cobol.service.delegates.completions.*;
import org.eclipse.lsp.cobol.service.delegates.formations.Formation;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.formations.TrimFormation;
import org.eclipse.lsp.cobol.service.delegates.hover.CopybookHoverProvider;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.service.delegates.references.ElementOccurrences;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.mocks.MockLanguageClient;
import org.eclipse.lsp.cobol.service.mocks.MockLanguageServer;
import org.eclipse.lsp.cobol.service.mocks.MockTextPreprocessor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.WorkspaceService;

/** This module provides DI bindings for testing. */
public class ClientServerTestModule extends AbstractModule {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";
  private static final String RESOURCE_FILE_LOCATION = "resourceFileLocation";
  private static final String RESOURCE_BUNDLE_MESSAGE = "resourceBundles/messages";


  @Override
  protected void configure() {
    bind(CobolLanguageClient.class).to(MockLanguageClient.class);
    bind(LanguageServer.class).to(MockLanguageServer.class);
    bind(DisposableLSPStateService.class).to(CobolLSPServerStateService.class);
    bind(WorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    bind(CopybookService.class).to(CopybookServiceImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(WatcherService.class).to(WatcherServiceImpl.class);
    bind(FileSystemService.class).to(WorkspaceFileService.class);
    bind(CopybookNameService.class).to(CopybookNameServiceImpl.class);
    bind(ConfigurationService.class).to(CachingConfigurationService.class);
    bind(String.class)
        .annotatedWith(named(PATH_TO_TEST_RESOURCES))
        .toProvider(() -> ofNullable(getProperty(PATH_TO_TEST_RESOURCES)).orElse(""));
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(String.class)
        .annotatedWith(named(RESOURCE_FILE_LOCATION))
        .toInstance(RESOURCE_BUNDLE_MESSAGE);

    bind(SettingsService.class).to(SettingsServiceImpl.class);
    bind(SubroutineService.class).to(SubroutineServiceImpl.class);
    bind(Occurrences.class).to(ElementOccurrences.class);
    bind(CFASTBuilder.class).to(CFASTBuilderImpl.class);
    bind(TextPreprocessor.class).to(MockTextPreprocessor.class);
    bind(CopybookIdentificationService.class)
            .annotatedWith(Names.named("contentStrategy"))
            .to(CopybookIdentificationServiceBasedOnContent.class);
    bind(CopybookIdentificationService.class)
            .annotatedWith(Names.named("suffixStrategy"))
            .to(CopybookIdentificationBasedOnExtension.class);
    bind(CopybookIdentificationService.class)
            .annotatedWith(Names.named("combinedStrategy"))
            .to(CopybookIdentificationCombinedStrategy.class);
    bind(DialectDiscoveryService.class).to(DialectDiscoveryFolderService.class);

    bindHoverActions();
    bindFormations();
    bindCompletions();
    bindCodeActions();
  }

  private void bindHoverActions() {
    Multibinder<HoverProvider> hoverProviderMultibinder = newSetBinder(binder(), HoverProvider.class);
    hoverProviderMultibinder.addBinding().to(VariableHover.class);
    hoverProviderMultibinder.addBinding().to(CopybookHoverProvider.class);
  }

  private void bindFormations() {
    bind(Formations.class);
    Multibinder<Formation> formationBinding = newSetBinder(binder(), Formation.class);
    formationBinding.addBinding().to(TrimFormation.class);
  }

  private void bindCompletions() {
    bind(Completions.class);
    Multibinder<Completion> completionBinding = newSetBinder(binder(), Completion.class);
    completionBinding.addBinding().to(VariableCompletion.class);
    completionBinding.addBinding().to(ParagraphCompletion.class);
    completionBinding.addBinding().to(SectionCompletion.class);
    completionBinding.addBinding().to(KeywordCompletion.class);
    completionBinding.addBinding().to(CopybookCompletion.class);

    bind(CompletionStorage.class).annotatedWith(named("Keywords")).to(Keywords.class);
  }

  private void bindCodeActions() {
    bind(CodeActions.class);
    Multibinder<CodeActionProvider> codeActionBinding =
        newSetBinder(binder(), CodeActionProvider.class);
    codeActionBinding.addBinding().to(FindCopybookCommand.class);
  }
}
