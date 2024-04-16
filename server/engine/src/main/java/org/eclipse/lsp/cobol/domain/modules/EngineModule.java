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

package org.eclipse.lsp.cobol.domain.modules;

import static com.google.inject.name.Names.named;

import com.google.inject.AbstractModule;
import com.google.inject.assistedinject.FactoryModuleBuilder;
import com.google.inject.name.Names;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkServiceImpl;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.messages.LocaleStoreImpl;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.dialects.hp.HpTextPreprocessor;
import org.eclipse.lsp.cobol.dialects.ibm.IbmTextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListenerFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.HPCobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacePreprocessorFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingServiceImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.HpCobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.HPContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.HPCobolLineWriterImpl;
import org.eclipse.lsp.cobol.core.visitor.InterruptingTreeListener;
import org.eclipse.lsp.cobol.lsp.CobolWorkspaceServiceImpl;
import org.eclipse.lsp.cobol.lsp.LspEventConsumer;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameServiceImpl;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;

/** This module provides DI bindings for COBOL language engine part. */
public class EngineModule extends AbstractModule {
  @Override
  protected void configure() {
    bind(CobolLanguageEngine.class);
    bind(BenchmarkService.class).to(BenchmarkServiceImpl.class);
    bind(CleanerPreprocessor.class).annotatedWith(Names.named("cobol")).to(IbmTextPreprocessor.class);
    bind(CleanerPreprocessor.class).annotatedWith(Names.named("hpcobol")).to(HpTextPreprocessor.class);

    bind(GrammarPreprocessor.class).to(GrammarPreprocessorImpl.class);
    install(new FactoryModuleBuilder().build(GrammarPreprocessorListenerFactory.class));
    install(new FactoryModuleBuilder().build(ReplacePreprocessorFactory.class));
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);

    bind(CobolLineReader.class).annotatedWith(Names.named("hpcobol")).to(HPCobolLineReaderImpl.class);
    bind(CobolLineReader.class).annotatedWith(Names.named("cobol")).to(CobolLineReaderImpl.class);

    bind(CobolLineWriter.class).annotatedWith(Names.named("cobol")).to(CobolLineWriterImpl.class);
    bind(CobolLineWriter.class).annotatedWith(Names.named("hpcobol")).to(HPCobolLineWriterImpl.class);

    bind(CobolLinesTransformation.class).annotatedWith(Names.named("hpcobol")).to(HPContinuationLineTransformation.class);
    bind(CobolLinesTransformation.class).annotatedWith(Names.named("cobol")).to(CobolContinuationLineTransformation.class);

    bind(CobolLineReWriter.class).annotatedWith(Names.named("cobol")).to(CobolLineIndicatorProcessorImpl.class);
    bind(CobolLineReWriter.class).annotatedWith(Names.named("hpcobol")).to(HpCobolLineIndicatorProcessorImpl.class);

    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(ParseTreeListener.class).to(InterruptingTreeListener.class);
    bind(ConfigurationService.class).to(CachingConfigurationService.class);
    bind(CopybookNameService.class).to(CopybookNameServiceImpl.class);
    bind(LspEventConsumer.class).to(CobolWorkspaceServiceImpl.class);

    bind(String.class)
        .annotatedWith(named("resourceFileLocation"))
        .toInstance("resourceBundles/messages");
  }
}
