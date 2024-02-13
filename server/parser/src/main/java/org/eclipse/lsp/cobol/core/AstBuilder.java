/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.hw.Diagnostic;

import java.util.List;

/**
 * A Cobol Parser Abstraction.
 */
public interface AstBuilder {
  /**
   * Produce AST of the source.
   *
   * @return the AST root node.
   */
  CobolParser.StartRuleContext runParser();

  /**
   * Get the tokens of input source.
   *
   * @return Token stream.
   */
  CommonTokenStream getTokens();

  /**
   * Diagnostics while producing AST
   * @return List of {@link Diagnostic} encountered while parsing
   */
  default List<Diagnostic> diagnostics() {
    return ImmutableList.of();
  }
}
