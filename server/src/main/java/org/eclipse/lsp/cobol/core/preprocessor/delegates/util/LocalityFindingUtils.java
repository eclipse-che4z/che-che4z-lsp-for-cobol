/*
 * Copyright (c) 2021 Broadcom.
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
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.Map;
import java.util.function.Predicate;

import static org.antlr.v4.runtime.Lexer.HIDDEN;

/**
 * Utilities for finding tokens that cannot be retrieved from the mapping. For example, embedded
 * languages may produce errors on the edge positions that don't belong to the mapping.
 */
@UtilityClass
public class LocalityFindingUtils {

  private static final int LOOK_BACK_ATTEMPTS_NUMBER = 5;
  /**
   * Find previous visible token before the given one and return its locality or null if not found.
   * It takes not more than 5 attempts to find the location to avoid the deep recursion.
   *
   * @param token to find previous visible locality
   * @param mapping A Map of Token to Locality for a document in analysis.
   * @return Locality for a passed token or null
   */
  public Locality findPreviousVisibleLocality(Token token, Map<Token, Locality> mapping) {
    return mapping.computeIfAbsent(
        token, it -> lookBackLocality(it.getTokenIndex(), mapping, LOOK_BACK_ATTEMPTS_NUMBER));
  }

  private Locality lookBackLocality(int index, Map<Token, Locality> mapping, int attemptsLeft) {
    if (attemptsLeft <= 0 || index < 0) return null;
    return mapping.entrySet().stream()
        .filter(indexMatchesAndIsVisible(index))
        .findAny()
        .map(Map.Entry::getValue)
        .orElseGet(() -> lookBackLocality(index - 1, mapping, attemptsLeft - 1));
  }

  private Predicate<Map.Entry<Token, Locality>> indexMatchesAndIsVisible(int index) {
    return it -> it.getKey().getTokenIndex() == index && it.getKey().getChannel() != HIDDEN;
  }
}
