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

package com.broadcom.lsp.cobol.domain.modules;

import com.broadcom.lsp.cobol.core.engine.CobolLanguageEngine;
import com.broadcom.lsp.cobol.core.messages.LocaleStore;
import com.broadcom.lsp.cobol.core.messages.LocaleStoreImpl;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.messages.PropertiesMessageService;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerFactory;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderDelegate;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CompilerDirectivesTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolCommentEntriesMarkerImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolInlineCommentEntriesNormalizerImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingServiceImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import com.broadcom.lsp.cobol.core.strategy.CobolErrorStrategy;
import com.broadcom.lsp.cobol.service.delegates.communications.Communications;
import com.broadcom.lsp.cobol.service.delegates.communications.ServerCommunications;
import com.google.inject.AbstractModule;
import com.google.inject.assistedinject.FactoryModuleBuilder;
import org.antlr.v4.runtime.DefaultErrorStrategy;

import static com.google.inject.name.Names.named;

/** This module provides DI bindings for COBOL language engine part. */
public class EngineModule extends AbstractModule {
  @Override
  protected void configure() {
    bind(CobolLanguageEngine.class);
    bind(TextPreprocessor.class).to(TextPreprocessorImpl.class);
    bind(GrammarPreprocessor.class).to(GrammarPreprocessorImpl.class);
    install(new FactoryModuleBuilder().build(GrammarPreprocessorListenerFactory.class));
    bind(ReplacingService.class).to(ReplacingServiceImpl.class);
    bind(CobolLineReader.class).to(CobolLineReaderImpl.class);
    bind(CobolLineReaderDelegate.class).to(CompilerDirectivesTransformation.class);
    bind(CobolLineWriter.class).to(CobolLineWriterImpl.class);
    bind(CobolLinesTransformation.class).to(ContinuationLineTransformation.class);
    bind(DefaultErrorStrategy.class).to(CobolErrorStrategy.class);
    bind(MessageService.class).to(PropertiesMessageService.class);
    bind(LocaleStore.class).to(LocaleStoreImpl.class);
    bind(Communications.class).to(ServerCommunications.class);
    bind(String.class).annotatedWith(named("resourceFileLocation")).toInstance("resourceBundles/messages");


    bind(CobolLineReWriter.class)
        .annotatedWith(named("entriesMarker"))
        .to(CobolCommentEntriesMarkerImpl.class);
    bind(CobolLineReWriter.class)
        .annotatedWith(named("entriesNormalizer"))
        .to(CobolInlineCommentEntriesNormalizerImpl.class);
    bind(CobolLineReWriter.class)
        .annotatedWith(named("indicatorProcessor"))
        .to(CobolLineIndicatorProcessorImpl.class);
  }
}
