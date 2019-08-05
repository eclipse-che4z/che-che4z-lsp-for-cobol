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
package com.ca.lsp.core.cobol.preprocessor.sub;

import com.ca.lsp.core.cobol.params.CobolDialect;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor.CobolSourceFormatEnum;
import com.ca.lsp.core.cobol.preprocessor.ProcessingConstants;
import com.google.common.base.Strings;

public class CobolLine {
  protected String commentArea = "";
  protected String commentAreaOriginal = "";
  protected String contentAreaA = "";
  protected String contentAreaAOriginal = "";
  protected String contentAreaB = "";
  protected String contentAreaBOriginal = "";
  protected CobolDialect dialect;
  protected CobolSourceFormatEnum format;
  protected String indicatorArea = " ";
  protected String indicatorAreaOriginal = "";
  protected int number;
  protected CobolLine predecessor;
  protected String sequenceArea = "";
  protected String sequenceAreaOriginal = "";
  protected CobolLine successor;
  protected CobolLineTypeEnum type = CobolLineTypeEnum.NORMAL;

  // getter & setter
  public String getBlankSequenceArea() {
    return createBlankSequenceArea(format);
  }

  public String getCommentArea() {
    return commentArea;
  }

  public String getCommentAreaOriginal() {
    return commentAreaOriginal;
  }

  public String getContentArea() {
    return contentAreaA + contentAreaB;
  }

  public String getContentAreaA() {
    return contentAreaA;
  }

  public String getContentAreaAOriginal() {
    return contentAreaAOriginal;
  }

  public String getContentAreaB() {
    return contentAreaB;
  }

  public String getContentAreaBOriginal() {
    return contentAreaBOriginal;
  }

  public String getContentAreaOriginal() {
    return contentAreaAOriginal + contentAreaBOriginal;
  }

  public CobolDialect getDialect() {
    return dialect;
  }

  public CobolSourceFormatEnum getFormat() {
    return format;
  }

  public String getIndicatorArea() {
    return indicatorArea;
  }

  public String getIndicatorAreaOriginal() {
    return indicatorAreaOriginal;
  }

  public int getNumber() {
    return number;
  }

  public CobolLine getPredecessor() {
    return predecessor;
  }

  public String getSequenceArea() {
    return sequenceArea;
  }

  public String getSequenceAreaOriginal() {
    return sequenceAreaOriginal;
  }

  public CobolLine getSuccessor() {
    return successor;
  }

  public CobolLineTypeEnum getType() {
    return type;
  }

  public void setCommentArea(String commentArea) {
    this.commentArea = commentArea;
  }

  public void setCommentAreaOriginal(String commentAreaOriginal) {
    this.commentAreaOriginal = commentAreaOriginal;
  }

  public void setContentAreaA(String contentAreaA) {
    this.contentAreaA = contentAreaA;
  }

  public void setContentAreaAOriginal(String contentAreaAOriginal) {
    this.contentAreaAOriginal = contentAreaAOriginal;
  }

  public void setContentAreaB(String contentAreaB) {
    this.contentAreaB = contentAreaB;
  }

  public void setContentAreaBOriginal(String contentAreaBOriginal) {
    this.contentAreaBOriginal = contentAreaBOriginal;
  }

  public void setDialect(CobolDialect dialect) {
    this.dialect = dialect;
  }

  public void setFormat(CobolSourceFormatEnum format) {
    this.format = format;
  }

  public void setIndicatorArea(String indicatorArea) {
    this.indicatorArea = indicatorArea;
  }

  public void setIndicatorAreaOriginal(String indicatorAreaOriginal) {
    this.indicatorAreaOriginal = indicatorAreaOriginal;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public void setSequenceArea(String sequenceArea) {
    this.sequenceArea = sequenceArea;
  }

  public void setSequenceAreaOriginal(String sequenceAreaOriginal) {
    this.sequenceAreaOriginal = sequenceAreaOriginal;
  }

  public void setType(CobolLineTypeEnum type) {
    this.type = type;
  }

  public void setPredecessor(final CobolLine predecessor) {
    this.predecessor = predecessor;

    if (predecessor != null) {
      predecessor.successor = this;
    }
  }

  public void setSuccessor(final CobolLine successor) {
    this.successor = successor;

    if (successor != null) {
      successor.predecessor = this;
    }
  }

  public static CobolLine copyCobolLineWithContentArea(
      final String contentArea, final CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setContentAreaA(extractContentAreaA(contentArea));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea));
    return cobolLine;
  }

  /**
   * @param indicatorArea
   * @param contentArea
   * @param line
   * @return new CobolLine
   */
  public static CobolLine copyCobolLineWithIndicatorAndContentArea(
      final String indicatorArea, final String contentArea, final CobolLine line) {

    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(indicatorArea);
    cobolLine.setContentAreaA(extractContentAreaA(contentArea));
    cobolLine.setContentAreaB(extractContentAreaB(contentArea));
    return cobolLine;
  }

  public static CobolLine copyCobolLineWithIndicatorArea(
      final String indicatorArea, final CobolLine line) {
    CobolLine cobolLine = copyCobolLine(line);
    cobolLine.setIndicatorArea(indicatorArea);
    return cobolLine;
  }

  public static CobolLine copyCobolLineWithEmptyContent(final CobolLine line) {
    CobolLine cobolLine = new CobolLine();
    cobolLine.setFormat(line.format);
    cobolLine.setDialect(line.dialect);
    cobolLine.setNumber(line.number);
    cobolLine.setType(line.type);
    cobolLine.setPredecessor(line.predecessor);
    cobolLine.setSuccessor(line.successor);
    return cobolLine;
  }

  private static CobolLine copyCobolLine(final CobolLine line) {
    CobolLine cobolLine = new CobolLine();
    cobolLine.setSequenceArea(line.getSequenceArea());
    cobolLine.setSequenceAreaOriginal(line.getSequenceAreaOriginal());
    cobolLine.setIndicatorArea(line.indicatorArea);
    cobolLine.setIndicatorAreaOriginal(line.indicatorAreaOriginal);
    cobolLine.setContentAreaA(line.contentAreaA);
    cobolLine.setContentAreaAOriginal(line.contentAreaAOriginal);
    cobolLine.setContentAreaB(line.contentAreaB);
    cobolLine.setContentAreaBOriginal(line.contentAreaBOriginal);
    cobolLine.setCommentArea(line.commentArea);
    cobolLine.setCommentAreaOriginal(line.commentAreaOriginal);
    cobolLine.setFormat(line.format);
    cobolLine.setDialect(line.dialect);
    cobolLine.setNumber(line.number);
    cobolLine.setType(line.type);
    cobolLine.setPredecessor(line.predecessor);
    cobolLine.setSuccessor(line.successor);
    return cobolLine;
  }

  public static String createBlankSequenceArea(
      final CobolPreprocessor.CobolSourceFormatEnum format) {
    return CobolSourceFormatEnum.TANDEM.equals(format)
        ? ""
        : Strings.repeat(ProcessingConstants.WS, 6);
  }

  protected static String extractContentAreaA(final String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(0, 4) : contentArea;
  }

  protected static String extractContentAreaB(final String contentArea) {
    return contentArea.length() > 4 ? contentArea.substring(4) : "";
  }

  public String serialize() {
    return sequenceArea + indicatorArea + contentAreaA + contentAreaB + commentArea;
  }

  public String serializeWithoutCommentArea() {
    return sequenceArea + indicatorArea + contentAreaA + contentAreaB;
  }

  @Override
  public String toString() {
    return serialize();
  }
}
