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

import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.WS;

import java.util.Arrays;
import java.util.stream.Stream;
import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;

/** The utility class for CobolLine operations, e.g. copy in different ways */
@UtilityClass
public class CobolLineUtils {

  /**
   * Copy a given CobolLine and put there the given content
   *
   * @param contentArea - content to put
   * @param line - line to be copied.
   * @param layout - cobol code layout
   * @return a new line with a given content and the rest fields from the given line
   */
  @NonNull
  public static CobolLine copyCobolLineWithContentArea(
      @NonNull String contentArea, @NonNull CobolLine line, @NonNull CobolProgramLayout layout) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setContentAreaA(extractContentAreaA(contentArea, layout));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea, layout));
    return cobolLine;
  }
  /**
   * Copy a given CobolLine and put there the given content and indicator area
   *
   * @param indicatorArea - a new indicator area for the resulting line
   * @param contentArea - content to put
   * @param line - line to be copied.
   * @param layout - cobol code layout
   * @return a new line with a given content and the indicator area and the rest fields from the
   *     given line
   */
  @NonNull
  public CobolLine copyCobolLineWithIndicatorAndContentArea(
      @NonNull String indicatorArea, @NonNull String contentArea, @NonNull CobolLine line, @NonNull CobolProgramLayout layout) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(extractIndicatorArea(indicatorArea, layout));
    cobolLine.setContentAreaA(extractContentAreaA(contentArea, layout));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea, layout));
    return cobolLine;
  }

  private static String extractIndicatorArea(String indicatorArea, CobolProgramLayout layout) {
    return indicatorArea.length() > layout.getIndicatorLength() ? indicatorArea.substring(0, layout.getIndicatorLength())
            : (indicatorArea + StringUtils.repeat(WS, (layout.getIndicatorLength() - indicatorArea.length())));
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
  private String extractContentAreaA(@NonNull String contentArea, @NonNull CobolProgramLayout layout) {
    return contentArea.length() > layout.getAreaALength() ? contentArea.substring(0, layout.getAreaALength()) : contentArea;
  }

  @NonNull
  private String extractContentAreaB(@NonNull String contentArea, @NonNull CobolProgramLayout layout) {
    return contentArea.length() > layout.getAreaALength()
        ? contentArea.substring(layout.getAreaALength())
        : "";
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
