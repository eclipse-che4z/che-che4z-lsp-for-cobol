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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorListener;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;

import java.util.List;
import java.util.Map;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
public interface GrammarPreprocessorListener extends CobolPreprocessorListener {

  /**
   * Get text of extended document, i.e. with all copybooks built in and replacing applied.
   *
   * @return text of extended document.
   */
  String getResult();

  /**
   * Get list of found syntax errors during building the extended document.
   *
   * @return list of errors.
   */
  List<SyntaxError> getErrors();

  /**
   * Get copybooks subcontext, including all the copybooks usages and definitions of the given
   * document.
   *
   * @return copybooks semantic subcontext.
   */
  NamedSubContext<Position> getCopybooks();

  /**
   * Get mappings of initial positions of the copybooks, used in this document.
   *
   * @return mappings of copybooks.
   */
  Map<String, List<Position>> getNestedMappings();
}
