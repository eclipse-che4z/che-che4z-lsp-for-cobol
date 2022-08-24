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
package org.eclipse.lsp.cobol.core.engine;

import org.eclipse.lsp.cobol.core.engine.mapping.MappingHelper;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test class for {@link MappingHelper}
 */
class MappingHelperTest {
  @Test
  void testSplitMiddle() {
    Range bigRange = new Range(new Position(), new Position(10, 80));
    Range splitter = new Range(new Position(5, 5), new Position(6, 4));
    List<Range> ranges = MappingHelper.split(splitter, bigRange);

    assertEquals(3, ranges.size());

    assertEquals(0, ranges.get(0).getStart().getLine());
    assertEquals(0, ranges.get(0).getStart().getCharacter());
    assertEquals(5, ranges.get(0).getEnd().getLine());
    assertEquals(4, ranges.get(0).getEnd().getCharacter());

    assertEquals(6, ranges.get(1).getStart().getLine());
    assertEquals(5, ranges.get(1).getStart().getCharacter());
    assertEquals(6, ranges.get(1).getEnd().getLine());
    assertEquals(80, ranges.get(1).getEnd().getCharacter());

    assertEquals(7, ranges.get(2).getStart().getLine());
    assertEquals(0, ranges.get(2).getStart().getCharacter());
    assertEquals(10, ranges.get(2).getEnd().getLine());
    assertEquals(80, ranges.get(2).getEnd().getCharacter());
  }

  @Test
  void testConcatMiddle() {
    Range bigRange = new Range(new Position(), new Position(10, 80));
    Range splitter = new Range(new Position(5, 5), new Position(6, 4));
    List<Range> ranges = MappingHelper.concat(splitter, bigRange);

    assertEquals(3, ranges.size());

    assertEquals(0, ranges.get(0).getStart().getLine());
    assertEquals(0, ranges.get(0).getStart().getCharacter());
    assertEquals(5, ranges.get(0).getEnd().getLine());
    assertEquals(4, ranges.get(0).getEnd().getCharacter());

    assertEquals(5, ranges.get(1).getStart().getLine());
    assertEquals(5, ranges.get(1).getStart().getCharacter());
    assertEquals(5, ranges.get(1).getEnd().getLine());
    assertEquals(80, ranges.get(1).getEnd().getCharacter());

    assertEquals(6, ranges.get(2).getStart().getLine());
    assertEquals(0, ranges.get(2).getStart().getCharacter());
    assertEquals(9, ranges.get(2).getEnd().getLine());
    assertEquals(80, ranges.get(2).getEnd().getCharacter());
  }

  @Test
  void testSplitFullLineMiddle() {
    Range bigRange = new Range(new Position(), new Position(10, 80));
    Range splitter = new Range(new Position(5, 0), new Position(5, 80));
    List<Range> ranges = MappingHelper.split(splitter, bigRange);

    assertEquals(3, ranges.size());

    assertEquals(0, ranges.get(0).getStart().getLine());
    assertEquals(0, ranges.get(0).getStart().getCharacter());
    assertEquals(4, ranges.get(0).getEnd().getLine());
    assertEquals(80, ranges.get(0).getEnd().getCharacter());

    assertEquals(6, ranges.get(1).getStart().getLine());
    assertEquals(0, ranges.get(1).getStart().getCharacter());
    assertEquals(6, ranges.get(1).getEnd().getLine());
    assertEquals(80, ranges.get(1).getEnd().getCharacter());

    assertEquals(7, ranges.get(2).getStart().getLine());
    assertEquals(0, ranges.get(2).getStart().getCharacter());
    assertEquals(10, ranges.get(2).getEnd().getLine());
    assertEquals(80, ranges.get(2).getEnd().getCharacter());
  }

  @Test
  void testConcatFullLineMiddle() {
    Range bigRange = new Range(new Position(), new Position(10, 80));
    Range splitter = new Range(new Position(5, 0), new Position(5, 80));
    List<Range> ranges = MappingHelper.concat(splitter, bigRange);

    assertEquals(3, ranges.size());

    assertEquals(0, ranges.get(0).getStart().getLine());
    assertEquals(0, ranges.get(0).getStart().getCharacter());
    assertEquals(4, ranges.get(0).getEnd().getLine());
    assertEquals(80, ranges.get(0).getEnd().getCharacter());

    assertEquals(5, ranges.get(1).getStart().getLine());
    assertEquals(0, ranges.get(1).getStart().getCharacter());
    assertEquals(5, ranges.get(1).getEnd().getLine());
    assertEquals(80, ranges.get(1).getEnd().getCharacter());

    assertEquals(6, ranges.get(2).getStart().getLine());
    assertEquals(0, ranges.get(2).getStart().getCharacter());
    assertEquals(9, ranges.get(2).getEnd().getLine());
    assertEquals(80, ranges.get(2).getEnd().getCharacter());
  }

}
