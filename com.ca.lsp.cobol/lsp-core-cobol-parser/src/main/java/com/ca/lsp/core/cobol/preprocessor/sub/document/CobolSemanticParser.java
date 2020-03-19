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
package com.ca.lsp.core.cobol.preprocessor.sub.document;

import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;

import javax.annotation.Nonnull;
import java.util.Deque;

/**
 * Preprocessor which retrieves semantic elements definitions, such as variables, paragraphs and
 * copybooks
 */
public interface CobolSemanticParser {

  /**
   * Fills-in the semantic context of the current document, including elements from the copybooks
   *
   * @param code - COBOL program text to analyse
   * @param textDocumentSyncType - reflect the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return a PreprocessedInput - text and its semantic context with syntax errors if found or an
   *     empty list
   */
  @Nonnull
  ResultWithErrors<PreprocessedInput> processLines(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType);
}
