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

package org.eclipse.lsp.cobol.common.utils;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.model.NodeSymbolType;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Test to check RangeUtils */
class RangeUtilsTest {
  private final Position firstLine = new Position(1, 0);
  private final Position secondLine = new Position(2, 0);
  private final Position thirdLine = new Position(3, 0);
  private final Position forthLine = new Position(4, 0);
  private final Range firstRange = new Range(firstLine, forthLine);
  private final Range secondRange = new Range(secondLine, thirdLine);

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
  void isInsidePositive() {
    assertTrue(RangeUtils.isInside(secondRange, firstRange));
  }

  @Test
  void isInsideNegative() {
    assertFalse(RangeUtils.isInside(firstRange, secondRange));
  }
  @Test
  void isPositionsAreEquals() {
    assertFalse(RangeUtils.isAfter(firstLine, firstLine));
    assertFalse(RangeUtils.isBefore(secondLine, secondLine));
  }

  @Test
  void testShiftRangeWithPosition() {
    Position position = new Position(5, 10);
    Range range = new Range(new Position(2, 3), new Position(7, 8));
    Range expectedRange = new Range(new Position(7, 3), new Position(12, 8));
    Range result = RangeUtils.shiftRangeWithPosition(position, range);
    assertTrue(expectedRange.equals(result));
  }

  @Test
  void testExtendByCharacter() {
    Range range = new Range(new Position(1, 2), new Position(3, 4));
    int count = 5;
    Range expectedRange = new Range(new Position(1, 2), new Position(3, 9));
    Range result = RangeUtils.extendByCharacter(range, count);
    assertTrue(expectedRange.equals(result));
  }

  @Test
  void testMoveByLine() {
    Range range = new Range(new Position(1, 2), new Position(3, 4));
    int count = 2;
    Range expectedRange = new Range(new Position(3, 2), new Position(5, 4));
    Range result = RangeUtils.moveByLine(range, count);
    assertTrue(expectedRange.equals(result));
  }

  private static DocumentSymbol constructNode(
      int startLine, int startSymbol, int stopLine, int stopSymbol) {
    Range range =
        new Range(new Position(startLine, startSymbol), new Position(stopLine, stopSymbol));
    return new DocumentSymbol(
        "", NodeSymbolType.FIELD.getSymbolKind(), range, range, "", ImmutableList.of());
  }
}
