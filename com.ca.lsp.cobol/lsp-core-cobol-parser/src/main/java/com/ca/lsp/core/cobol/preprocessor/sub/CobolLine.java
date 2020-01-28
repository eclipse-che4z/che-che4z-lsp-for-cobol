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
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.sub.util.CobolLineUtils;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * This class represents a structure for a COBOL code line that is used for parsing. The exact line
 * structure depends on the format, see {@link CobolSourceFormat}
 */
@Data
@NoArgsConstructor
public class CobolLine {
  private String commentArea = "";
  private String contentAreaA = "";
  private String contentAreaB = "";
  private CobolDialect dialect;
  private CobolSourceFormat format;
  private String indicatorArea = " ";
  private int number;
  private CobolLine predecessor;
  private String sequenceArea = "";
  private CobolLine successor;
  private CobolLineTypeEnum type = CobolLineTypeEnum.NORMAL;

  /**
   * Create and return a blank sequence area depended on the type of the line
   *
   * @return an empty String or a String with white spaces
   */
  public String getBlankSequenceArea() {
    return CobolLineUtils.createBlankSequenceArea(format);
  }

  /**
   * Build and return a significant for syntax parsing content line
   *
   * @return a String with combined content areas
   */
  public String getContentArea() {
    return contentAreaA + contentAreaB;
  }

  /**
   * Set previous line and bind this lines together
   *
   * @param predecessor - the previous line in a document
   */
  public void setPredecessor(final CobolLine predecessor) {
    this.predecessor = predecessor;

    if (predecessor != null) {
      predecessor.successor = this;
    }
  }

  /**
   * Set following line and bind this lines together
   *
   * @param successor - the previous line in a document
   */
  public void setSuccessor(final CobolLine successor) {
    this.successor = successor;

    if (successor != null) {
      successor.predecessor = this;
    }
  }

  /**
   * Serialize the line and combine the fields that are significant for parsing
   *
   * @return combination of string parts of the COBOL line
   */
  @Override
  public String toString() {
    return sequenceArea + indicatorArea + contentAreaA + contentAreaB + commentArea;
  }
}
