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
 */
package org.eclipse.lsp.cobol.parser.hw.lexer;

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
  private final int indexStart;
  private final int indexStop;
  private final String source;
  private final TokenType type;

  public Token(int line, int startPositionInLine, int indexStart, int indexStop, TokenType type, String source) {
    this.line = line;
    this.source = source;
    this.startPositionInLine = startPositionInLine;
    this.indexStart = indexStart;
    this.indexStop = indexStop;
    this.type = type;
  }

  /**
   * Get the size of lexeme
   * @return size of lexeme
   */
  public int length() {
    return indexStop - indexStart;
  }

  @Override
  public String toText() {
    return source.substring(indexStart, indexStop);
  }

  @Override
  public String toString() {
    return "Token{"
            + "line=" + line
            + ", startPositionInLine="
            + startPositionInLine
            // TODO: escape string?
            + ", lexeme='" + toText().replace("\n", "\\n") + '\''
            + ", index=[" + indexStart + ", " + indexStop + "]"
            + ", type=" + type
            + '}';
  }

  public String getLexeme() {
    // TODO: a good place for optimization maybe?
    return toText();
  }

  /* FIXME: Lexer should not create new instances of tokens even if it's a peek call */
  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Token token = (Token) o;
    return line == token.line && startPositionInLine == token.startPositionInLine && indexStart == token.indexStart && indexStop == token.indexStop && Objects.equals(source, token.source) && type == token.type;
  }

  @Override
  public int hashCode() {
    int result = line;
    result = 31 * result + startPositionInLine;
    result = 31 * result + indexStart;
    result = 31 * result + indexStop;
    result = 31 * result + Objects.hashCode(source);
    result = 31 * result + Objects.hashCode(type);
    return result;
  }
}
