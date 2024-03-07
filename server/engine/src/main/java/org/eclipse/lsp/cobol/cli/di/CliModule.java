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

package org.eclipse.lsp.cobol.cli.di;

import com.google.inject.AbstractModule;
import com.google.inject.assistedinject.FactoryModuleBuilder;
import com.google.inject.multibindings.Multibinder;
import com.google.inject.name.Names;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.cfg.CFASTBuilderImpl;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkServiceImpl;
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
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListenerFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacePreprocessorFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingServiceImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.eclipse.lsp.cobol.core.visitor.InterruptingTreeListener;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.CobolLSPServerStateService;
import org.eclipse.lsp.cobol.service.SubroutineServiceImpl;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.WatcherServiceImpl;
import org.eclipse.lsp.cobol.service.copybooks.*;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.actions.FindCopybookCommand;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.eclipse.lsp.cobol.service.delegates.completions.*;
import org.eclipse.lsp.cobol.service.delegates.formations.Formation;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.formations.TrimFormation;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.service.delegates.references.ElementOccurrences;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.delegates.validations.CobolLanguageEngineFacade;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp.cobol.service.settings.SettingsServiceImpl;

import static com.google.inject.multibindings.Multibinder.newSetBinder;
import static com.google.inject.name.Names.named;

/** This module provides DI bindings for COBOL language engine part. */
public class CliModule extends AbstractModule {
  @Override
  protected void configure() {
    bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
    bind(GrammarPreprocessor.class).to(GrammarPreprocessorImpl.class);
    install(new FactoryModuleBuilder().build(GrammarPreprocessorListenerFactory.class));
    install(new FactoryModuleBuilder().build(ReplacePreprocessorFactory.class));
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);
    bind(CobolLineReader.class).to(CobolLineReaderImpl.class);
    bind(CobolLineWriter.class).to(CobolLineWriterImpl.class);
    bind(CobolLinesTransformation.class).to(ContinuationLineTransformation.class);
    bind(CobolLineReWriter.class).to(CobolLineIndicatorProcessorImpl.class);
    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(ConfigurationService.class).to(CachingConfigurationService.class);
    bind(CopybookNameService.class).to(CopybookNameServiceImpl.class);
    bind(ParseTreeListener.class).to(InterruptingTreeListener.class);
    bind(String.class)
        .annotatedWith(named("resourceFileLocation"))
        .toInstance("resourceBundles/messages");

    bind(DisposableLSPStateService.class).to(CobolLSPServerStateService.class);
    bind(CopybookService.class).to(CopybookServiceImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(CobolLanguageClient.class).toProvider(CliClientProvider.class);
    bind(SettingsService.class).to(SettingsServiceImpl.class);
    bind(WatcherService.class).to(WatcherServiceImpl.class);
    bind(BenchmarkService.class).to(BenchmarkServiceImpl.class);
    bind(LanguageEngineFacade.class).to(CobolLanguageEngineFacade.class);
    bind(FileSystemService.class).toInstance(new WorkspaceFileService());
    bind(SubroutineService.class).to(SubroutineServiceImpl.class);
    bind(Occurrences.class).to(ElementOccurrences.class);
    bind(HoverProvider.class).to(VariableHover.class);
    bind(CFASTBuilder.class).to(CFASTBuilderImpl.class);
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

    bindConstant().annotatedWith(Names.named("CACHE-MAX-SIZE")).to(1500);
    bindConstant().annotatedWith(Names.named("CACHE-DURATION")).to(3);
    bindConstant().annotatedWith(Names.named("CACHE-TIME-UNIT")).to("HOURS");
    bindConstant().annotatedWith(Names.named("CORE-POOL-SIZE")).to(4);
    bindConstant().annotatedWith(Names.named("MAX-POOL-SIZE")).to(10);
    bindConstant().annotatedWith(Names.named("KEEP-ALIVE-TIME-IN-SECONDS")).to(60);
    bindConstant().annotatedWith(Names.named("CORE-POOL-SIZE-FOR-SCHEDULED-POOL")).to(5);


    bindFormations();
    bindCompletions();
    bindCodeActions();
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
    completionBinding.addBinding().to(SubroutineCompletion.class);
    completionBinding.addBinding().to(CopybookNameCompletion.class);

    bind(CompletionStorage.class).annotatedWith(named("Keywords")).to(Keywords.class);
  }

  private void bindCodeActions() {
    bind(CodeActions.class);
    Multibinder<CodeActionProvider> codeActionBinding =
            newSetBinder(binder(), CodeActionProvider.class);
    codeActionBinding.addBinding().to(FindCopybookCommand.class);
  }
}
