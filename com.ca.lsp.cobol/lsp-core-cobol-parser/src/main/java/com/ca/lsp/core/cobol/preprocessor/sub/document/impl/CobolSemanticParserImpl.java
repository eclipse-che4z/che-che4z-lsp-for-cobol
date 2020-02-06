/*
 * Copyright (c) 2019 Broadcom.
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
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.CopybookParallelAnalysis;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Preprocessor which retrieves semantic elements definitions, such as variables, paragraphs and
 * copybooks, and also applies semantic analysis for the copybooks' content
 */
@AllArgsConstructor
public class CobolSemanticParserImpl implements CobolSemanticParser {

  @Nonnull
  @Override
  public ResultWithErrors<PreprocessedInput> processLines(
      @Nonnull String uri, @Nonnull String code, @Nonnull SemanticContext semanticContext) {
    // run the lexer
    final CobolPreprocessorLexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));
    // get a list of matched tokens
    final CommonTokenStream tokens = new CommonTokenStream(lexer);

    // pass the tokens to the parser
    final CobolPreprocessorParser parser = new CobolPreprocessorParser(tokens);

    // specify our entry point
    final StartRuleContext startRule = parser.startRule();

    final ParseTreeWalker walker = new ParseTreeWalker();
    final CobolSemanticParserListener listener =
        createDocumentParserListener(uri, tokens, semanticContext);
    walker.walk(listener, startRule);

    // analyze contained copy books
    ResultWithErrors<List<CopybookSemanticContext>> contexts =
        processCopybooks(uri, semanticContext);
    contexts.getResult().forEach(semanticContext::merge);

    List<SyntaxError> errors = new ArrayList<>(contexts.getErrors());

    errors.addAll(listener.getErrors());

    semanticContext.getVariables().createRelationBetweenVariables();
    return new ResultWithErrors<>(
        new PreprocessedInput(listener.context().read(), semanticContext), errors);
  }

  private ResultWithErrors<List<CopybookSemanticContext>> processCopybooks(
      String documentUri, @Nonnull SemanticContext semanticContext) {
    Multimap<String, Position> copybookNames = semanticContext.getCopybooks().getDefinitions();

    if (copybookNames.isEmpty()) {
      return new ResultWithErrors<>(Collections.emptyList(), Collections.emptyList());
    }

    CopybookAnalysis copybookAnalyzer = createCopybookAnalyzer();
    return copybookAnalyzer.analyzeCopybooks(
        documentUri, copybookNames, semanticContext.getCopybookUsageTracker());
  }

  @Nonnull
  private CobolSemanticParserListener createDocumentParserListener(
      @Nonnull String uri,
      @Nonnull CommonTokenStream tokens,
      @Nonnull SemanticContext semanticContext) {
    return new CobolSemanticParserListenerImpl(uri, tokens, semanticContext);
  }

  @Nonnull
  private CopybookAnalysis createCopybookAnalyzer() {
    return new CopybookParallelAnalysis();
  }
}
