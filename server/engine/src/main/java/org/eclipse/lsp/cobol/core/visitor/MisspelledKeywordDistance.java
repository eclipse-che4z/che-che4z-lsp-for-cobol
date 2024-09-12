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

package org.eclipse.lsp.cobol.core.visitor;

import lombok.experimental.UtilityClass;
import org.apache.commons.text.similarity.LevenshteinDistance;

import java.util.Optional;

import static java.util.Comparator.comparingInt;
import static java.util.stream.Collectors.toList;

import java.util.List;

/**
 * Calculates a distance between a processing token and keyword from the list of suggestions using a
 * Levenshtein algorithm.
 */
@UtilityClass
public class MisspelledKeywordDistance {

  public static final KeywordSuggestions KEYWORDS = new KeywordSuggestions();
  private static final LevenshteinDistance DISTANCE = LevenshteinDistance.getDefaultInstance();
  private static final List<String> SORTED_KEYWORDS = KEYWORDS.getSuggestions().stream()
      .sorted(comparingInt(s -> s.length())).collect(toList());
  private static final int DIST_LIMIT = 2;

  /**
   * Calculate a distance between the given token and all the keywords and find the closest one.
   *
   * @param wrongToken - potentially misspelled token to check
   * @return the closest keyword or null if nothing found
   */
  public Optional<String> calculateDistance(String wrongToken) {
    return SORTED_KEYWORDS.stream()
        .filter(s -> Math.abs(s.length() - wrongToken.length()) < DIST_LIMIT)
        .map(item -> new Object[] {item, DISTANCE.apply(wrongToken, item)})
        .filter(item -> (int) item[1] < DIST_LIMIT)
        .sorted(comparingInt(o -> (int) o[1]))
        .map(item -> item[0].toString())
        .findFirst();
  }
}
