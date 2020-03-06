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

package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import com.ca.lsp.core.cobol.preprocessor.ProcessingConstants;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import org.junit.Test;

import java.util.List;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.BLANK_SEQUENCE_AREA;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

/**
 * Unit test for {@link CobolInlineCommentEntriesNormalizerImpl}.
 * CobolInlineCommentEntriesNormalizerImpl should find denormalized lines and rewrites them. A line
 * is a denormalized one if it has no space after an ANTLR comment tag {@link
 * ProcessingConstants#COMMENT_TAG}. If the line doesn't have an ANTLR comment or has a space after
 * it, it should not be re-written.
 */
public class CobolInlineCommentEntriesNormalizerImplTest {

  private static final String EMPTY_CONTENT_AREA_A = "    ";

  /** The line without a comment tag shouldn't be changed should not be changed */
  @Test
  public void testNotMatchingLineIsNotChanged() {
    CobolLine normalLine = new CobolLine();
    normalLine.setSequenceArea(BLANK_SEQUENCE_AREA);
    normalLine.setIndicatorArea(WS);
    normalLine.setContentAreaA("MOVE");
    normalLine.setContentAreaB(" A TO B");

    CobolInlineCommentEntriesNormalizerImpl normalizer =
        new CobolInlineCommentEntriesNormalizerImpl();
    List<CobolLine> actual = normalizer.processLines(singletonList(normalLine));

    assertFalse(actual.isEmpty());
    assertEquals(normalLine, actual.get(0));
  }

  /**
   * The line with a comment tag, and a space after it shouldn't be changed should not be changed
   */
  @Test
  public void testLineWithCommentAndSpaceIsNotChanged() {
    CobolLine commentLine = new CobolLine();
    commentLine.setSequenceArea(BLANK_SEQUENCE_AREA);
    commentLine.setIndicatorArea(WS);
    commentLine.setContentAreaA(EMPTY_CONTENT_AREA_A);
    commentLine.setContentAreaB(" AUTHOR.*> USER.");

    CobolInlineCommentEntriesNormalizerImpl normalizer =
        new CobolInlineCommentEntriesNormalizerImpl();
    List<CobolLine> actual = normalizer.processLines(singletonList(commentLine));

    assertFalse(actual.isEmpty());
    assertEquals(commentLine, actual.get(0));
  }

  /**
   * If there is a comment tag in a line without a space after it, the {@link
   * CobolInlineCommentEntriesNormalizerImpl} should add a space after this tag.
   */
  @Test
  public void testLineWithCommentWithoutSpaceIsChanged() {
    CobolLine commentLine = new CobolLine();
    commentLine.setSequenceArea(BLANK_SEQUENCE_AREA);
    commentLine.setIndicatorArea(WS);
    commentLine.setContentAreaA(EMPTY_CONTENT_AREA_A);
    commentLine.setContentAreaB(" AUTHOR.*>USER.");

    CobolLine expected = new CobolLine();
    expected.setSequenceArea(BLANK_SEQUENCE_AREA);
    expected.setIndicatorArea(WS);
    expected.setContentAreaA(EMPTY_CONTENT_AREA_A);
    expected.setContentAreaB(" AUTHOR.*> USER.");

    CobolInlineCommentEntriesNormalizerImpl normalizer =
        new CobolInlineCommentEntriesNormalizerImpl();
    List<CobolLine> actual = normalizer.processLines(singletonList(commentLine));

    assertFalse(actual.isEmpty());
    assertEquals(expected, actual.get(0));
  }
}
