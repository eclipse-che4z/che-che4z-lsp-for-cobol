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
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.PseudoTextContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceSameElementContext;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.antlr.v4.runtime.BufferedTokenStream;

import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils.getTextIncludingHiddenTokens;
import static java.util.Arrays.stream;
import static java.util.Optional.ofNullable;
import static java.util.regex.Matcher.quoteReplacement;
import static java.util.stream.Collectors.joining;
import static org.apache.commons.lang3.StringUtils.split;

/** A mapping from a replaceable to a replacement. */
@Data
@AllArgsConstructor
public class CobolReplacementMapping {

  private ReplaceSameElementContext replaceable;
  private ReplaceSameElementContext replacement;

  public String replace(String text, BufferedTokenStream tokens) {
    return Pattern.compile(getReplaceablePattern(replaceable, tokens))
        .matcher(text)
        .replaceAll(getReplacementPattern(replacement, tokens));
  }

  private String getReplaceablePattern(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    return ofNullable(ctx.pseudoText())
        .map(it -> getRegexFromReplaceable(extractPseudoText(it, tokens)))
        .orElse(getPatternForTokens(ctx, tokens));
  }

  /**
   * Get pattern that matches only full tokens
   *
   * @param ctx - context that contains pattern to be wrapped
   * @param tokens - tokens to extract the full token of pattern
   * @return pattern that matches only full tokens
   */
  private String getPatternForTokens(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    return "(?<=[\\.\\s\\r\\n])"
        + getRegexFromReplaceable(extractPlainText(ctx, tokens))
        + "(?=[\\.\\s\\r\\n])";
  }

  private String getReplacementPattern(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {

    return quoteReplacement(
        ofNullable(ctx.pseudoText())
            .map(it -> extractPseudoText(it, tokens))
            .orElse(extractPlainText(ctx, tokens)));
  }

  private String extractPlainText(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    if (ctx.charDataLine() != null) {
      return getTextIncludingHiddenTokens(ctx, tokens);
    } else if (ctx.cobolWord() != null) {
      return ctx.getText();
    } else if (ctx.literal() != null) {
      return ctx.literal().getText();
    }
    return "";
  }

  private String extractPseudoText(PseudoTextContext pseudoTextCtx, BufferedTokenStream tokens) {
    String pseudoText = getTextIncludingHiddenTokens(pseudoTextCtx, tokens).trim();
    return pseudoText.replaceAll("^==", "").replaceAll("==$", "").trim();
  }

  /**
   * Get a regex from string. Whitespace in Cobol replaceables matches line breaks. Hence, the
   * replaceable search string has to be enhanced to a regex
   */
  private String getRegexFromReplaceable(String replaceable) {
    return stream(split(ofNullable(replaceable).orElse("")))
        .map(Pattern::quote)
        .collect(joining("[\\r\\n\\s]+"));
  }
}
