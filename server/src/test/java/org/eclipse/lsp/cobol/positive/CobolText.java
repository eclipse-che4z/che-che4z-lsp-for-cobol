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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookName;

/** This class is used to represent a COBOL program text. */
@Value
@AllArgsConstructor
public class CobolText {
  String fileName;
  String dialectType;
  String qualifier;
  String fullText;
  String uri;

  public CobolText(String fileName, String fullText) {
    this.fileName = fileName;
    this.fullText = fullText;
    this.dialectType = DialectType.COBOL.name();
    this.qualifier = null;
    this.uri = null;
  }

  public CobolText(String fileName, String dialectType, String fullText) {
    this.fileName = fileName;
    this.dialectType = dialectType;
    this.fullText = fullText;
    this.qualifier = null;
    this.uri = null;
  }

  public CobolText(String fileName, String dialectType, String qualifier, String fullText) {
    this.fileName = fileName;
    this.dialectType = dialectType;
    this.fullText = fullText;
    this.qualifier = qualifier;
    this.uri = null;
  }

  @Override
  public String toString() {
    return fileName;
  }

  public CopybookName getCopybookName() {
    return new CopybookName(fileName, dialectType);
  }
}
