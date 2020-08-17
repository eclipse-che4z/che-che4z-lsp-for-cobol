/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *   Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.visitor;

import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

/** Test a Levenshtein distance calculation for the misspelled words. */
class MisspelledKeywordDistanceTest {

  /** Test the distance between wrong token and the keyword. */
  @Test
  void testSuggestionWithShortDistance() {
    Optional<String> moves = MisspelledKeywordDistance.calculateDistance("MOVES");
    assertEquals("MOVE", moves.orElse(""));
  }

  /** Test no suggestions returned if the distance to the closest keyword is too long. */
  @Test
  void testTooLongDistanceNotPresent() {
    Optional<String> moves = MisspelledKeywordDistance.calculateDistance("123");
    assertFalse(moves.isPresent());
  }

  /** Test no suggestions with properties-file comments returned */
  @Test
  void testNoCommentSuggestions() {
    Optional<String> moves = MisspelledKeywordDistance.calculateDistance("#");
    assertFalse(moves.isPresent());
  }
}
