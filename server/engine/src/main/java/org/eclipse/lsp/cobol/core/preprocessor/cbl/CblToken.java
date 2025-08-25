/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblNodeTypes.TOKEN;

/** CBL Token */
public class CblToken extends CblNode {
  private final String text;
  private final CblTokenType tokenType;

  /** CBL Token
   * @param text - token text
   * @param start - token start position
   * @param end - token end position
   * @param type - token type
   */
  public CblToken(String uri, String text, int line, int start, int end, CblTokenType type) {
    super(uri, line, start, end, TOKEN);
    this.text = text;
    this.tokenType = type;
  }

  public String getText() {
    return text;
  }

  public CblTokenType getTokenType() {
    return tokenType;
  }

  @Override
  public String toString() {
    return "CblToken{" +
            "text='" + text + '\'' +
            ", start=" + getStart() +
            ", end=" + getEnd() +
            ", type=" + tokenType +
            '}';
  }

  /**
   * Provide CBL EOF token
   * @param uri - document URI
   * @param line - line number
   * @return CBL EOF token
   */
  public static CblToken eof(String uri, int line) {
    return new CblToken(uri, null, line,  -1, -1, CblTokenType.EOF);
  }
}

/** CBL Token type */
enum CblTokenType {
  CBL,
  GENERAL,
  PARENTHESIS_OPEN,
  PARENTHESIS_CLOSE,
  WHITESPACE,
  COMMA,
  QUOTE,
  APOSTROPHE,
  EOF
}
