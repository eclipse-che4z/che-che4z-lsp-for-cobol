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
package com.ca.lsp.core.cobol.preprocessor.sub.document;

import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.semantics.SemanticContext;

import javax.annotation.Nonnull;

/**
 * Preprocessor which retrieves semantic elements definitions, such as variables, paragraphs and
 * copybooks
 */
public interface CobolSemanticParser {

  /**
   * Fills-in the semantic context of the current document, including elements from the copybooks
   *
   * @param code - COBOL program text to analyse
   * @param semanticContext - semantic context of the currently processed document to be filled in.
   * @param format - the format of the processing document
   * @return a PreprocessedInput - text and its semantic context with syntax errors if found or an
   *     empty list
   */
  @Nonnull
  ResultWithErrors<PreprocessedInput> processLines(
      @Nonnull String code,
      @Nonnull SemanticContext semanticContext,
      @Nonnull CobolSourceFormat format);
}
