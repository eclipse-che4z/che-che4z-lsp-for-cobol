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

/** CBL Token */
public class CblToken extends CblNode {
  public static final CblToken EOF = new CblToken(null, -1, -1, CblTokenType.EOF);
  private final String text;
  private final CblTokenType type;

  /** CBL Token
   * @param text - token text
   * @param start - token start position
   * @param end - token end position
   * @param type - token type
   */
  public CblToken(String text, int start, int end, CblTokenType type) {
    super(start, end);
    this.text = text;
    this.type = type;
  }

  public String getText() {
    return text;
  }

  public CblTokenType getTokenType() {
    return type;
  }

  @Override
  public String toString() {
    return "CblToken{" +
            "text='" + text + '\'' +
            ", start=" + getStart() +
            ", end=" + getEnd() +
            ", type=" + type +
            '}';
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
