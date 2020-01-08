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
package com.ca.lsp.core.cobol.preprocessor.impl;

import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleaner;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl.CobolDocumentCleanerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolSemanticParserImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolCommentEntriesMarker;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolInlineCommentEntriesNormalizer;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineIndicatorProcessor;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolInlineCommentEntriesNormalizerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolLineIndicatorProcessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.CobolLinesTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl.CobolLineWriterImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import java.util.Collections;
import java.util.List;

@Slf4j
public class CobolPreprocessorImpl implements CobolPreprocessor {
  @Setter private PreprocessorListener listener;

  @Override
  public PreprocessedInput process(final String cobolSourceCode, final CobolSourceFormat format) {
    return process(
        cobolSourceCode,
        format,
        createDefaultParams(),
        new SemanticContext(Collections.emptyList()));
  }

  @Override
  public PreprocessedInput process(
      final String cobolCode,
      final CobolSourceFormat format,
      final CobolParserParams params,
      final SemanticContext semanticContext) {
    String documentURI = getDocumentURI(semanticContext);
    final List<CobolLine> lines = readLines(cobolCode, format, params, documentURI);
    final List<CobolLine> transformedLines = transformLines(lines, documentURI);
    final List<CobolLine> rewrittenLines = rewriteLines(transformedLines);
    String cleanDocument = cleanDocument(rewrittenLines, format, params);
    return parseDocument(cleanDocument, format, params, semanticContext);
  }

  private String cleanDocument(
      final List<CobolLine> lines, final CobolSourceFormat format, final CobolParserParams params) {
    String code = createLineWriter().serialize(lines);
    return createDocumentCleaner().cleanDocument(code, format, params);
  }

  private PreprocessedInput parseDocument(
      final String document,
      final CobolSourceFormat format,
      final CobolParserParams params,
      final SemanticContext semanticContext) {
    return createDocumentParser(semanticContext).processLines(document, format, params);
  }

  private List<CobolLine> readLines(
      final String cobolCode,
      final CobolSourceFormat format,
      final CobolParserParams params,
      String documentURI) {
    return createLineReader(documentURI).processLines(cobolCode, format, params);
  }

  private List<CobolLine> transformLines(List<CobolLine> lines, String documentURI) {
    return createContinuationLineProcessor(documentURI).transformLines(lines);
  }

  /**
   * Normalizes lines of given COBOL source code, so that comment entries can be parsed and lines
   * have a unified line format.
   */
  private List<CobolLine> rewriteLines(final List<CobolLine> lines) {
    final List<CobolLine> lineIndicatorProcessedLines =
        createLineIndicatorProcessor().processLines(lines);
    final List<CobolLine> normalizedInlineCommentEntriesLines =
        createInlineCommentEntriesNormalizer().processLines(lineIndicatorProcessedLines);
    return createCommentEntriesMarker().processLines(normalizedInlineCommentEntriesLines);
  }

  private CobolCommentEntriesMarker createCommentEntriesMarker() {
    return new CobolCommentEntriesMarkerImpl();
  }

  private CobolParserParams createDefaultParams() {
    return new CobolParserParamsImpl();
  }

  private CobolSemanticParser createDocumentParser(SemanticContext semanticContext) {
    return new CobolSemanticParserImpl(semanticContext, listener);
  }

  private CobolDocumentCleaner createDocumentCleaner() {
    return new CobolDocumentCleanerImpl();
  }

  private CobolInlineCommentEntriesNormalizer createInlineCommentEntriesNormalizer() {
    return new CobolInlineCommentEntriesNormalizerImpl();
  }

  private CobolLineIndicatorProcessor createLineIndicatorProcessor() {
    return new CobolLineIndicatorProcessorImpl();
  }

  private CobolLinesTransformation createContinuationLineProcessor(String documentURI) {
    return new ContinuationLineTransformation(listener, documentURI);
  }

  private CobolLineReader createLineReader(String documentURI) {
    return new CobolLineReaderImpl(listener, documentURI);
  }

  private CobolLineWriter createLineWriter() {
    return new CobolLineWriterImpl();
  }

  private String getDocumentURI(SemanticContext semanticContext) {
    List<CopybookDefinition> tracker = semanticContext.getCopybookUsageTracker();
    return tracker.isEmpty() ? null : tracker.get(tracker.size() - 1).getUri();
  }
}
