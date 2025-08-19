/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

/** CBL Diagnostic Exception */
public class CblDiagnosticException extends Exception {
  CblDiagnosticException(String message) {
    super(message);
  }

  /**
   * Expect one of variants
   *
   * @param variants variants
   * @return CBL diagnostic exception
   */
  public static CblDiagnosticException expect(String[] variants) {
    // TODO proper error message
    String s = "Expect one of tokens: " + String.join(", ", variants);
    return new CblDiagnosticException(s);
  }
}
