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

import java.util.Comparator;
import java.util.Map;
import java.util.function.Predicate;

/**
 * Utilities for finding tokens that cannot be retrieved from the mapping. For example, embedded
 * languages may produce errors on the edge positions that don't belong to the mapping.
 */
@UtilityClass
public class LocalityFindingUtils {

  private static final int RANGE_LOOK_BACK_TOKENS = 5;
  /**
   * Find previous visible token before the given one and return its locality or null if not found.
   * Checks at most RANGE_LOOK_BACK_TOKENS previous tokens.
   *
   * @param token to find previous visible locality
   * @param mapping A Map of Token to Locality for a document in analysis.
   * @return Locality for a passed token or null
   */
  public Locality findPreviousVisibleLocality(Token token, Map<Token, Locality> mapping) {
    return mapping.computeIfAbsent(token, it -> lookBackLocality(it.getTokenIndex(), mapping));
  }

  private Locality lookBackLocality(int index, Map<Token, Locality> mapping) {
    if (index < 0) return null;
    return mapping.entrySet().stream()
        .filter(previousIndexes(index))
        .filter(isNotHidden())
        .max(Comparator.comparingInt(it -> it.getKey().getTokenIndex()))
        .map(Map.Entry::getValue)
        .orElse(null);
  }

  private Predicate<Map.Entry<Token, Locality>> isNotHidden() {
    return it -> it.getKey().getChannel() != Token.HIDDEN_CHANNEL;
  }

  private Predicate<Map.Entry<Token, Locality>> previousIndexes(int index) {
    return it ->
        it.getKey().getTokenIndex() <= index
            && it.getKey().getTokenIndex() >= index - RANGE_LOOK_BACK_TOKENS;
  }
}
