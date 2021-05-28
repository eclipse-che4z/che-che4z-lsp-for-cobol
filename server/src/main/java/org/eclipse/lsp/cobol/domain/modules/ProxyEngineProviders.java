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
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.annotation.CheckThreadInterruption;
import org.eclipse.lsp.cobol.core.annotation.ProxyUtil;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.visitor.InterruptingTreeListener;
import org.eclipse.lsp.cobol.service.SubroutineService;

/**
 * Provide CGLIB proxy guice binding for classes to handle {@link CheckThreadInterruption}
 * annotation.
 */
@Slf4j
public abstract class ProxyEngineProviders extends AbstractModule {

  /**
   * Provides binding for {@link GrammarPreprocessor}.
   *
   * @param listenerFactory
   * @param replacingService
   * @param messageService
   * @return GrammarPreprocessor
   */
  @Provides
  public GrammarPreprocessor createGrammarPreprocessor(
      GrammarPreprocessorListenerFactory listenerFactory,
      ReplacingService replacingService,
      MessageService messageService) {
    return ProxyUtil.getThreadInterruptionProxyObject(
        GrammarPreprocessorImpl.class,
        new Class[] {
          GrammarPreprocessorListenerFactory.class, ReplacingService.class, MessageService.class
        },
        new Object[] {listenerFactory, replacingService, messageService});
  }

  /**
   * Provides binding for {@link CobolLanguageEngine}
   *
   * @param preprocessor
   * @param defaultErrorStrategy
   * @param messageService
   * @param treeListener
   * @param subroutineService
   * @return CobolLanguageEngine
   */
  @Provides
  public CobolLanguageEngine createCobolLanguageEngine(
      TextPreprocessor preprocessor,
      DefaultErrorStrategy defaultErrorStrategy,
      MessageService messageService,
      ParseTreeListener treeListener,
      SubroutineService subroutineService) {
    return ProxyUtil.getThreadInterruptionProxyObject(
        CobolLanguageEngine.class,
        new Class[] {
          TextPreprocessor.class,
          DefaultErrorStrategy.class,
          MessageService.class,
          ParseTreeListener.class,
          SubroutineService.class
        },
        new Object[] {
          preprocessor, defaultErrorStrategy, messageService, treeListener, subroutineService
        });
  }

  /**
   * Provides binding for {@link TextPreprocessor}
   *
   * @param grammarPreprocessor
   * @param reader
   * @param writer
   * @param transformation
   * @param entriesMarker
   * @param entriesNormalizer
   * @param indicatorProcessor
   * @return TextPreprocessor
   */
  @Provides
  public TextPreprocessor getTextPreprocessor(
      GrammarPreprocessor grammarPreprocessor,
      CobolLineReader reader,
      CobolLineWriter writer,
      CobolLinesTransformation transformation,
      @Named("entriesMarker") CobolLineReWriter entriesMarker,
      @Named("entriesNormalizer") CobolLineReWriter entriesNormalizer,
      @Named("indicatorProcessor") CobolLineReWriter indicatorProcessor) {

    return ProxyUtil.getThreadInterruptionProxyObject(
        TextPreprocessorImpl.class,
        new Class[] {
          GrammarPreprocessor.class,
          CobolLineReader.class,
          CobolLineWriter.class,
          CobolLinesTransformation.class,
          CobolLineReWriter.class,
          CobolLineReWriter.class,
          CobolLineReWriter.class
        },
        new Object[] {
          grammarPreprocessor,
          reader,
          writer,
          transformation,
          entriesMarker,
          entriesNormalizer,
          indicatorProcessor
        });
  }

  /**
   * Provides binding for {@link ParseTreeListener}
   *
   * @return ParseTreeListener
   */
  @Provides
  public ParseTreeListener getParseTreeListener() {
    return ProxyUtil.getThreadInterruptionProxyObject(
        InterruptingTreeListener.class, new Class[] {}, new Object[] {});
  }
}
