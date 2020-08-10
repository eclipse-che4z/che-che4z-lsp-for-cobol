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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.impl;

import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleaner;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl.CobolDocumentCleanerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineIndicatorProcessor;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineReWriter;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolInlineCommentEntriesNormalizerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolLineIndicatorProcessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.CobolLinesTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl.CobolLineWriterImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@Singleton
public class CobolPreprocessorImpl implements CobolPreprocessor {
  private CobolSemanticParser semanticParser;

  @Inject
  public CobolPreprocessorImpl(CobolSemanticParser semanticParser) {
    this.semanticParser = semanticParser;
  }

  @Nonnull
  @Override
  public ResultWithErrors<PreprocessedInput> process(
      @Nonnull String documentUri, @Nonnull String cobolSourceCode, String copybookProcessingMode) {
    return process(
        documentUri,
        cobolSourceCode,
        new SemanticContext(Collections.emptyList()),
        copybookProcessingMode);
  }

  @Nonnull
  @Override
  public ResultWithErrors<PreprocessedInput> process(
      @Nonnull String documentUri,
      @Nonnull String cobolCode,
      @Nonnull SemanticContext semanticContext,
      @Nonnull String copybookProcessingMode) {

    ResultWithErrors<List<CobolLine>> lines = readLines(cobolCode, documentUri);

    ResultWithErrors<List<CobolLine>> transformedLines =
        transformLines(documentUri, lines.getResult());

    List<CobolLine> rewrittenLines = rewriteLines(transformedLines.getResult());

    String cleanDocument = cleanDocument(documentUri, rewrittenLines);

    ResultWithErrors<PreprocessedInput> parsedDocument =
        semanticParser.processLines(
            documentUri, cleanDocument, semanticContext, copybookProcessingMode);

    List<SyntaxError> errors = new ArrayList<>();
    errors.addAll(lines.getErrors());
    errors.addAll(transformedLines.getErrors());
    errors.addAll(parsedDocument.getErrors());

    return new ResultWithErrors<>(parsedDocument.getResult(), errors);
  }

  private String cleanDocument(String documentUri, List<CobolLine> lines) {
    String code = createLineWriter().serialize(lines);
    return createDocumentCleaner().cleanDocument(documentUri, code);
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

  private CobolDocumentCleaner createDocumentCleaner() {
    return new CobolDocumentCleanerImpl();
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
