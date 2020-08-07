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
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.StartRuleContext;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.CopybookAnalysis;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.emptyList;

/**
 * Preprocessor which retrieves semantic elements definitions, such as variables, paragraphs and
 * copybooks, and applies semantic analysis for the copybooks' content
 */
public class CobolSemanticParserImpl implements CobolSemanticParser {
  private CopybookAnalysis analysis;

  @Inject
  public CobolSemanticParserImpl(CopybookAnalysis analysis) {
    this.analysis = analysis;
  }

  @Nonnull
  @Override
  public ResultWithErrors<PreprocessedInput> processLines(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull SemanticContext semanticContext,
      @Nonnull String copybookProcessingMode) {
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
        createDocumentParserListener(uri, tokens, semanticContext, copybookProcessingMode);
    walker.walk(listener, startRule);

    // analyze contained copy books
    ResultWithErrors<List<CopybookSemanticContext>> contexts =
        processCopybooks(uri, semanticContext, copybookProcessingMode);

    buildCompleteVariableStructure(semanticContext, contexts);

    List<SyntaxError> errors = new ArrayList<>(contexts.getErrors());
    errors.addAll(listener.getErrors());

    return new ResultWithErrors<>(
        new PreprocessedInput(listener.context().read(), semanticContext), errors);
  }

  @Nonnull
  private ResultWithErrors<List<CopybookSemanticContext>> processCopybooks(
      @Nonnull String documentUri,
      @Nonnull SemanticContext semanticContext,
      String copybookProcessingMode) {
    Multimap<String, Position> copybookNames = semanticContext.getCopybooks().getUsages();

    if (copybookNames.isEmpty()) {
      return new ResultWithErrors<>(emptyList(), emptyList());
    }
    return analysis.analyzeCopybooks(
        documentUri,
        copybookNames,
        semanticContext.getCopybookUsageTracker(),
        copybookProcessingMode);
  }

  private void buildCompleteVariableStructure(
      @Nonnull SemanticContext semanticContext,
      @Nonnull ResultWithErrors<List<CopybookSemanticContext>> contexts) {
    contexts.getResult().forEach(semanticContext::merge);
    semanticContext.getVariables().removeUnresolvedCopybookMarks();
    semanticContext.getVariables().createRelationBetweenVariables();
  }

  @Nonnull
  private CobolSemanticParserListener createDocumentParserListener(
      @Nonnull String uri,
      @Nonnull CommonTokenStream tokens,
      @Nonnull SemanticContext semanticContext,
      @Nonnull String copybookProcessingMode) {
    return new CobolSemanticParserListenerImpl(
        uri, tokens, semanticContext, copybookProcessingMode);
  }
}
