/*
 * Copyright (c) 2019 Broadcom.
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
package com.broadcom.lsp.cdi.module.service;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.ca.lsp.cobol.service.*;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.communications.ServerCommunications;
import com.ca.lsp.cobol.service.delegates.completions.*;
import com.ca.lsp.cobol.service.delegates.formations.Formation;
import com.ca.lsp.cobol.service.delegates.formations.Formations;
import com.ca.lsp.cobol.service.delegates.formations.TrimFormation;
import com.ca.lsp.cobol.service.delegates.references.*;
import com.ca.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.google.inject.multibindings.Multibinder;
import com.google.inject.name.Names;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

/** This module provides DI bindings for service part. */
@Slf4j
public class ServiceModule extends DefaultModule {
  @Override
  protected void configure() {
    super.configure();
    bind(LanguageServer.class).to(MyLanguageServerImpl.class);
    bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    bind(WorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    bind(CobolWorkspaceService.class).to(CobolWorkspaceServiceImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(TextDocumentService.class).to(MyTextDocumentService.class);
    bind(LanguageClient.class).toProvider(ClientProvider.class);
    bind(CobolLanguageEngine.class);
    bind(CobolSourceFormat.class).toInstance(CobolSourceFormat.FIXED);

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
