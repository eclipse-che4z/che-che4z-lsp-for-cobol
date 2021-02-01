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

package com.broadcom.lsp.cobol.core.semantics.outline;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.*;

/** Test to check RangeUtils */
class RangeUtilsTest {
  private Position firstLine = new Position(1, 0);
  private Position secondLine = new Position(2, 0);

  @Test
  void isAfterPositive() {
    assertTrue(RangeUtils.isAfter(secondLine, firstLine));
  }

  @Test
  void isAfterNegative() {
    assertFalse(RangeUtils.isAfter(firstLine, secondLine));
  }

  @Test
  void isBeforePositive() {
    assertTrue(RangeUtils.isBefore(firstLine, secondLine));
  }

  @Test
  void isBeforeNegative() {
    assertFalse(RangeUtils.isBefore(secondLine, firstLine));
  }

  @Test
  void isPositionsAreEquals() {
    assertFalse(RangeUtils.isAfter(firstLine, firstLine));
    assertFalse(RangeUtils.isBefore(secondLine, secondLine));
  }

  private static DocumentSymbol constructNode(
      int startLine, int startSymbol, int stopLine, int stopSymbol) {
    Range range =
        new Range(new Position(startLine, startSymbol), new Position(stopLine, stopSymbol));
    return new DocumentSymbol("", NodeType.FIELD.getSymbolKind(), range, range, "", ImmutableList.of());
  }

  static Stream<Arguments> provideData() {
    return Stream.of(
        Arguments.of(constructNode(1, 1, 10, 1), constructNode(3, 40, 5, 10), true),
        Arguments.of(constructNode(5, 1, 5, 20), constructNode(5, 3, 5, 10), true),
        Arguments.of(constructNode(4, 1, 6, 7), constructNode(3, 40, 6, 3), false),
        Arguments.of(constructNode(4, 1, 6, 8), constructNode(4, 5, 7, 5), false),
        Arguments.of(constructNode(2, 1, 2, 9), constructNode(3, 1, 3, 8), false),
        Arguments.of(constructNode(5, 1, 5, 20), constructNode(5, 3, 5, 30), false));
  }

  @ParameterizedTest
  @MethodSource("provideData")
  void isInside(DocumentSymbol first, DocumentSymbol second, boolean result) {
    assertEquals(result, RangeUtils.isInsideRange(first, second));
  }
}
