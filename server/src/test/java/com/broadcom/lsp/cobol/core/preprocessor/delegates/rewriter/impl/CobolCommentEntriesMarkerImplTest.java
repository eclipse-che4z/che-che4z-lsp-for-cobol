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
package com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.impl;

import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.preprocessor.ProcessingConstants;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolCommentEntriesMarkerImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.CobolLineUtils;
import com.google.common.collect.ImmutableList;
import org.junit.jupiter.api.Test;

import java.util.List;

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
    line.setSequenceArea(ProcessingConstants.BLANK_SEQUENCE_AREA);
    line.setIndicatorArea(ProcessingConstants.WS);
    line.setContentAreaB("AUTHOR. SE.");

    CobolLine expected =
        CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(ProcessingConstants.WS, "AUTHOR. " + ProcessingConstants.COMMENT_ENTRY_TAG + " SE.", line);

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(expected, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  void testLineWithoutTriggersNotChanged() {
    CobolLine line = new CobolLine();
    line.setSequenceArea(ProcessingConstants.BLANK_SEQUENCE_AREA);
    line.setIndicatorArea(ProcessingConstants.WS);
    line.setContentAreaA("MOVE");
    line.setContentAreaB(" A TO B.");

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(line, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  void testLineWithTriggerInPreviousLineNotEscaped() {
    CobolLine line1 = new CobolLine();
    line1.setSequenceArea(ProcessingConstants.BLANK_SEQUENCE_AREA);
    line1.setIndicatorArea(ProcessingConstants.WS);
    line1.setContentAreaB("AUTHOR. SE.");

    CobolLine line2 = new CobolLine();
    line2.setSequenceArea(ProcessingConstants.BLANK_SEQUENCE_AREA);
    line2.setIndicatorArea(ProcessingConstants.WS);
    line2.setContentAreaA("MOVE");
    line2.setContentAreaB(" A TO B.");
    line2.setPredecessor(line1);

    CobolLine expected =
        CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(
            ProcessingConstants.WS, "AUTHOR. " + ProcessingConstants.COMMENT_ENTRY_TAG + " SE.", line1);

    CobolLineReWriter marker = new CobolCommentEntriesMarkerImpl();

    List<CobolLine> processedLines = marker.processLines(ImmutableList.of(line1, line2));
    assertEquals(expected, processedLines.get(0));
    assertEquals(line2, processedLines.get(1));
  }
}
