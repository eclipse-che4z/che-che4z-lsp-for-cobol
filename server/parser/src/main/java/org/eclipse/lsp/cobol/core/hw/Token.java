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
package org.eclipse.lsp.cobol.core.hw;

import lombok.Getter;
import org.eclipse.lsp.cobol.core.cst.base.CstNodeImpl;

/**
 * Token node.
 */
@Getter
public class Token extends CstNodeImpl {
  private final int line;
  private final int startPositionInLine;
  private final int index;
  private final String lexeme;
  private final TokenType type;

  public Token(String lexeme, int line, int startPositionInLine, int index, TokenType type) {
    this.line = line;
    this.lexeme = lexeme;
    this.startPositionInLine = startPositionInLine;
    this.index = index;
    this.type = type;
  }

  /**
   * Get the size of lexeme
   * @return size of lexeme
   */
  public int length() {
    return lexeme.length();
  }

  @Override
  public String toText() {
    return lexeme;
  }
}
