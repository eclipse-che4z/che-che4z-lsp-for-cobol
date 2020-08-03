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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineReWriter;
import org.junit.jupiter.api.Test;

import java.util.List;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.impl.CobolLineUtils.copyCobolLineWithIndicatorAndContentArea;
import static java.util.Collections.singletonList;
import static org.junit.jupiter.api.Assertions.assertEquals;
/**
 * Unit test for class CobolCommentEntriesMarker. Checks that the lines with comment entries escaped
 * and vice versa.
 */
class CobolCommentEntriesMarkerImplTest {

  @Test
  void testLineWithTriggerEscaped() {
    CobolLine line = new CobolLine();
    line.setSequenceArea(BLANK_SEQUENCE_AREA);
    line.setIndicatorArea(WS);
    line.setContentAreaB("AUTHOR. SE.");

    CobolLine expected =
        copyCobolLineWithIndicatorAndContentArea(WS, "AUTHOR. " + COMMENT_ENTRY_TAG + " SE.", line);

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(expected, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  void testLineWithoutTriggersNotChanged() {
    CobolLine line = new CobolLine();
    line.setSequenceArea(BLANK_SEQUENCE_AREA);
    line.setIndicatorArea(WS);
    line.setContentAreaA("MOVE");
    line.setContentAreaB(" A TO B.");

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(line, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  void testLineWithTriggerInPreviousLineNotEscaped() {
    CobolLine line1 = new CobolLine();
    line1.setSequenceArea(BLANK_SEQUENCE_AREA);
    line1.setIndicatorArea(WS);
    line1.setContentAreaB("AUTHOR. SE.");

    CobolLine line2 = new CobolLine();
    line2.setSequenceArea(BLANK_SEQUENCE_AREA);
    line2.setIndicatorArea(WS);
    line2.setContentAreaA("MOVE");
    line2.setContentAreaB(" A TO B.");
    line2.setPredecessor(line1);

    CobolLine expected =
        copyCobolLineWithIndicatorAndContentArea(
            WS, "AUTHOR. " + COMMENT_ENTRY_TAG + " SE.", line1);

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();

    List<CobolLine> processedLines = marker.processLines(List.of(line1, line2));
    assertEquals(expected, processedLines.get(0));
    assertEquals(line2, processedLines.get(1));
  }
}
