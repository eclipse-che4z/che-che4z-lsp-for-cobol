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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;

/** This class is used to represent a COBOL program text. */
@Value
@AllArgsConstructor
public class CobolText {
  String fileName;
  String dialectType;
  String fullText;

  public CobolText(String fileName, String fullText) {
    this.fileName = fileName;
    this.fullText = fullText;
    this.dialectType = DialectType.COBOL.name();
  }

  @Override
  public String toString() {
    return fileName;
  }
}
