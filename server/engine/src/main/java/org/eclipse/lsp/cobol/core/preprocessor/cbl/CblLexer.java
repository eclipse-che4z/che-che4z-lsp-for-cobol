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

import org.apache.commons.lang3.StringUtils;

/** CBL Lexer */
public class CblLexer {
  private final String uri;
  private final int line;
  private final String[] segments;
  private final int[] ranges;
  private final boolean full;

  private Integer pos = 0;
  private CblToken peeked = null;

  public CblLexer(String uri, String input, int line, boolean full) {
    this.uri = uri;
    this.line = line;
    this.segments = input.split("(?<=[(),'\"]|\\w\\b)|(?=[(),'\"]|\\b\\w+)");
    this.ranges = new int[segments.length + 1];
    for (int i = 0; i < segments.length; ++i) ranges[i + 1] = ranges[i] + segments[i].length();
    this.full = full;
  }

  public CblLexer(String uri, String input, int line) {
    this(uri, input, line, false);
  }

  CblToken peek() {
    if (peeked == null) {
      peeked = nextToken(false);
    }
    return peeked;
  }

  /**
   * Get the next token.
   *
   * @return the next token
   */
  public CblToken next() {
    return nextToken(true);
  }

  private CblToken nextToken(boolean consume) {
    int counter = pos;
    try {
      if (counter >= segments.length) {
        return CblToken.eof(uri, line);
      }
      String segment = segments[counter];
      if (StringUtils.isBlank(segment)) {
        counter++;
        if (full) {
          return new CblToken(uri, segment, line, ranges[counter - 1], ranges[counter]);
        }
      }
      if (counter >= segments.length) {
        return CblToken.eof(uri, line);
      }
      segment = segments[counter];
      counter++;
      return new CblToken(uri, segment, line, ranges[counter - 1], ranges[counter]);
    } finally {
      if (consume) {
        pos = counter;
        peeked = null;
      }
    }
  }

  /**
   * Checks whether there are more tokens.
   *
   * @return whether there are more tokens
   */
  public boolean hasMore() {
    return peek().getText() != null;
  }
}
