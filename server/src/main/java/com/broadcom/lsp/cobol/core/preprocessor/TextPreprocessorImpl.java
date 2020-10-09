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
package com.broadcom.lsp.cobol.core.preprocessor;

import com.broadcom.lsp.cobol.core.model.*;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.*;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

@Slf4j
@Singleton
public class TextPreprocessorImpl implements TextPreprocessor {
  private GrammarPreprocessor grammarPreprocessor;

  @Inject
  public TextPreprocessorImpl(GrammarPreprocessor grammarPreprocessor) {
    this.grammarPreprocessor = grammarPreprocessor;
  }

  @Nonnull
  @Override
  public ResultWithErrors<ExtendedDocument> process(
      @Nonnull String documentUri,
      @Nonnull String cobolSourceCode,
      CopybookProcessingMode copybookProcessingMode) {
    return process(documentUri, cobolSourceCode, new ArrayDeque<>(), copybookProcessingMode);
  }

  @Nonnull
  @Override
  public ResultWithErrors<ExtendedDocument> process(
      @Nonnull String documentUri,
      @Nonnull String cobolCode,
      Deque<CopybookUsage> copybookStack,
      @Nonnull CopybookProcessingMode copybookProcessingMode) {

    ResultWithErrors<List<CobolLine>> lines = readLines(cobolCode, documentUri);

    ResultWithErrors<List<CobolLine>> transformedLines =
        transformLines(documentUri, lines.getResult());

    List<CobolLine> rewrittenLines = rewriteLines(transformedLines.getResult());

    String code = createLineWriter().serialize(rewrittenLines);

    ResultWithErrors<ExtendedDocument> parsedDocument =
        grammarPreprocessor.buildExtendedDocument(
            documentUri, code, copybookStack, copybookProcessingMode);

    List<SyntaxError> errors = new ArrayList<>();
    errors.addAll(lines.getErrors());
    errors.addAll(transformedLines.getErrors());
    errors.addAll(parsedDocument.getErrors());

    return new ResultWithErrors<>(parsedDocument.getResult(), errors);
  }

  private ResultWithErrors<List<CobolLine>> readLines(String cobolCode, String documentURI) {
    return createLineReader().processLines(documentURI, cobolCode);
  }

  private ResultWithErrors<List<CobolLine>> transformLines(
      String documentURI, List<CobolLine> lines) {
    return createContinuationLineProcessor().transformLines(documentURI, lines);
  }

  /**
   * Normalize lines of given COBOL source code, so that comment entries can be parsed and lines
   * have a unified line format.
   */
  private List<CobolLine> rewriteLines(List<CobolLine> lines) {
    List<CobolLine> lineIndicatorProcessedLines =
        createLineIndicatorProcessor().processLines(lines);
    List<CobolLine> normalizedInlineCommentEntriesLines =
        createInlineCommentEntriesNormalizer().processLines(lineIndicatorProcessedLines);
    return createCommentEntriesMarker().processLines(normalizedInlineCommentEntriesLines);
  }

  private CobolLineReWriter createCommentEntriesMarker() {
    return new CobolCommentEntriesMarkerImpl();
  }

  private CobolLineReWriter createInlineCommentEntriesNormalizer() {
    return new CobolInlineCommentEntriesNormalizerImpl();
  }

  private CobolLineIndicatorProcessor createLineIndicatorProcessor() {
    return new CobolLineIndicatorProcessorImpl();
  }

  private CobolLinesTransformation createContinuationLineProcessor() {
    return new ContinuationLineTransformation();
  }

  private CobolLineReader createLineReader() {
    return new CobolLineReaderImpl();
  }

  private CobolLineWriter createLineWriter() {
    return new CobolLineWriterImpl();
  }
}
