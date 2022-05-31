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

import com.google.inject.AbstractModule;
import com.google.inject.assistedinject.FactoryModuleBuilder;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.core.messages.LocaleStoreImpl;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.messages.PropertiesMessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListenerFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacePreprocessorFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingServiceImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.eclipse.lsp.cobol.core.visitor.InterruptingTreeListener;
import org.eclipse.lsp.cobol.service.ConfigurationService;
import org.eclipse.lsp.cobol.service.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutorService;

import static com.google.inject.name.Names.named;

/** This module provides DI bindings for COBOL language engine part. */
public class EngineModule extends AbstractModule {
  @Override
  protected void configure() {
    bind(CustomThreadPoolExecutor.class).to(CustomThreadPoolExecutorService.class);
    bind(CobolLanguageEngine.class);
    bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
    bind(GrammarPreprocessor.class).to(GrammarPreprocessorImpl.class);
    install(new FactoryModuleBuilder().build(GrammarPreprocessorListenerFactory.class));
    install(new FactoryModuleBuilder().build(ReplacePreprocessorFactory.class));
    bind(InjectCodeAnalysisFactory.class);
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);
    bind(CobolLineReader.class).to(CobolLineReaderImpl.class);
    bind(CobolLineWriter.class).to(CobolLineWriterImpl.class);
    bind(CobolLinesTransformation.class).to(ContinuationLineTransformation.class);
    bind(CobolLineReWriter.class).to(CobolLineIndicatorProcessorImpl.class);
    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(ParseTreeListener.class).to(InterruptingTreeListener.class);
    bind(ConfigurationService.class).to(CachingConfigurationService.class);
    bind(String.class)
        .annotatedWith(named("resourceFileLocation"))
        .toInstance("resourceBundles/messages");
  }
}
