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

import java.util.ArrayList;
import java.util.List;

import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.StartRuleContext;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor.CobolSourceFormatEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolDocumentParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolDocumentParserListener;

/** Preprocessor, which parses and processes COPY REPLACE and EXEC SQL statements. */
@AllArgsConstructor
public class CobolDocumentParserImpl implements CobolDocumentParser {

  private SemanticContext semanticContext;
  private static final String[] TRIGGERS =
      new String[] {
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
        "title"
      };

  @Override
  public PreprocessedInput processLines(
      final String code, final CobolSourceFormatEnum format, final CobolParserParams params) {
    final boolean requiresProcessorExecution = containsTrigger(code, TRIGGERS);
    final PreprocessedInput result;

    if (requiresProcessorExecution) {
      result = processWithParser(code, format, params);
    } else {
      result = new PreprocessedInput(code, semanticContext);
    }

    return result;
  }

  private boolean containsTrigger(final String code, final String[] triggers) {
    final String codeLowerCase = code.toLowerCase();
    boolean result = false;

    for (final String trigger : triggers) {
      final boolean containsTrigger = codeLowerCase.contains(trigger);

      if (containsTrigger) {
        result = true;
        break;
      }
    }

    return result;
  }

  private PreprocessedInput processWithParser(
      final String code, final CobolSourceFormatEnum format, final CobolParserParams params) {
    // run the lexer
    List<SyntaxError> generalErrors = new ArrayList<>();
    final CobolPreprocessorLexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));

    if (!params.getIgnoreSyntaxErrors()) {
      // register an error listener, so that preprocessing stops on errors
      lexer.removeErrorListeners();
      lexer.addErrorListener(new VerboseListener(generalErrors));
    }

    // get a list of matched tokens
    final CommonTokenStream tokens = new CommonTokenStream(lexer);

    // pass the tokens to the parser
    final CobolPreprocessorParser parser = new CobolPreprocessorParser(tokens);
    if (!params.getIgnoreSyntaxErrors()) {
      // register an error listener, so that preprocessing stops on errors
      parser.removeErrorListeners();
      parser.addErrorListener(new VerboseListener(generalErrors));
    }

    // specify our entry point
    final StartRuleContext startRule = parser.startRule();
    final ParseTreeWalker walker = new ParseTreeWalker();
    // analyze contained copy books
    final CobolDocumentParserListener listener =
        createDocumentParserListener(format, params, tokens, semanticContext);

    walker.walk(listener, startRule);
    // in this section the engine will apply a semantic logic to understand the level of grouping of
    // data
    semanticContext.getVariables().createRelationBetweenVariables();
    return new PreprocessedInput(listener.context().read(), semanticContext);
  }

  private CobolDocumentParserListener createDocumentParserListener(
      final CobolSourceFormatEnum format,
      final CobolParserParams params,
      final CommonTokenStream tokens,
      final SemanticContext semanticContext) {
    return new CobolDocumentParserListenerImpl(format, params, tokens, semanticContext);
  }
}
