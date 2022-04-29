/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.model;

import com.google.common.collect.ImmutableList;
import lombok.Value;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

import java.util.List;

/**
 * This value class represents an output of embedded code parser. It is used for mapping purposes.
 * Shift means a difference between the last and first token indices of the initial embedded code
 * lexing, i.e. provided by the COBOL lexer.
 */
@Value
public class EmbeddedCode {
  ParserRuleContext tree;
  CommonTokenStream tokenStream;
  int shift;

  /**
   * Get a list of tokens skipping end of file.
   *
   * @return tokens without EOF token
   */
  public List<Token> getTokens() {
    if (tokenStream.getTokens().size() < 2) return ImmutableList.of();
    return tokenStream.getTokens(0, tokenStream.size() - 2);
  }
}
