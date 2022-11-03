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
package org.eclipse.lsp.cobol.positive;

import lombok.AllArgsConstructor;
import lombok.Value;

/** This class is used to represent a COBOL program text. */
@Value
@AllArgsConstructor
public class CobolText {
  String fileName;
  String dialectType;
  String fullText;
  String url;
  boolean preprocess;

  public CobolText(String fileName, String fullText) {
    this.fileName = fileName;
    this.fullText = fullText;
    this.dialectType = null;
    this.url = null;
    this.preprocess = false;
  }

  public CobolText(String fileName, String dialectType, String fullText) {
    this.fileName = fileName;
    this.dialectType = dialectType;
    this.fullText = fullText;
    this.url = null;
    this.preprocess = false;
  }

  @Override
  public String toString() {
    return fileName;
  }
}
