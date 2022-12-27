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
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;

import java.util.ArrayList;
import java.util.List;

/**
 * This class re-writes the content of the analyzing file to simplify the processing by the grammar,
 * e.g. removes comments or cleans-up the comment and sequence areas. See the delegates for more
 * details. As a result it returns the {@link OldExtendedDocument}, e.g. one that has all the copybook
 * content built inside the document text.
 */
@Slf4j
@Singleton
public class TextPreprocessorImpl implements TextPreprocessor, CleanerPreprocessor {
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
    List<CobolLine> lines = reader.processLines(documentUri, cobolCode).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformation.transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = indicatorProcessor.processLines(transformedLines);

    TextTransformations code = writer.serialize(rewrittenLines, documentUri);
    return new ResultWithErrors<>(code, errors);
  }

  @Override
  public ResultWithErrors<OldExtendedDocument> processCleanCode(
      @NonNull String documentUri,
      @NonNull String cobolCode,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy) {
    return grammarPreprocessor.buildExtendedDocument(documentUri, cobolCode, copybookConfig, hierarchy);
  }
}
