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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessorListenerFactory;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.google.inject.Inject;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.annotation.Nonnull;
import java.util.Deque;
import java.util.List;
import java.util.Map;

/**
 * This class runs pre-processing for COBOL using CobolPreprocessor.g4 grammar file. As a result, it
 * returns an extended document with all the available copybooks included, with their definitions
 * and usages specified, as well as related errors.
 */
public class GrammarPreprocessorImpl implements GrammarPreprocessor {
  private GrammarPreprocessorListenerFactory listenerFactory;
  private TokenUtils tokenUtils;

  @Inject
  public GrammarPreprocessorImpl(
      GrammarPreprocessorListenerFactory listenerFactory, TokenUtils tokenUtils) {
    this.listenerFactory = listenerFactory;
    this.tokenUtils = tokenUtils;
  }

  @Nonnull
  @Override
  public ResultWithErrors<ExtendedDocument> buildExtendedDocument(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType) {
    GrammarPreprocessorListener fulfilledListener =
        runGrammarProcessing(uri, code, copybookStack, textDocumentSyncType);

    return new ResultWithErrors<>(
        buildExtendedDocument(uri, code, fulfilledListener), fulfilledListener.getErrors());
  }

  @Nonnull
  private GrammarPreprocessorListener runGrammarProcessing(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType) {
    Lexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));
    lexer.removeErrorListeners();

    BufferedTokenStream tokens = new CommonTokenStream(lexer);

    CobolPreprocessorParser parser = new CobolPreprocessorParser(tokens);
    parser.removeErrorListeners();

    RuleContext startRule = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();
    GrammarPreprocessorListener listener =
        listenerFactory.create(uri, tokens, copybookStack, textDocumentSyncType);
    walker.walk(listener, startRule);
    return listener;
  }

  @Nonnull
  private ExtendedDocument buildExtendedDocument(
      @Nonnull String uri, @Nonnull String code, GrammarPreprocessorListener listener) {
    return new ExtendedDocument(
        listener.getResult(), listener.getCopybooks(), getPositionMapping(uri, code, listener));
  }

  @Nonnull
  private Map<String, List<Position>> getPositionMapping(
      @Nonnull String uri, @Nonnull String code, GrammarPreprocessorListener listener) {
    Map<String, List<Position>> accumulatedMappings = listener.getNestedMappings();
    accumulatedMappings.put(uri, tokenUtils.retrievePositionsFromText(uri, code));
    return accumulatedMappings;
  }
}
