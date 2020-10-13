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
import com.broadcom.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

/**
 * This class re-writes the content of the analyzing file to simplify the processing by the grammar,
 * e.g. removes comments or cleans-up the comment and sequence areas. See the delegates for more
 * details. As a result it returns the {@link ExtendedDocument}, e.g. one that has all the copybook
 * content built inside the document text.
 */
@Slf4j
@Singleton
public class TextPreprocessorImpl implements TextPreprocessor {
  private GrammarPreprocessor grammarPreprocessor;
  private CobolLineReader reader;
  private CobolLineWriter writer;
  private CobolLinesTransformation transformation;
  private CobolLineReWriter entriesMarker;
  private CobolLineReWriter entriesNormalizer;
  private CobolLineReWriter indicatorProcessor;

  @Inject
  public TextPreprocessorImpl(
      GrammarPreprocessor grammarPreprocessor,
      CobolLineReader reader,
      CobolLineWriter writer,
      CobolLinesTransformation transformation,
      @Named("entriesMarker") CobolLineReWriter entriesMarker,
      @Named("entriesNormalizer") CobolLineReWriter entriesNormalizer,
      @Named("indicatorProcessor") CobolLineReWriter indicatorProcessor) {
    this.grammarPreprocessor = grammarPreprocessor;
    this.reader = reader;
    this.writer = writer;
    this.transformation = transformation;
    this.entriesMarker = entriesMarker;
    this.entriesNormalizer = entriesNormalizer;
    this.indicatorProcessor = indicatorProcessor;
  }

  /**
   * Process the given source code by removing all the unnecessary tokens and building in the nested
   * copybook content.
   *
   * @param documentUri - URI of the processing document
   * @param cobolSourceCode - source code to analyze
   * @param copybookProcessingMode - settings to control the copybook processing
   * @return - the extended document of that text and all the found errors
   */
  @Nonnull
  @Override
  public ResultWithErrors<ExtendedDocument> process(
      @Nonnull String documentUri,
      @Nonnull String cobolSourceCode,
      CopybookProcessingMode copybookProcessingMode) {
    return process(documentUri, cobolSourceCode, new ArrayDeque<>(), copybookProcessingMode);
  }

  /**
   * Process the given source code by removing all the unnecessary tokens and building in the nested
   * copybook content with tracking the hierarchy of the text documents
   *
   * @param documentUri - URI of the processing document
   * @param cobolCode - source code to analyze
   * @param copybookStack - stack that contains the previous document hierarchy
   * @param copybookProcessingMode - settings to control the copybook processing
   * @return - the extended document of that text and all the found errors
   */
  @Nonnull
  @Override
  public ResultWithErrors<ExtendedDocument> process(
      @Nonnull String documentUri,
      @Nonnull String cobolCode,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull CopybookProcessingMode copybookProcessingMode) {

    ResultWithErrors<List<CobolLine>> lines = readLines(cobolCode, documentUri);

    ResultWithErrors<List<CobolLine>> transformedLines =
        transformLines(documentUri, lines.getResult());

    List<CobolLine> rewrittenLines = rewriteLines(transformedLines.getResult());

    String code = writer.serialize(rewrittenLines);

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
    return reader.processLines(documentURI, cobolCode);
  }

  private ResultWithErrors<List<CobolLine>> transformLines(
      String documentURI, List<CobolLine> lines) {
    return transformation.transformLines(documentURI, lines);
  }

  /**
   * Normalize lines of given COBOL source code, so that comment entries can be parsed and lines
   * have a unified line format.
   */
  private List<CobolLine> rewriteLines(List<CobolLine> lines) {
    List<CobolLine> lineIndicatorProcessedLines = indicatorProcessor.processLines(lines);
    List<CobolLine> normalizedInlineCommentEntriesLines =
        entriesNormalizer.processLines(lineIndicatorProcessedLines);
    return entriesMarker.processLines(normalizedInlineCommentEntriesLines);
  }
}
