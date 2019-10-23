package com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolCleanerLexer;
import com.ca.lsp.core.cobol.parser.CobolCleanerParser;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleanerListener;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class CobolDocumentCleanerImpl
    implements com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleaner {

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
  public String cleanDocument(
      String code, CobolPreprocessor.CobolSourceFormatEnum format, CobolParserParams params) {
    final boolean requiresProcessorExecution = containsTrigger(code, TRIGGERS);
    final String result;

    if (requiresProcessorExecution) {
      result = cleanWithParser(code, format);
    } else {
      result = code;
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
      final String code, final CobolPreprocessor.CobolSourceFormatEnum format) {
    // run the lexer
    final CobolCleanerLexer lexer = new CobolCleanerLexer(CharStreams.fromString(code));

    // get a list of matched tokens
    final CommonTokenStream tokens = new CommonTokenStream(lexer);

    // pass the tokens to the parser
    final CobolCleanerParser parser = new CobolCleanerParser(tokens);

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
      final CobolPreprocessor.CobolSourceFormatEnum format,
      final CommonTokenStream tokens) {
    return new CobolDocumentCleanerListenerImpl(format, tokens);
  }
}
