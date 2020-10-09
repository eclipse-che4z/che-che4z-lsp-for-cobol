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
package com.broadcom.lsp.cobol.core.model;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * This class represents a structure for a COBOL code line that is used for parsing. The format is
 * 'fixed', standard ANSI / IBM reference. Each line 80 chars.<br>
 * <br>
 * 1-6: sequence area<br>
 * 7: indicator field<br>
 * 8-12: area A<br>
 * 13-72: area B<br>
 * 73-80: comments<br>
 */
@Data
@NoArgsConstructor
public class CobolLine {
  private String commentArea = "";
  private String contentAreaA = "";
  private String contentAreaB = "";
  private String indicatorArea = " ";
  private int number;
  private CobolLine predecessor;
  private String sequenceArea = "";
  private CobolLine successor;
  private CobolLineTypeEnum type = CobolLineTypeEnum.NORMAL;

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
