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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.util;

import com.broadcom.lsp.cobol.core.model.CobolLine;
import lombok.experimental.UtilityClass;

import lombok.NonNull;

import java.util.Arrays;
import java.util.stream.Stream;

/** The utility class for CobolLine operations, e.g. copy in different ways */
@UtilityClass
public class CobolLineUtils {

  /**
   * Copy a given CobolLine and put there the given content
   *
   * @param contentArea - content to put
   * @param line - line to be copied.
   * @return a new line with a given content and the rest fields from the given line
   */
  @NonNull
  public static CobolLine copyCobolLineWithContentArea(
      @NonNull String contentArea, @NonNull CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setContentAreaA(extractContentAreaA(contentArea));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea));
    return cobolLine;
  }
  /**
   * Copy a given CobolLine and put there the given content and indicator area
   *
   * @param indicatorArea - a new indicator area for the resulting line
   * @param contentArea - content to put
   * @param line - line to be copied.
   * @return a new line with a given content and the indicator area and the rest fields from the
   *     given line
   */
  @NonNull
  public CobolLine copyCobolLineWithIndicatorAndContentArea(
      @NonNull String indicatorArea, @NonNull String contentArea, @NonNull CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(indicatorArea);
    cobolLine.setContentAreaA(extractContentAreaA(contentArea));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea));
    return cobolLine;
  }
  /**
   * Copy a given CobolLine and put there the given indicator area
   *
   * @param indicatorArea - a new indicator area for the resulting line
   * @param line - line to be copied.
   * @return a new line with a indicator area and the rest fields from the given line
   */
  @NonNull
  public CobolLine copyCobolLineWithIndicatorArea(
      @NonNull String indicatorArea, @NonNull CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(indicatorArea);
    return cobolLine;
  }

  @NonNull
  private CobolLine copyCobolLine(@NonNull CobolLine line) {
    CobolLine cobolLine = new CobolLine();
    cobolLine.setSequenceArea(line.getSequenceArea());
    cobolLine.setIndicatorArea(line.getIndicatorArea());
    cobolLine.setContentAreaA(line.getContentAreaA());
    cobolLine.setContentAreaB(line.getContentAreaB());
    cobolLine.setCommentArea(line.getCommentArea());
    cobolLine.setNumber(line.getNumber());
    cobolLine.setType(line.getType());
    cobolLine.setPredecessor(line.getPredecessor());
    cobolLine.setSuccessor(line.getSuccessor());
    return cobolLine;
  }

  @NonNull
  private String extractContentAreaA(@NonNull String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(0, 4) : contentArea;
  }

  @NonNull
  private String extractContentAreaB(@NonNull String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(4) : "";
  }

  /**
   * Count empty lines in the text.
   *
   * @param txt multiline text
   * @return the number of empty lines
   */
  public long getEmptyLinesCount(@NonNull String txt) {
    return textLines(txt).filter(String::isEmpty).count();
  }

  /**
   * Count non empty lines in the text.
   *
   * @param txt multiline text
   * @return the number of empty lines
   */
  public long getNonEmptyLinesCount(@NonNull String txt) {
    return textLines(txt).filter(it -> !it.isEmpty()).count();
  }

  private static Stream<String> textLines(String txt) {
    return Arrays.stream(txt.split(System.getProperty("line.separator")));
  }
}
