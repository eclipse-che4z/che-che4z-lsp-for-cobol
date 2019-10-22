package com.ca.lsp.core.cobol.preprocessor.sub.cleaner;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;

public interface CobolCleaner {
  String cleanDocument(String code, CobolPreprocessor.CobolSourceFormatEnum format, CobolParserParams params);
}
