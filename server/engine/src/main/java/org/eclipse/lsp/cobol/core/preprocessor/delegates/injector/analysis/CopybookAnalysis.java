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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.DocumentMap;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingService;

import java.util.List;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

/**
 * This implementation of the {@link AbstractInjectCodeAnalysis} provides logic for plain COBOL logic
 * applying replacing if presents.
 */
class CopybookAnalysis extends AbstractInjectCodeAnalysis {
  private static final int MAX_COPYBOOK_NAME_LENGTH_DATASET = 8;

  private final ReplacingService replacingService;

  CopybookAnalysis(
      TextPreprocessor preprocessor,
      GrammarPreprocessor grammarPreprocessor,
      MessageService messageService,
      ReplacingService replacingService) {
    super(preprocessor, grammarPreprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DATASET);
    this.replacingService = replacingService;
  }

  @Override
  protected void handleReplacing(
          CopybookMetaData metaData, CopybookHierarchy hierarchy, DocumentMap copybookMap, List<SyntaxError> errors) {
    // In a chain of copy statement, there could be only one replacing phrase
    hierarchy.prepareCopybookReplacement(copybookMap.getUri());
    if (hierarchy.containsRecursiveReplacement())
      errors.add(
          addCopybookError(
              metaData.getCopybookName(),
              metaData.getNameLocality(),
              ERROR,
              "GrammarPreprocessorListener.copyBkNestedReplaceStmt",
              "Syntax error by handleReplacing: {}"));

    hierarchy.replaceCopybook(copybookMap, replacingService::applyReplacing, errors);
  }
}
