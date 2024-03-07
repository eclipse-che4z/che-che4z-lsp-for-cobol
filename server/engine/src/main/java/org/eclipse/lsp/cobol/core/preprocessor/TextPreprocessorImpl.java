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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.preprocessor;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriterService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLineTransformationService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterService;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/**
 * This class re-writes the content of the analyzing file to simplify the processing by the grammar,
 * e.g. removes comments or cleans-up the comment and sequence areas. See the delegates for more
 * details.
 */
@Slf4j
@Singleton
public class TextPreprocessorImpl implements TextPreprocessor, CleanerPreprocessor {
  private final CobolLineReaderService readerService;
  private final CobolLineWriterService writerService;
  private final CobolLineTransformationService transformationService;
  private final CobolLineReWriterService indicatorProcessorService;

  @Inject
  public TextPreprocessorImpl(
      CobolLineReaderService readerService,
      CobolLineWriterService writerService,
      CobolLineTransformationService transformationService,
      CobolLineReWriterService indicatorProcessorService) {
    this.readerService = readerService;
    this.writerService = writerService;
    this.transformationService = transformationService;
    this.indicatorProcessorService = indicatorProcessorService;
  }

  @Override
  public ResultWithErrors<ExtendedText> cleanUpCode(String documentUri, String cobolCode, CobolLanguageId languageId) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> lines = readerService.getCobolLineReader(languageId).processLines(documentUri, cobolCode).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformationService.getTransformer(languageId).transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = indicatorProcessorService.getLineReWriter(languageId).processLines(transformedLines);

    ExtendedDocument code = writerService.getCobolLineWriter(languageId).serialize(rewrittenLines, documentUri);
    return new ResultWithErrors<>(code.getCurrentText(), errors);
  }

  @Override
  public ResultWithErrors<ExtendedText> cleanUpCode(String documentUri, String cobolCode) {
    return cleanUpCode(documentUri, cobolCode, CobolLanguageId.COBOL);
  }
}
