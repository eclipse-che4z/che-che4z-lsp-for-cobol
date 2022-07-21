/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.model;

import lombok.AllArgsConstructor;

/**
 * This enum represents the source where error is generated during parsing and analysis.
 */
@AllArgsConstructor
public enum ErrorSource {
  PARSING("(parsing)"),
  PREPROCESSING("(preprocessing)"),
  DIALECT("(dialect)"),
  EXTENDED_DOCUMENT("(extended document)"),
  COPYBOOK("(copybook)");

  private static final String COBOL_LANG_SUPPORT_LABEL = "COBOL Language Support";

  private String label;

  public String getText() {
    return COBOL_LANG_SUPPORT_LABEL + " " + label;
  }
}
