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
package org.eclipse.lsp.cobol.dialects.ibm;

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
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
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
public class IbmTextPreprocessor implements CleanerPreprocessor {
  private final CobolLineReaderService readerService;
  private final CobolLineWriterService writerService;
  private final CobolLineTransformationService transformationService;
  private final CobolLineReWriterService indicatorProcessorService;

  @Inject
  public IbmTextPreprocessor(
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
  public ResultWithErrors<ExtendedText> cleanUpCode(String documentUri, String cobolCode) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> lines = readerService.getCobolLineReader(CobolLanguageId.COBOL).processLines(documentUri, cobolCode).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformationService.getTransformer(CobolLanguageId.COBOL).transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = indicatorProcessorService.getLineReWriter(CobolLanguageId.COBOL).processLines(transformedLines);

    ExtendedDocument code = writerService.getCobolLineWriter(CobolLanguageId.COBOL).serialize(rewrittenLines, documentUri);
    return new ResultWithErrors<>(code.getCurrentText(), errors);
  }
}
