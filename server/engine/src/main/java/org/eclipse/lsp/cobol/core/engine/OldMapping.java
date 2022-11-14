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
package org.eclipse.lsp.cobol.core.engine;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityMappingUtils;
import org.eclipse.lsp4j.Location;

import java.util.Comparator;
import java.util.Map;
import java.util.Optional;
import java.util.function.Predicate;

/**
 * The old mapping logic wrapper
 */
@Deprecated
public class OldMapping {
  private static final int RANGE_LOOK_BACK_TOKENS = 5;
  private final Map<Token, Locality> map;

  public OldMapping(Map<Token, Locality> map) {
    this.map = map;
  }
  public OldMapping(
          String documentUri,
          ExtendedDocument extendedDocument,
          CommonTokenStream tokens,
          Map<Token, EmbeddedCode> embeddedCodeParts,
          ExtendedSource extendedSource) {
    Map<org.antlr.v4.runtime.Token, Locality> mapping =
            LocalityMappingUtils.createPositionMapping(
                    tokens.getTokens(),
                    extendedDocument.getDocumentMapping(),
                    documentUri,
                    embeddedCodeParts);
    mapping.forEach(
            (k, v) -> {
              if (v.getUri().equals(documentUri)) {
                Location l = extendedSource.mapLocation(v.getRange());

                v.getRange().setStart(l.getRange().getStart());
                v.getRange().setEnd(l.getRange().getEnd());
                v.setUri(l.getUri());
              }
            });
    map = mapping;
  }

  /**
   * Map a token.
   * @param token toking to map
   * @return location of token
   */
  public Locality map(Token token) {
    return map.get(token);
  }

  /**
   * Map a token.
   * @param token toking to map
   * @param ifAbsent a value to use in case of missing data about token
   * @return location of token
   */
  public Locality map(Token token, Locality ifAbsent) {
    return map.computeIfAbsent(token, (it) -> ifAbsent);
  }

  private Map.Entry<Token, Locality> lookBackLocality(int index) {
    if (index < 0) {
      return null;
    }

    return map.entrySet().stream()
            .filter(previousIndexes(index))
            .filter(isNotHidden())
            .max(Comparator.comparingInt(it -> it.getKey().getTokenIndex()))
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

  /**
   * Find previous visible token before the given one and return its locality or null if not found.
   * Checks at most RANGE_LOOK_BACK_TOKENS previous tokens. For example, embedded languages may
   * produce errors on the edge positions that don't belong to the mapping.
   *
   * @param tokenIndex to find previous visible locality
   * @return Locality for a passed token or null
   */
  public Locality findPreviousVisibleLocality(int tokenIndex) {
    return Optional.ofNullable(lookBackLocality(tokenIndex))
        .map(e ->  map(e.getKey(), e.getValue()))
        .orElse(null);
  }
}
