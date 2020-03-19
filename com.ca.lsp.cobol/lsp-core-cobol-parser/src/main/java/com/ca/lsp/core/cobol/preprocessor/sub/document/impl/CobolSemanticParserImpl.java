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

import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.StartRuleContext;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.inject.Inject;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.annotation.Nonnull;
import java.util.Deque;
import java.util.List;

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;

/**
 * Preprocessor which retrieves semantic elements definitions, such as variables, paragraphs and
 * copybooks, and applies semantic analysis for the copybooks' content
 */
public class CobolSemanticParserImpl implements CobolSemanticParser {
  private CobolSemanticParserListenerFactory listenerFactory;

  private static final List<String> TRIGGERS =
      asList(
          "cbl",
          "copy",
          "exec sql",
          "exec sqlims",
          "exec cics",
          "process",
          "replace",
          "eject",
          "skip1",
          "skip2",
          "skip3",
          "title");

  @Inject
  public CobolSemanticParserImpl(CobolSemanticParserListenerFactory listenerFactory) {
    this.listenerFactory = listenerFactory;
  }

  @Nonnull
  @Override
  public ResultWithErrors<PreprocessedInput> processLines(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType) {

    return needsProcessing(code)
        ? cleanWithParser(uri, code, copybookStack, textDocumentSyncType)
        : defaultProcessingResult(code);
  }

  private boolean needsProcessing(@Nonnull String code) {
    String codeLowerCase = code.toLowerCase();
    return TRIGGERS.stream().anyMatch(codeLowerCase::contains);
  }

  @Nonnull
  private ResultWithErrors<PreprocessedInput> cleanWithParser(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType) {
    // run the lexer
    CobolPreprocessorLexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));
    // get a list of matched tokens
    CommonTokenStream tokens = new CommonTokenStream(lexer);

    // pass the tokens to the parser
    CobolPreprocessorParser parser = new CobolPreprocessorParser(tokens);

    // specify our entry point
    StartRuleContext startRule = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();
    CobolSemanticParserListener listener =
        listenerFactory.create(uri, tokens, copybookStack, textDocumentSyncType);
    walker.walk(listener, startRule);

    // analyze contained copy books

    return new ResultWithErrors<>(
        new PreprocessedInput(listener.context().read(), listener.getSemanticContext()),
        listener.getErrors());
  }

  @Nonnull
  private ResultWithErrors<PreprocessedInput> defaultProcessingResult(@Nonnull String code) {
    return new ResultWithErrors<>(new PreprocessedInput(code, new SemanticContext()), emptyList());
  }
}
