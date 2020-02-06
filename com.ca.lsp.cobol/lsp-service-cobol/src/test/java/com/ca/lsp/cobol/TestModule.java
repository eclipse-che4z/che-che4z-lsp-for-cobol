/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.positive.ZipTextRegistry;
import com.ca.lsp.cobol.service.CobolWorkspaceServiceImpl;
import com.ca.lsp.cobol.service.FileSystemService;
import com.ca.lsp.cobol.service.FileSystemServiceImpl;
import com.ca.lsp.cobol.service.MyTextDocumentService;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.communications.ServerCommunications;
import com.ca.lsp.cobol.service.delegates.completions.*;
import com.ca.lsp.cobol.service.delegates.formations.Formation;
import com.ca.lsp.cobol.service.delegates.formations.Formations;
import com.ca.lsp.cobol.service.delegates.formations.TrimFormation;
import com.ca.lsp.cobol.service.delegates.references.*;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.ca.lsp.cobol.service.mocks.MockFileSystemService;
import com.ca.lsp.cobol.service.mocks.MockFileSystemServiceImpl;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.ca.lsp.cobol.service.mocks.TestLanguageServer;
import com.google.inject.multibindings.Multibinder;
import com.google.inject.name.Names;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import java.util.Optional;

public class TestModule extends DefaultModule {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";

  @Override
  protected void configure() {
    super.configure();
    bind(LanguageClient.class).to(TestLanguageClient.class);
    bind(LanguageServer.class).to(TestLanguageServer.class);
    bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    // TODO: Do we need a mock for worspaceservice impl?
    bind(WorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    bind(FileSystemService.class).to(FileSystemServiceImpl.class);
    bind(MockFileSystemService.class).to(MockFileSystemServiceImpl.class);

    bind(Communications.class).to(ServerCommunications.class);
    bind(TextDocumentService.class).to(MyTextDocumentService.class);
    bind(CobolTextRegistry.class).to(ZipTextRegistry.class);
    bind(String.class)
        .annotatedWith(Names.named(PATH_TO_TEST_RESOURCES))
        .toProvider(
            () -> Optional.ofNullable(System.getProperty(PATH_TO_TEST_RESOURCES)).orElse(""));

    bindFormations();
    bindCompletions();
    bindReferences();
  }

  private void bindFormations() {
    bind(Formations.class);
    Multibinder<Formation> formationBinding = Multibinder.newSetBinder(binder(), Formation.class);
    formationBinding.addBinding().to(TrimFormation.class);
  }

  private void bindCompletions() {
    bind(Completions.class);
    Multibinder<Completion> completionBinding =
        Multibinder.newSetBinder(binder(), Completion.class);
    completionBinding.addBinding().to(VariableCompletion.class);
    completionBinding.addBinding().to(ParagraphCompletion.class);
    completionBinding.addBinding().to(SnippetCompletion.class);
    completionBinding.addBinding().to(KeywordCompletion.class);

    bind(CompletionStorage.class).annotatedWith(Names.named("Keywords")).to(Keywords.class);
    bind(CompletionStorage.class).annotatedWith(Names.named("Snippets")).to(Snippets.class);
  }

  private void bindReferences() {
    bind(Occurrences.class).to(SemanticElementOccurrences.class);
    Multibinder<SemanticLocations> referenceBinding =
        Multibinder.newSetBinder(binder(), SemanticLocations.class);
    referenceBinding.addBinding().to(VariableLocations.class);
    referenceBinding.addBinding().to(ParagraphLocations.class);
  }
}
