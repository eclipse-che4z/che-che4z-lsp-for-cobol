/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nullable;
import java.util.Comparator;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;

/** Utilities for Locality building and retrieving */
@UtilityClass
public class LocalityUtils {

  private static final int RANGE_LOOK_BACK_TOKENS = 5;

  /**
   * Build a locality from the given context, document uri and the current copybook.
   *
   * @param context context to retrieve the position range
   * @param documentUri uri of the current document
   * @param copybookId the id of the current copybook
   * @return locality pointing to the context in the current document
   */
  @NonNull
  public Locality buildLocality(
      ParserRuleContext context, String documentUri, @Nullable String copybookId) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(copybookId)
        .range(retrieveRange(context.getStart(), context.getStop()))
        .recognizer(LocalityUtils.class)
        .build();
  }

  /**
   * Create a functor to turn a token into a locality using the current document URI and the current
   * copybook.
   *
   * @param documentUri uri of the current document
   * @param copybookId the id of the current copybook
   * @return a functor Token -> Locality
   */
  @NonNull
  public Function<Token, Locality> toLocality(String documentUri, @Nullable String copybookId) {
    return token ->
        Locality.builder()
            .uri(documentUri)
            .copybookId(copybookId)
            .range(retrieveRange(token, token))
            .token(token.getText())
            .recognizer(LocalityUtils.class)
            .build();
  }

  /**
   * Find previous visible token before the given one and return its locality or null if not found.
   * Checks at most RANGE_LOOK_BACK_TOKENS previous tokens. For example, embedded languages may
   * produce errors on the edge positions that don't belong to the mapping.
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

  private Range retrieveRange(Token start, Token stop) {
    return new Range(getStartPosition(start), getStopPosition(stop));
  }

  private Position getStartPosition(Token token) {
    return new Position(token.getLine() - 1, token.getCharPositionInLine());
  }

  private Position getStopPosition(Token token) {
    return new Position(
        token.getLine() - 1,
        token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
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
