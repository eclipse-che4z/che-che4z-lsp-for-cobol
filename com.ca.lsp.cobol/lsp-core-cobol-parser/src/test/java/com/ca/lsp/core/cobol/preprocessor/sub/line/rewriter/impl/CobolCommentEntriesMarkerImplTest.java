/*
 * Copyright (c) 2019 Broadcom.
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
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineRewriter;
import org.junit.Test;

import java.util.List;

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.FIXED;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_ENTRY_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.CobolLineUtils.copyCobolLineWithIndicatorAndContentArea;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.CobolLineUtils.createBlankSequenceArea;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
/**
 * Unit test for class CobolCommentEntriesMarker. Checks that the lines with comment entries are
 * escaped and vice versa.
 */
public class CobolCommentEntriesMarkerImplTest {

  @Test
  public void testLineWithTriggerEscaped() {
    CobolLine line = new CobolLine();
    line.setSequenceArea(createBlankSequenceArea(FIXED));
    line.setIndicatorArea(WS);
    line.setContentAreaB("AUTHOR. SE.");

    CobolLine expected =
        copyCobolLineWithIndicatorAndContentArea(WS, "AUTHOR. " + COMMENT_ENTRY_TAG + " SE.", line);

    CobolLineRewriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(expected, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  public void testLineWithoutTriggersNotChanged() {
    CobolLine line = new CobolLine();
    line.setSequenceArea(createBlankSequenceArea(FIXED));
    line.setIndicatorArea(WS);
    line.setContentAreaA("MOVE");
    line.setContentAreaB(" A TO B.");

    CobolLineRewriter marker = new CobolCommentEntriesMarkerImpl();
    assertEquals(line, marker.processLines(singletonList(line)).get(0));
  }

  @Test
  public void testLineWithTriggerInPreviousLineNotEscaped() {
    CobolLine line1 = new CobolLine();
    line1.setSequenceArea(createBlankSequenceArea(FIXED));
    line1.setIndicatorArea(WS);
    line1.setContentAreaB("AUTHOR. SE.");

    CobolLine line2 = new CobolLine();
    line2.setSequenceArea(createBlankSequenceArea(FIXED));
    line2.setIndicatorArea(WS);
    line2.setContentAreaA("MOVE");
    line2.setContentAreaB(" A TO B.");
    line2.setPredecessor(line1);

    CobolLine expected =
        copyCobolLineWithIndicatorAndContentArea(
            WS, "AUTHOR. " + COMMENT_ENTRY_TAG + " SE.", line1);

    CobolLineRewriter marker = new CobolCommentEntriesMarkerImpl();
    List<CobolLine> processedLines = marker.processLines(asList(line1, line2));
    assertEquals(expected, processedLines.get(0));
    assertEquals(line2, processedLines.get(1));
  }
}
