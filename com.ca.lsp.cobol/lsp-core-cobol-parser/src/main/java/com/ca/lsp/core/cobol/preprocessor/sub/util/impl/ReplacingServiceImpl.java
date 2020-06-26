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

package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.PseudoTextContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceSameElementContext;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolReplacementMapping;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.BufferedTokenStream;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.regex.Pattern;

import static java.util.Arrays.stream;
import static java.util.Optional.ofNullable;
import static java.util.regex.Matcher.quoteReplacement;
import static java.util.stream.Collectors.joining;
import static org.apache.commons.lang3.StringUtils.split;

/**
 * This service applies replacing for given text by replace clauses and tokens. It may work with
 * REPLACING and REPLACE statements.
 */
@Singleton
public class ReplacingServiceImpl implements ReplacingService {

  @Nonnull
  public String applyReplacing(
      @Nonnull String text,
      @Nonnull List<ReplaceClauseContext> replaceClauses,
      @Nonnull BufferedTokenStream tokens) {
    return replaceClauses.stream()
        .map(
            it ->
                new CobolReplacementMapping(
                    it.replaceable().replaceSameElement(), it.replacement().replaceSameElement()))
        .reduce(
            text, (replaced, pattern) -> replace(replaced, pattern, tokens), (str1, str2) -> str2);
  }

  private String replace(String text, CobolReplacementMapping pattern, BufferedTokenStream tokens) {
    return Pattern.compile(getReplaceablePattern(pattern.getReplaceable(), tokens))
        .matcher(text)
        .replaceAll(getReplacementPattern(pattern.getReplacement(), tokens));
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
      return TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    } else if (ctx.cobolWord() != null) {
      return ctx.getText();
    } else if (ctx.literal() != null) {
      return ctx.literal().getText();
    }
    return "";
  }

  private String extractPseudoText(PseudoTextContext pseudoTextCtx, BufferedTokenStream tokens) {
    String pseudoText = TokenUtils.getTextIncludingHiddenTokens(pseudoTextCtx, tokens).trim();
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
