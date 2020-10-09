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

package com.broadcom.lsp.cobol.core.visitor;

import lombok.experimental.UtilityClass;
import org.apache.commons.text.similarity.LevenshteinDistance;

import java.util.Optional;

import static java.util.Comparator.comparingInt;

/**
 * Calculates a distance between a processing token and keyword from the list of suggestions using a
 * Levenshtein algorithm.
 */
@UtilityClass
class MisspelledKeywordDistance {
  // TODO: Convert to singleton and provide injection

  private static final KeywordSuggestions KEYWORDS = new KeywordSuggestions();
  private static final LevenshteinDistance DISTANCE = LevenshteinDistance.getDefaultInstance();

  /**
   * Calculate a distance between the given token and all the keywords and find the closest one.
   *
   * @param wrongToken - potentially misspelled token to check
   * @return the closest keyword or null if nothing found
   */
  Optional<String> calculateDistance(String wrongToken) {
    return KEYWORDS.getSuggestions().stream()
        .map(item -> new Object[] {item, DISTANCE.apply(wrongToken, item)})
        .sorted(comparingInt(o -> (int) o[1]))
        .filter(item -> !wrongToken.equals(item[0]))
        .filter(item -> (int) item[1] < 2)
        .map(item -> item[0].toString())
        .findFirst();
  }
}
