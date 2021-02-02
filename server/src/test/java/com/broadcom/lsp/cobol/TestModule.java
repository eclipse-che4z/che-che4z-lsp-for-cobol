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
package com.broadcom.lsp.cobol;

import com.broadcom.lsp.cobol.core.annotation.*;
import com.broadcom.lsp.cobol.core.messages.LocaleStore;
import com.broadcom.lsp.cobol.core.messages.LocaleStoreImpl;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.messages.PropertiesMessageService;
import com.broadcom.lsp.cobol.jrpc.CobolLanguageClient;
import com.broadcom.lsp.cobol.service.*;
import com.broadcom.lsp.cobol.service.delegates.actions.CodeActionProvider;
import com.broadcom.lsp.cobol.service.delegates.actions.CodeActions;
import com.broadcom.lsp.cobol.service.delegates.actions.FindCopybookCommand;
import com.broadcom.lsp.cobol.service.delegates.communications.Communications;
import com.broadcom.lsp.cobol.service.delegates.communications.ServerCommunications;
import com.broadcom.lsp.cobol.service.delegates.completions.*;
import com.broadcom.lsp.cobol.service.delegates.formations.Formation;
import com.broadcom.lsp.cobol.service.delegates.formations.Formations;
import com.broadcom.lsp.cobol.service.delegates.formations.TrimFormation;
import com.broadcom.lsp.cobol.service.delegates.references.*;
import com.broadcom.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.broadcom.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageClient;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageServer;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import com.broadcom.lsp.cobol.service.utils.FileSystemService;
import com.broadcom.lsp.cobol.service.utils.WorkspaceFileService;
import com.google.inject.AbstractModule;
import com.google.inject.matcher.Matchers;
import com.google.inject.multibindings.Multibinder;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import static com.google.inject.multibindings.Multibinder.newSetBinder;
import static com.google.inject.name.Names.named;
import static java.lang.System.getProperty;
import static java.util.Optional.ofNullable;

/** This module provides DI bindings for testing. */
public class TestModule extends AbstractModule {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";

  @Override
  protected void configure() {
    bind(CustomThreadPoolExecutor.class).to(CustomThreadPoolExecutorService.class);
    bind(CobolLanguageClient.class).to(TestLanguageClient.class);
    bind(LanguageServer.class).to(TestLanguageServer.class);
    bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    bind(WorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    bind(CopybookService.class).to(CopybookServiceImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(TextDocumentService.class).to(CobolTextDocumentService.class);
    bind(WatcherService.class).to(WatcherServiceImpl.class);
    bind(FileSystemService.class).to(WorkspaceFileService.class);
    bind(String.class)
        .annotatedWith(named(PATH_TO_TEST_RESOURCES))
        .toProvider(() -> ofNullable(getProperty(PATH_TO_TEST_RESOURCES)).orElse(""));
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(String.class)
        .annotatedWith(named("resourceFileLocation"))
        .toInstance("resourceBundles/messages");

    bind(SettingsService.class).to(SettingsServiceImpl.class);
    bind(SubroutineService.class).to(SubroutineServiceImpl.class);
    bind(Occurrences.class).to(ElementOccurrences.class);

    bindFormations();
    bindCompletions();
    bindCodeActions();

    bindInterceptor(
        Matchers.subclassesOf(ThreadInterruptAspect.class),
        Matchers.annotatedWith(CheckThreadInterruption.class),
        new HandleThreadInterruption());

    HandleShutdownState handleShutdownState = new HandleShutdownState();
    requestInjection(handleShutdownState);
    bindInterceptor(
        Matchers.subclassesOf(DisposableService.class),
            (new NonSyntheticMethodMatcher()).and(Matchers.annotatedWith(CheckServerShutdownState.class)),
        handleShutdownState);
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
    completionBinding.addBinding().to(SnippetCompletion.class);
    completionBinding.addBinding().to(KeywordCompletion.class);
    completionBinding.addBinding().to(CopybookCompletion.class);

    bind(CompletionStorage.class).annotatedWith(named("Keywords")).to(Keywords.class);
    bind(CompletionStorage.class).annotatedWith(named("Snippets")).to(Snippets.class);
  }

  private void bindCodeActions() {
    bind(CodeActions.class);
    Multibinder<CodeActionProvider> codeActionBinding =
        newSetBinder(binder(), CodeActionProvider.class);
    codeActionBinding.addBinding().to(FindCopybookCommand.class);
  }
}
