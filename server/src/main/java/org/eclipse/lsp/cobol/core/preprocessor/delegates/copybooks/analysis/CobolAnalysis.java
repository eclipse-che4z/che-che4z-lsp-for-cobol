/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} provides logic for plain COBOL logic
 * applying replacing if presents.
 */
class CobolAnalysis extends AbstractCopybookAnalysis {
  private static final int MAX_COPYBOOK_NAME_LENGTH_DATASET = 8;

  private final CopybookService copybookService;
  private final ReplacingService replacingService;

  CobolAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService,
      ReplacingService replacingService) {
    super(preprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DATASET);
    this.copybookService = copybookService;
    this.replacingService = replacingService;
  }

  @Override
  protected CopybookModel getCopybookModel(CopybookName copybookName,
                                           String programDocumentUri,
                                           String documentUri,
                                           CopybookConfig copybookConfig) {
    return copybookService.resolve(
        copybookName,
        programDocumentUri,
        documentUri,
        copybookConfig,
        false);
  }

  @Override
  protected ResultWithErrors<String> handleReplacing(
      CopybookMetaData metaData, CopybookHierarchy hierarchy, String text) {
    // In a chain of copy statement, there could be only one replacing phrase
    List<SyntaxError> errors = new ArrayList<>();
    hierarchy.prepareCopybookReplacement();
    if (hierarchy.containsRecursiveReplacement())
      errors.add(
          addCopybookError(
              metaData.getCopybookName(),
              metaData.getNameLocality(),
              ERROR,
              "GrammarPreprocessorListener.copyBkNestedReplaceStmt",
              "Syntax error by handleReplacing: {}"));

    return new ResultWithErrors<>(
        hierarchy.replaceCopybook(text, replacingService::applyReplacing), errors);
  }
}
