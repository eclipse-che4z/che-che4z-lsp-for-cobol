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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.StartRuleContext;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
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

import java.util.List;

/** Preprocessor, which parses and processes COPY REPLACE and EXEC SQL statements. */
@AllArgsConstructor
public class CobolSemanticParserImpl implements CobolSemanticParser {
  private final SemanticContext semanticContext;
  private final PreprocessorListener formatListener;

  @Override
  public PreprocessedInput processLines(
      final String code, final CobolSourceFormat format, final CobolParserParams params) {
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
        createDocumentParserListener(tokens, semanticContext, format);
    walker.walk(listener, startRule);

    // analyze contained copy books
    processCopybooks(format);

    semanticContext.getVariables().createRelationBetweenVariables();
    return new PreprocessedInput(listener.context().read(), semanticContext);
  }

  private void processCopybooks(CobolSourceFormat format) {
    Multimap<String, Position> copybookNames = semanticContext.getCopybooks().getDefinitions();
    if (copybookNames.isEmpty()) {
      return;
    }
    CopybookAnalysis copybookAnalyzer = createCopybookAnalyzer();
    List<CopybookSemanticContext> contexts =
        copybookAnalyzer.analyzeCopybooks(
            copybookNames, semanticContext.getCopybookUsageTracker(), format);
    contexts.forEach(semanticContext::merge);
  }

  private CobolSemanticParserListener createDocumentParserListener(
      final CommonTokenStream tokens,
      final SemanticContext semanticContext,
      final CobolSourceFormat format) {
    return new CobolSemanticParserListenerImpl(tokens, semanticContext, format, formatListener);
  }

  private CopybookAnalysis createCopybookAnalyzer() {
    return new CopybookParallelAnalysis(formatListener);
  }
}
