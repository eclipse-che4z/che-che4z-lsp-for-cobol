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
package org.eclipse.lsp.cobol.parser.hw;

import lombok.Getter;
import org.eclipse.lsp.cobol.cst.base.CstNodeImpl;

import java.util.Objects;

/**
 * Token node.
 */
@Getter
public class Token extends CstNodeImpl {
  public static final int PRIME = 31;
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

  @Override
  public String toString() {
    return "Token{"
            + "line=" + line
            + ", startPositionInLine="
            + startPositionInLine
            + ", lexeme='" + lexeme + '\''
            + ", index=" + index
            + ", type=" + type
            + '}';
  }

  /* FIXME: Lexer should not create new instances of tokens even if it's a peek call */
  @Override
  public final boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Token)) return false;

    Token token = (Token) o;
    return line == token.line && startPositionInLine == token.startPositionInLine && index == token.index && Objects.equals(lexeme, token.lexeme) && type == token.type;
  }

  @Override
  public int hashCode() {
    int result = line;
    result = PRIME * result + startPositionInLine;
    result = PRIME * result + index;
    result = PRIME * result + Objects.hashCode(lexeme);
    result = PRIME * result + Objects.hashCode(type);
    return result;
  }
}
