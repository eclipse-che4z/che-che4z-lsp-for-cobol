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

import static com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor.CobolSourceFormatEnum.FIXED;
import static com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor.CobolSourceFormatEnum.TANDEM;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_ENTRY_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.COMMENT;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.NORMAL;
import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
/**
 * JUnit test for Class CobolCommentEntriesMarker
 *
 * @author ra890997
 */
public class CobolCommentEntriesMarkerImplTest {

  private CobolLine commentLine = new CobolLine();
  private CobolLine normalLine = new CobolLine();
  private CobolLine authorLine = new CobolLine();
  private CobolLine nullLine = new CobolLine();
  private CobolLine randomContent = new CobolLine();
  private CobolLine tandemLine = new CobolLine();
  private List<CobolLine> listOfLines =
      Arrays.asList(
          authorLine, commentLine, randomContent, commentLine, normalLine, nullLine, tandemLine);
  private String emptySequenceArea = "      ";
  private String commentIndicatorArea = "*";
  private String authorContentArea = "AUTHOR.RANDOMTEXT";

  public CobolCommentEntriesMarkerImplTest() {
    commentLine.setSequenceArea(emptySequenceArea);
    commentLine.setIndicatorArea(commentIndicatorArea);
    commentLine.setContentAreaA("");
    commentLine.setContentAreaB(null);
    commentLine.setCommentArea(null);
    commentLine.setFormat(FIXED);
    commentLine.setType(COMMENT);

    normalLine.setSequenceArea(emptySequenceArea);
    normalLine.setIndicatorArea(" ");
    normalLine.setFormat(FIXED);
    normalLine.setType(NORMAL);

    authorLine.setContentAreaA(authorContentArea);
    authorLine.setFormat(FIXED);
    authorLine.setType(NORMAL);

    nullLine.setFormat(FIXED);
    nullLine.setType(NORMAL);

    randomContent.setType(NORMAL);
    randomContent.setFormat(FIXED);
    randomContent.setContentAreaA("ASDASDA");

    tandemLine.setFormat(TANDEM);
  }

  @Test
  public void checkStartsWithTriggerPositive() {
    CobolCommentEntriesMarkerImpl entriesMarker = new CobolCommentEntriesMarkerImpl();
    assertEquals(
        "AUTHOR. " + COMMENT_ENTRY_TAG + "RANDOMTEXT",
        entriesMarker.processSingleLineCommentEntry(authorLine).getContentArea());
  }

  @Test
  public void checkStartsWithTriggerNegative() {
    CobolCommentEntriesMarkerImpl entriesMarker = new CobolCommentEntriesMarkerImpl();
    assertEquals(
        normalLine.getContentArea(),
        entriesMarker.processSingleLineCommentEntry(normalLine).getContentArea());
  }

  @Test
  public void checkMismatchingEscapeCommentEntry() {
    CobolCommentEntriesMarkerImpl entriesMarker = new CobolCommentEntriesMarkerImpl();
    assertEquals(nullLine, entriesMarker.escapeCommentEntry(nullLine));
  }

  @Test
  public void processMultiLineCommentEntryTest() {
    CobolCommentEntriesMarkerImpl entriesMarker = new CobolCommentEntriesMarkerImpl();
    List<CobolLine> outputMarker = entriesMarker.processLines(listOfLines);
    assertEquals(
        "AUTHOR. " + COMMENT_ENTRY_TAG + "RANDOMTEXT", outputMarker.get(0).getContentArea());
    assertEquals(COMMENT_ENTRY_TAG + WS, outputMarker.get(1).getIndicatorArea());
    assertEquals(
        WS + randomContent.getContentArea(),
        outputMarker.get(2).getIndicatorArea() + outputMarker.get(2).getContentArea());
    assertEquals(commentIndicatorArea, outputMarker.get(3).getIndicatorArea());
    assertEquals(normalLine.getContentArea(), outputMarker.get(4).getContentArea());
    assertEquals(nullLine, outputMarker.get(5));
    assertEquals(tandemLine, outputMarker.get(6));
  }
}
