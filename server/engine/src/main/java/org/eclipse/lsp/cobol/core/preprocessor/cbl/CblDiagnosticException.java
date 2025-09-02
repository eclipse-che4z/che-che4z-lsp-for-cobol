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

import java.util.Optional;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** CBL Diagnostic Exception */
public class CblDiagnosticException extends Exception {
  private static ErrorSeverity severity;
  private final CblToken token;

  CblDiagnosticException(CblToken token, ErrorSeverity severity, String message) {
    super(message);
    CblDiagnosticException.severity = severity;
    this.token = token;
  }

  /**
   * Expect one of variants
   *
   * @param token token
   * @param variants variants
   * @return CBL diagnostic exception
   */
  public static CblDiagnosticException expect(CblToken token, String... variants) {
    String s =
        "Unexpected token: "
            + token.getText()
            + ". Expect one of tokens: "
            + String.join(", ", variants);
    return new CblDiagnosticException(token, ERROR, s);
  }

  /**
   * Create syntax error from the exception
   *
   * @return a new syntax error object
   */
  public SyntaxError toSyntaxError() {
    SyntaxError.SyntaxErrorBuilder seb = SyntaxError.syntaxError();
    seb.errorSource(ErrorSource.PREPROCESSING);
    seb.severity(severity);
    seb.location(
        new OriginalLocation(
            Optional.ofNullable(token).map(CblDiagnosticException::makeLocation).orElse(null),
            null));
    seb.suggestion(this.getMessage());
    return seb.build();
  }

  private static Location makeLocation(CblToken cblToken) {
    Position start = new Position(cblToken.getLine(), cblToken.getStart());
    Position end = new Position(cblToken.getLine(), cblToken.getEnd());
    Range range = new Range(start, end);
    return new Location(cblToken.getUri(), range);
  }

  public CblNode getToken() {
    return token;
  }
}
