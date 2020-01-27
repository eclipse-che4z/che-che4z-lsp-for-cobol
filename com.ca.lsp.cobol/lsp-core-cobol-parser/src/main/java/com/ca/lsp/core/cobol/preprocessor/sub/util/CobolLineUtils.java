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

package com.ca.lsp.core.cobol.preprocessor.sub.util;

import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.ProcessingConstants;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.google.common.base.Strings;
import lombok.experimental.UtilityClass;

import javax.annotation.Nonnull;

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.TANDEM;

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
  @Nonnull
  public static CobolLine copyCobolLineWithContentArea(
      @Nonnull String contentArea, @Nonnull CobolLine line) {
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
  @Nonnull
  public CobolLine copyCobolLineWithIndicatorAndContentArea(
      @Nonnull String indicatorArea, @Nonnull String contentArea, @Nonnull CobolLine line) {
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
  @Nonnull
  public CobolLine copyCobolLineWithIndicatorArea(
      @Nonnull String indicatorArea, @Nonnull CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(indicatorArea);
    return cobolLine;
  }

  /**
   * Create a blank sequence area depending on the given format, e.g. six white spaces for the fixed
   * format {@link CobolSourceFormat#FIXED}
   *
   * @param format - format of the cobol line
   * @return a String containing a blank sequence area of a given format
   */
  @Nonnull
  public String createBlankSequenceArea(@Nonnull CobolSourceFormat format) {
    return TANDEM.equals(format) ? "" : Strings.repeat(ProcessingConstants.WS, 6);
  }

  @Nonnull
  private CobolLine copyCobolLine(@Nonnull CobolLine line) {
    CobolLine cobolLine = new CobolLine();
    cobolLine.setSequenceArea(line.getSequenceArea());
    cobolLine.setIndicatorArea(line.getIndicatorArea());
    cobolLine.setContentAreaA(line.getContentAreaA());
    cobolLine.setContentAreaB(line.getContentAreaB());
    cobolLine.setCommentArea(line.getCommentArea());
    cobolLine.setFormat(line.getFormat());
    cobolLine.setDialect(line.getDialect());
    cobolLine.setNumber(line.getNumber());
    cobolLine.setType(line.getType());
    cobolLine.setPredecessor(line.getPredecessor());
    cobolLine.setSuccessor(line.getSuccessor());
    return cobolLine;
  }

  @Nonnull
  private String extractContentAreaA(@Nonnull String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(0, 4) : contentArea;
  }

  @Nonnull
  private String extractContentAreaB(@Nonnull String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(4) : "";
  }
}
