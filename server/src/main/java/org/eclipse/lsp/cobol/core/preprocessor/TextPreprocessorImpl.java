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
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.model.CobolLine;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.service.CopybookConfig;

import java.util.ArrayList;
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
  private final GrammarPreprocessor grammarPreprocessor;
  private final CobolLineReader reader;
  private final CobolLineWriter writer;
  private final CobolLinesTransformation transformation;
  private final CobolLineReWriter indicatorProcessor;

  @Inject
  public TextPreprocessorImpl(
      GrammarPreprocessor grammarPreprocessor,
      CobolLineReader reader,
      CobolLineWriter writer,
      CobolLinesTransformation transformation,
      CobolLineReWriter indicatorProcessor) {
    this.grammarPreprocessor = grammarPreprocessor;
    this.reader = reader;
    this.writer = writer;
    this.transformation = transformation;
    this.indicatorProcessor = indicatorProcessor;
  }

  /**
   * Process the given source code by removing all the unnecessary tokens and building in the nested
   * copybook content.
   *
   * @param documentUri - URI of the processing document
   * @param cobolSourceCode - source code to analyze
   * @param copybookConfig contains config info like: copybook processing mode, backend server
   * @return - the extended document of that text and all the found errors
   */
  @NonNull
  @Override
  public ResultWithErrors<ExtendedDocument> process(
      @NonNull String documentUri,
      @NonNull String cobolSourceCode,
      @NonNull CopybookConfig copybookConfig) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    List<SyntaxError> errors = new ArrayList<>();
    ExtendedDocument extendedDocument =
        processCleanCode(documentUri, cobolSourceCode, copybookConfig, new CopybookHierarchy())
            .unwrap(errors::addAll);
    return new ResultWithErrors<>(extendedDocument, errors);
  }

  /**
   * Process the given source code by removing all the unnecessary tokens and building in the nested
   * copybook content with tracking the hierarchy of the text documents
   *
   * @param documentUri - URI of the processing document
   * @param cobolCode - source code to analyze
   * @param copybookConfig contains config info like: copybook processing mode, backend server
   * @return - the extended document of that text and all the found errors
   */
  @NonNull
  @Override
  public ResultWithErrors<ExtendedDocument> processCleanCode(
      @NonNull String documentUri,
      @NonNull String cobolCode,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy) {
    List<SyntaxError> errors = new ArrayList<>();
    ExtendedDocument parsedDocument =
        grammarPreprocessor
            .buildExtendedDocument(documentUri, cobolCode, copybookConfig, hierarchy)
            .unwrap(errors::addAll);

    return new ResultWithErrors<>(parsedDocument, errors);
  }

  @Override
  public ResultWithErrors<String> cleanUpCode(String documentUri, String cobolCode) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> lines = readLines(cobolCode, documentUri).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = rewriteLines(transformedLines);

    String code = writer.serialize(rewrittenLines);
    return new ResultWithErrors<>(code, errors);
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
    return indicatorProcessor.processLines(lines);
  }
}
