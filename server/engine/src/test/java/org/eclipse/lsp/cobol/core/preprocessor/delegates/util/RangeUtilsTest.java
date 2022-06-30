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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.semantics.outline.NodeType;
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
    return new DocumentSymbol(
        "", NodeType.FIELD.getSymbolKind(), range, range, "", ImmutableList.of());
  }
}
