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
package com.ca.lsp.cobol.positive;

/**
 * This class is used to represent a Cobol program text.
 *
 * @author teman02
 */
public class CobolText {
  private String fullText;
  private String fileName;
  private int linesNumber;

  CobolText(String fileName, String fullText, int linesNumber) {
    this.fileName = fileName;
    this.fullText = fullText;
    this.linesNumber = linesNumber;
  }

  /** @return Full program text */
  public String getText() {
    return fullText;
  }

  /** @return The name of file that contain this Cobol text */
  public String getFileName() {
    return fileName;
  }

  /**
   * This method should return the exact amount of code lines in stored program.
   *
   * @return Number of code lines
   */
  public int getLinesNumber() {
    return linesNumber;
  }
}
