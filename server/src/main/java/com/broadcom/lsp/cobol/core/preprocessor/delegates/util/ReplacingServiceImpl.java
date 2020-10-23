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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.util;

import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.tuple.Pair;

import lombok.NonNull;
import java.util.List;
import java.util.regex.Pattern;

import static java.lang.String.format;
import static java.util.regex.Matcher.quoteReplacement;

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

  @NonNull
  public String applyReplacing(
      @NonNull String text, @NonNull List<Pair<String, String>> replacePatterns) {
    return replacePatterns.stream().reduce(text, this::replace, (str1, str2) -> str2);
  }

  @NonNull
  @Override
  public Pair<String, String> retrievePseudoTextReplacingPattern(@NonNull String clause) {
    String[] pattern = retrievePattern(clause);
    return isPatternCorrect(pattern)
        ? Pair.of(extractPseudoText(pattern[0]).replace(" ", " +"), extractPseudoText(pattern[1]))
        : Pair.of("", "");
  }

  @NonNull
  @Override
  public Pair<String, String> retrieveTokenReplacingPattern(@NonNull String clause) {
    String[] pattern = retrievePattern(clause);
    return isPatternCorrect(pattern)
        ? Pair.of(getPatternForFullTokens(pattern[0]), getReplacementPattern(pattern[1]))
        : Pair.of("", "");
  }

  @NonNull
  private String[] retrievePattern(@NonNull String clause) {
    return clause.split("(?i)BY");
  }

  private boolean isPatternCorrect(@NonNull String[] pattern) {
    return pattern.length == 2;
  }

  /**
   * Get pattern that matches only full tokens
   *
   * @return pattern that matches only full tokens
   */
  @NonNull
  private String getPatternForFullTokens(@NonNull String text) {
    return format(SEPARATE_TOKEN_PATTERN, text.trim());
  }

  /**
   * Get a regex from string. Whitespace in COBOL replaceable patterns matches line breaks. Hence,
   * the replaceable search string has to be enhanced to a regex
   *
   * @return a regex for replaceable
   */
  @NonNull
  private String getReplacementPattern(@NonNull String text) {
    return quoteReplacement(text.trim());
  }

  /**
   * Extract the pseudo text-based pattern for replacing in accordance with COBOL rules. Double
   * equals chars should be removed at the beginning and at the end, all the whitespaces should be
   * collapsed.
   *
   * @param text a pseudo-text string
   * @return a pattern for replacing
   */
  @NonNull
  private String extractPseudoText(@NonNull String text) {
    return text.trim().replaceAll("^==", "").replaceAll("==$", "").replaceAll(" +", " ").trim();
  }

  @NonNull
  private String replace(@NonNull String text, @NonNull Pair<String, String> pattern) {
    String result = text;
    try {
      result = Pattern.compile(pattern.getLeft()).matcher(text).replaceAll(pattern.getRight());
    } catch (IndexOutOfBoundsException e) {
      LOG.error(format(ERROR_REPLACING, text, pattern.toString()), e);
    }
    return result;
  }
}
