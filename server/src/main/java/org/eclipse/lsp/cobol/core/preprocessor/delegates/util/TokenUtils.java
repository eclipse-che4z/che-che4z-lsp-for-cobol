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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.Token;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.antlr.v4.runtime.Lexer.HIDDEN;

/** Utility class for {@link org.antlr.v4.runtime.TokenStream} manipulation. */
@UtilityClass
public class TokenUtils {

  /**
   * Retrieve and join all tokens placed in the hidden channel to the left from a specified
   * position.
   *
   * @param tokPos current position in {@link BufferedTokenStream} while processing tokens
   * @param tokens {@link BufferedTokenStream} being processed.
   * @return A joined string in hidden Channel, to the left of tokPos.
   */
  public String retrieveHiddenTextToLeft(int tokPos, BufferedTokenStream tokens) {
    return ofNullable(tokens.getHiddenTokensToLeft(tokPos, HIDDEN))
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }

  /**
   * Retrieve and join all tokens placed in the hidden channel to the right from a specified
   * position.
   *
   * @param tokPos current position in {@link BufferedTokenStream} while processing tokens
   * @param tokens {@link BufferedTokenStream} being processed.
   * @return A joined string in hidden Channel, to the right of tokPos.
   */
  public String retrieveHiddenTextToRight(int tokPos, BufferedTokenStream tokens) {
    return ofNullable(tokens.getHiddenTokensToRight(tokPos, HIDDEN))
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }
}
