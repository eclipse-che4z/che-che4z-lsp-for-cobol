/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl;

import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolCleanerLexer;
import com.ca.lsp.core.cobol.parser.CobolCleanerParser;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleaner;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleanerListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.util.ArrayList;
import java.util.List;

public class CobolDocumentCleanerImpl implements CobolDocumentCleaner {

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
  public String cleanDocument(String text, CobolSourceFormat format, CobolParserParams params) {
    final boolean requiresProcessorExecution = containsTrigger(text, TRIGGERS);
    final String result;

    if (requiresProcessorExecution) {
      result = cleanWithParser(text, format, params);
    } else {
      result = text;
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

  private String cleanWithParser(
      final String code, final CobolSourceFormat format, CobolParserParams params) {
    // run the lexer
    List<SyntaxError> errors = new ArrayList<>();

    // run the lexer
    final CobolCleanerLexer lexer = new CobolCleanerLexer(CharStreams.fromString(code));

    if (!params.getIgnoreSyntaxErrors()) {
      // register an error listener, so that preprocessing stops on errors
      lexer.removeErrorListeners();
      lexer.addErrorListener(new VerboseListener(errors));
    }

    // get a list of matched tokens
    final CommonTokenStream tokens = new CommonTokenStream(lexer);

    // pass the tokens to the parser
    final CobolCleanerParser parser = new CobolCleanerParser(tokens);
    if (!params.getIgnoreSyntaxErrors()) {
      // register an error listener, so that preprocessing stops on errors
      parser.removeErrorListeners();
      parser.addErrorListener(new VerboseListener(errors));
    }

    // specify our entry point
    CobolCleanerParser.StartCleanContext startRule = parser.startClean();
    final ParseTreeWalker walker = new ParseTreeWalker();

    final CobolDocumentCleanerListener listener = createCleanerListener(format, tokens);

    walker.walk(listener, startRule);
    // in this section the engine will apply a semantic logic to understand the level of grouping of
    // data
    return listener.context().read();
  }

  private CobolDocumentCleanerListener createCleanerListener(
      final CobolSourceFormat format, final CommonTokenStream tokens) {
    return new CobolDocumentCommentingCleanerListener(format, tokens);
  }
}
