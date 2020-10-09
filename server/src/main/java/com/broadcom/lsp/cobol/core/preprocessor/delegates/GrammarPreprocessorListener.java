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
package com.broadcom.lsp.cobol.core.preprocessor.delegates;

import com.broadcom.lsp.cobol.core.model.ExtendedDocument;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorListener;

import java.util.List;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
public interface GrammarPreprocessorListener extends CobolPreprocessorListener {

  /**
   * Get list of found syntax errors during building the extended document.
   *
   * @return list of errors.
   */
  List<SyntaxError> getErrors();

  /**
   * Get the extended document of the COBOL file and the used copybooks.
   *
   * @return extended document
   */
  ExtendedDocument getResult();
}
