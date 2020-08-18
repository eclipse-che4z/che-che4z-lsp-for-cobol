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

import com.ca.lsp.core.cobol.parser.CobolPreprocessor.ReplaceClauseContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessor.ReplacePseudoTextContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessor.ReplaceSameElementContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.apache.commons.lang3.tuple.Pair;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.parser.CobolPreprocessor.ReplaceliteralContext;
import static java.lang.String.format;
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
@Slf4j
public class ReplacingServiceImpl implements ReplacingService {
  /**
   * Look-before and look-ahead pattern to check that the token wrapped with separators, i.e.
   * whitespaces, dots ot line breaks. Not includes separators to the found substring.
   */
  private static final String SEPARATE_TOKEN_PATTERN = "(?<=[\\.\\s\\r\\n])%s(?=[\\.\\s\\r\\n])";

  private static final String ERROR_REPLACING = "Error replacing on text: %s with the pattern: %s";

  private TokenUtils tokenUtils;

  @Inject
  ReplacingServiceImpl(TokenUtils tokenUtils) {
    this.tokenUtils = tokenUtils;
  }

  @Nonnull
  public String applyReplacing(
      @Nonnull String text,
      @Nonnull List<ReplaceClauseContext> replaceClauses,
      @Nonnull BufferedTokenStream tokens) {
    return replaceClauses.stream()
        .map(toReplacingPatterns(tokens))
        .reduce(text, this::replace, (str1, str2) -> str2);
  }

  private Function<ReplaceClauseContext, Pair<String, String>> toReplacingPatterns(
      @Nonnull BufferedTokenStream tokens) {
    return clause ->
        ofNullable(clause.replaceliteral())
            .map(literal -> retrieveReplaceLiteral(literal, tokens))
            .orElse(
                ofNullable(clause.replacePseudoText())
                    .map(pseudoText -> retrieveReplacePseudoText(pseudoText, tokens))
                    .orElse(null));
  }

  private Pair<String, String> retrieveReplaceLiteral(
      ReplaceliteralContext ctx, BufferedTokenStream tokens) {
    return Pair.of(
        getPatternForTokens(ctx.replaceable().replaceSameElement(), tokens),
        getReplacementPattern(ctx.replacement().replaceSameElement(), tokens));
  }

  private String getReplacementPattern(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    return quoteReplacement(extractPlainText(ctx, tokens));
  }

  private Pair<String, String> retrieveReplacePseudoText(
      ReplacePseudoTextContext ctx, BufferedTokenStream tokens) {
    return Pair.of(
        // ignore number of whitespaces
        extractPseudoText(ctx.pseudoReplaceable(), tokens).replace(" ", " +"),
        extractPseudoText(ctx.pseudoReplacement(), tokens));
  }

  private String replace(String text, Pair<String, String> pattern) {
    String result = text;
    try {
      result = Pattern.compile(pattern.getLeft()).matcher(text).replaceAll(pattern.getRight());
    } catch (IndexOutOfBoundsException e) {
      LOG.error(String.format(ERROR_REPLACING, text, pattern.toString()), e);
    }
    return result;
  }

  /**
   * Get pattern that matches only full tokens
   *
   * @param ctx - context that contains pattern to be wrapped
   * @param tokens - tokens to extract the full token of pattern
   * @return pattern that matches only full tokens
   */
  private String getPatternForTokens(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    return format(SEPARATE_TOKEN_PATTERN, getRegexFromReplaceable(extractPlainText(ctx, tokens)));
  }

  private String extractPlainText(ReplaceSameElementContext ctx, BufferedTokenStream tokens) {
    if (ctx.charDataLine() != null) {
      return tokenUtils.retrieveTextIncludingHiddenTokens(ctx, tokens);
    } else if (ctx.cobolWord() != null) {
      return ctx.getText();
    } else if (ctx.literal() != null) {
      return ctx.literal().getText();
    }
    return "";
  }

  /**
   * Extract the pseudo text-based pattern for replacing in accordance with COBOL rules. Double
   * equals chars should be removed at the beginning and at the end, all the whitespaces should be
   * collapsed.
   *
   * @param pseudoTextCtx - context for pseudo text
   * @param tokens - token to retrieve the pattern
   * @return a pattern for replacing
   */
  private String extractPseudoText(ParseTree pseudoTextCtx, BufferedTokenStream tokens) {
    return tokenUtils
        .retrieveTextIncludingHiddenTokens(pseudoTextCtx, tokens)
        .trim()
        .replaceAll("^==", "")
        .replaceAll("==$", "")
        .replaceAll(" +", " ")
        .trim();
  }

  /**
   * Get a regex from string. Whitespace in COBOL replaceable patterns matches line breaks. Hence,
   * the replaceable search string has to be enhanced to a regex
   *
   * @return a regex for replaceable
   */
  private String getRegexFromReplaceable(String replaceable) {
    return stream(split(ofNullable(replaceable).orElse("")))
        .map(Pattern::quote)
        .collect(joining("[\\r\\n\\s]+"));
  }
}
