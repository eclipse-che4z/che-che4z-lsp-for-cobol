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

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.*;

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp4j.Location;

/** CBL Diagnostic Exception */
public class CblDiagnosticException extends Exception {
  private static ErrorSeverity severity;
  private final String token;
  private final Location location;

  CblDiagnosticException(Location location, String token, ErrorSeverity severity, String message) {
    super(message);
    this.location = location;
    CblDiagnosticException.severity = severity;
    this.token = token;
  }

  /**
   * Expect one of variants
   *
   * @param tokenText tokenText
   * @param location location
   * @param variants variants
   * @return CBL diagnostic exception
   */
  public static CblDiagnosticException expect(
      String tokenText, Location location, String... variants) {
    String s =
        "Unexpected token: "
            + (tokenText == null ? "EOF" : tokenText)
            + "."
            + (variants.length > 0 ? " Expect one of tokens: " + String.join(", ", variants) : "");
    return new CblDiagnosticException(location, tokenText, ERROR, s);
  }

  /**
   * Create syntax error from the exception
   *
   * @param line line
   * @return a new syntax error object
   */
  public SyntaxError toSyntaxError(int line) {
    SyntaxError.SyntaxErrorBuilder seb = SyntaxError.syntaxError();
    seb.errorSource(ErrorSource.PREPROCESSING);
    seb.severity(severity);
    if (token != null) {
      seb.location(new OriginalLocation(location, null));
    }
    seb.suggestion(this.getMessage());
    return seb.build();
  }
}
