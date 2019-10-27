package com.ca.lsp.core.cobol.preprocessor.sub.copybook;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;

import java.util.Collection;
import java.util.List;

public interface CopybookAnalysis {

  List<SemanticContext> analyzeCopybooks(
          Collection<String> names, CobolPreprocessor.CobolSourceFormatEnum format, CobolParserParams params);
}
