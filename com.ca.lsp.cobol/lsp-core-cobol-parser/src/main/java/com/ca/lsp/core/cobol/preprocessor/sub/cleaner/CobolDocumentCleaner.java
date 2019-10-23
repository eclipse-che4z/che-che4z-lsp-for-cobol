package com.ca.lsp.core.cobol.preprocessor.sub.cleaner;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;

/**
 * This component is a part of preprocessor that eliminates the non-processable tokens from the
 * text.
 */
public interface CobolDocumentCleaner {
  /**
   * Remove the tokens that are not going to be processed from the text
   *
   * @param text - text to be cleaned
   * @param format - format of the document
   * @param params - parsing params
   * @return cleaned up text
   */
  String cleanDocument(
      String text, CobolPreprocessor.CobolSourceFormatEnum format, CobolParserParams params);
}
