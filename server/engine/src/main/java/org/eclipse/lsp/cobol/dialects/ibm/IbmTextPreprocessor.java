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

import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.validator.ExtendedDocumentValidation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.validator.StringClosedCorrectlyValidator;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

/**
 * This class re-writes the content of the analyzing file to simplify the processing by the grammar,
 * e.g. removes comments or cleans-up the comment and sequence areas. See the delegates for more
 * details.
 */
@Slf4j
public class IbmTextPreprocessor implements CleanerPreprocessor {
  private final CobolLineReader reader;
  private final CobolLineWriter writer;
  private final CobolLinesTransformation transformation;
  private final CobolLineReWriter indicatorProcessor;
  private final ExtendedDocumentValidation extendedDocumentValidation;

  public IbmTextPreprocessor(MessageService messageService, CodeLayoutStore layoutStore) {
    this.reader = new IbmCobolLineReader(messageService, layoutStore);
    this.writer = new IbmCobolLineWriter(layoutStore);
    this.transformation = new IbmCobolContinuationLineTransformation(messageService, layoutStore);
    this.indicatorProcessor = new IbmCobolLineIndicatorProcessor(layoutStore);
    this.extendedDocumentValidation = new StringClosedCorrectlyValidator(messageService);
  }

  @Override
  public ResultWithErrors<ExtendedText> cleanUpCode(String documentUri, String cobolCode) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> lines = reader.processLines(documentUri, cobolCode).unwrap(errors::addAll);
    List<CobolLine> transformedLines = transformation.transformLines(documentUri, lines).unwrap(errors::addAll);
    List<CobolLine> rewrittenLines = indicatorProcessor.processLines(transformedLines);

    ExtendedDocument code = writer.serialize(rewrittenLines, documentUri);
    errors.addAll(extendedDocumentValidation.validateLines(code));
    return new ResultWithErrors<>(code.getCurrentText(), errors);
  }
}
