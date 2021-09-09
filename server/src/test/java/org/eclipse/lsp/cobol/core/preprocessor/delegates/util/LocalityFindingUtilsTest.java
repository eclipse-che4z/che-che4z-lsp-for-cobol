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

import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.when;

/** This test checks that {@link LocalityFindingUtils} works as expected */
class LocalityFindingUtilsTest {
  @Test
  void testLocalityFindingPositive() {
    Locality notExpected = Locality.builder().uri("notExpected").build();
    Locality expected = Locality.builder().uri("expected").build();

    Token placeholderToken = Mockito.mock(Token.class);
    Token correctToken = Mockito.mock(Token.class);

    when(placeholderToken.getTokenIndex()).thenReturn(0);
    when(correctToken.getTokenIndex()).thenReturn(1);

    Map<Token, Locality> positions = new HashMap<>();
    positions.put(placeholderToken, notExpected);
    positions.put(correctToken, expected);

    Locality result = LocalityFindingUtils.findPreviousVisibleLocality(correctToken, positions);
    assertEquals(expected, result);
  }

  @Test
  void testLocalityFindingWithLookBack() {
    Locality notExpected = Locality.builder().uri("notExpected").build();
    Locality expected = Locality.builder().uri("expected").build();

    Token correctToken = Mockito.mock(Token.class);
    Token hiddenToken1 = Mockito.mock(Token.class);
    Token hiddenToken2 = Mockito.mock(Token.class);
    Token tokenToCheck = Mockito.mock(Token.class);

    when(correctToken.getTokenIndex()).thenReturn(0);
    when(hiddenToken1.getTokenIndex()).thenReturn(1);
    when(hiddenToken2.getTokenIndex()).thenReturn(2);
    when(tokenToCheck.getTokenIndex()).thenReturn(3);

    when(correctToken.getChannel()).thenReturn(0);
    // HIDDEN channel number
    when(hiddenToken1.getChannel()).thenReturn(1);
    when(hiddenToken2.getChannel()).thenReturn(1);

    Map<Token, Locality> positions = new HashMap<>();
    positions.put(correctToken, expected);
    positions.put(hiddenToken1, notExpected);
    positions.put(hiddenToken2, notExpected);

    Locality result = LocalityFindingUtils.findPreviousVisibleLocality(tokenToCheck, positions);
    assertEquals(expected, result);
  }

  @Test
  void testLocalityFindingTakesOnlyFiveAttempts() {
    Locality notExpected = Locality.builder().uri("notExpected").build();
    Locality expected = Locality.builder().uri("expected").build();

    Token correctToken = Mockito.mock(Token.class);
    Token hiddenToken1 = Mockito.mock(Token.class);
    Token hiddenToken2 = Mockito.mock(Token.class);
    Token hiddenToken3 = Mockito.mock(Token.class);
    Token hiddenToken4 = Mockito.mock(Token.class);
    Token hiddenToken5 = Mockito.mock(Token.class);
    Token tokenToCheck = Mockito.mock(Token.class);

    when(correctToken.getTokenIndex()).thenReturn(0);
    when(hiddenToken1.getTokenIndex()).thenReturn(1);
    when(hiddenToken2.getTokenIndex()).thenReturn(2);
    when(hiddenToken3.getTokenIndex()).thenReturn(3);
    when(hiddenToken4.getTokenIndex()).thenReturn(4);
    when(hiddenToken5.getTokenIndex()).thenReturn(5);
    when(tokenToCheck.getTokenIndex()).thenReturn(6);

    when(correctToken.getChannel()).thenReturn(0);
    // HIDDEN channel number
    when(hiddenToken1.getChannel()).thenReturn(1);
    when(hiddenToken2.getChannel()).thenReturn(1);
    when(hiddenToken3.getChannel()).thenReturn(1);
    when(hiddenToken4.getChannel()).thenReturn(1);
    when(hiddenToken5.getChannel()).thenReturn(1);

    Map<Token, Locality> positions = new HashMap<>();
    positions.put(correctToken, expected);
    positions.put(hiddenToken1, notExpected);
    positions.put(hiddenToken2, notExpected);
    positions.put(hiddenToken3, notExpected);
    positions.put(hiddenToken4, notExpected);
    positions.put(hiddenToken5, notExpected);

    Locality result = LocalityFindingUtils.findPreviousVisibleLocality(tokenToCheck, positions);
    assertNull(result);
  }

  @Test
  void testLocalityFindingWithFarIndex() {
    Locality notExpected = Locality.builder().uri("notExpected").build();
    Locality expected = Locality.builder().uri("expected").build();

    Token correctToken = Mockito.mock(Token.class);
    Token hiddenToken = Mockito.mock(Token.class);
    Token tokenToCheck = Mockito.mock(Token.class);

    when(correctToken.getTokenIndex()).thenReturn(0);
    when(hiddenToken.getTokenIndex()).thenReturn(1);
    // The index is further than 5 attempts of reverse lookup, so the correctToken won't be found
    when(tokenToCheck.getTokenIndex()).thenReturn(6);

    when(correctToken.getChannel()).thenReturn(0);
    // HIDDEN channel number
    when(hiddenToken.getChannel()).thenReturn(1);

    Map<Token, Locality> positions = new HashMap<>();
    positions.put(correctToken, expected);
    positions.put(hiddenToken, notExpected);

    Locality result = LocalityFindingUtils.findPreviousVisibleLocality(tokenToCheck, positions);
    assertNull(result);
  }
}
