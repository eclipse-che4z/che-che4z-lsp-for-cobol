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

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.listener.FormatListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.ProcessingConstants;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolDocumentParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentParserImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolCommentEntriesMarker;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolInlineCommentEntriesNormalizer;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineIndicatorProcessor;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolCommentEntriesMarkerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolInlineCommentEntriesNormalizerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl.CobolLineIndicatorProcessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.CobolLinesTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.CobolUnsupportedFeaturesIgnorerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.transformer.ContinuationLineTransformation;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl.CobolLineWriterImpl;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.charset.Charset;
import java.util.List;

@Slf4j
public class CobolPreprocessorImpl implements CobolPreprocessor {

  private FormatListener formatListener = null;

  public void setFormatErrors(FormatListener formatErrors) {
    this.formatListener = formatErrors;
  }

  protected CobolCommentEntriesMarker createCommentEntriesMarker() {
    return new CobolCommentEntriesMarkerImpl();
  }

  protected CobolParserParams createDefaultParams() {
    return new CobolParserParamsImpl();
  }

  protected CobolParserParams createDefaultParams(final File cobolFile) {
    final CobolParserParams result = createDefaultParams();

    final File copyBooksDirectory = cobolFile.getParentFile();
    result.setCopyBookDirectories(Lists.newArrayList(copyBooksDirectory));

    return result;
  }

  protected CobolDocumentParser createDocumentParser() {
    return new CobolDocumentParserImpl();
  }

  protected CobolInlineCommentEntriesNormalizer createInlineCommentEntriesNormalizer() {
    return new CobolInlineCommentEntriesNormalizerImpl();
  }

  protected CobolLineIndicatorProcessor createLineIndicatorProcessor() {
    return new CobolLineIndicatorProcessorImpl();
  }

  private CobolLinesTransformation createUnsupportedFeaturesProcessor() {
    return new CobolUnsupportedFeaturesIgnorerImpl(formatListener);
  }

  private CobolLinesTransformation createContinuationLineProcessor() {
    return new ContinuationLineTransformation(formatListener);
  }

  protected CobolLineReader createLineReader() {
    return new CobolLineReaderImpl(formatListener);
  }

  protected CobolLineWriter createLineWriter() {
    return new CobolLineWriterImpl();
  }

  protected String parseDocument(
      final List<CobolLine> lines,
      final CobolPreprocessor.CobolSourceFormatEnum format,
      final CobolParserParams params) {
    String code = createLineWriter().serialize(lines);
    return createDocumentParser().processLines(code, format, params);
  }

  @Override
  public String process(final File cobolFile, final CobolSourceFormatEnum format)
      throws IOException {
    return process(cobolFile, format, createDefaultParams(cobolFile));
  }

  @Override
  public String process(
      final File cobolFile, final CobolSourceFormatEnum format, final CobolParserParams params)
      throws IOException {
    final Charset charset = params.getCharset();

    LOG.debug(
        "Preprocessing file {} with line format {} and charset {}.",
        cobolFile.getName(),
        format,
        charset);

    final StringBuilder outputBuffer = new StringBuilder();
    try (InputStream inputStream = new FileInputStream(cobolFile);
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream, charset);
        BufferedReader bufferedInputStreamReader = new BufferedReader(inputStreamReader)) {
      String line;
      while ((line = bufferedInputStreamReader.readLine()) != null) {
        outputBuffer.append(line).append(ProcessingConstants.NEWLINE);
      }
    }

    return process(outputBuffer.toString(), format, params);
  }

  @Override
  public String process(final String cobolSourceCode, final CobolSourceFormatEnum format) {
    return process(cobolSourceCode, format, createDefaultParams());
  }

  @Override
  public String process(
      final String cobolCode, final CobolSourceFormatEnum format, final CobolParserParams params) {
    final List<CobolLine> lines = readLines(cobolCode, format, params);
    final List<CobolLine> transformedLines = transformLines(lines);
    final List<CobolLine> rewrittenLines = rewriteLines(transformedLines);
    return parseDocument(rewrittenLines, format, params);
  }

  protected List<CobolLine> readLines(
      final String cobolCode, final CobolSourceFormatEnum format, final CobolParserParams params) {
    return createLineReader().processLines(cobolCode, format, params);
  }

  private List<CobolLine> transformLines(List<CobolLine> lines) {
    List<CobolLine> transformedLines = createUnsupportedFeaturesProcessor().transformLines(lines);
    return createContinuationLineProcessor().transformLines(transformedLines);
  }

  /**
   * Normalizes lines of given COBOL source code, so that comment entries can be parsed and lines
   * have a unified line format.
   */
  protected List<CobolLine> rewriteLines(final List<CobolLine> lines) {
    final List<CobolLine> lineIndicatorProcessedLines =
        createLineIndicatorProcessor().processLines(lines);
    final List<CobolLine> normalizedInlineCommentEntriesLines =
        createInlineCommentEntriesNormalizer().processLines(lineIndicatorProcessedLines);
    return createCommentEntriesMarker().processLines(normalizedInlineCommentEntriesLines);
  }
}
