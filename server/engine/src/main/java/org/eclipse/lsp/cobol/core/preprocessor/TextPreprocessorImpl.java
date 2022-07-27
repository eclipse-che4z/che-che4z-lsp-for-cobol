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
import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

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

  @Override
  public ResultWithErrors<TextTransformations> cleanUpCode(String documentUri, String cobolCode) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> lines = readLines(cobolCode, documentUri).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = rewriteLines(transformedLines);

    TextTransformations code = writer.serialize(rewrittenLines, documentUri);
    return new ResultWithErrors<>(code, errors);
  }

  @NonNull
  @Override
  public ResultWithErrors<ExtendedDocument> processCleanCode(
      @NonNull String documentUri,
      @NonNull String cobolCode,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy) {
    return grammarPreprocessor.buildExtendedDocument(
        documentUri, cobolCode, copybookConfig, hierarchy);
  }

  private ResultWithErrors<List<CobolLine>> readLines(String cobolCode, String documentURI) {
    return reader.processLines(documentURI, cobolCode);
  }

  private ResultWithErrors<List<CobolLine>> transformLines(String documentURI, List<CobolLine> lines) {
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
