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

import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp4j.Location;

import java.util.Optional;

/** CBL Diagnostic Exception */
public class CblDiagnosticException extends Exception {
  private final CblToken token;

  CblDiagnosticException(CblToken token, String message) {
    super(message);
    this.token = token;
  }

  /**
   * Expect one of variants
   *
   * @param variants variants
   * @return CBL diagnostic exception
   */
  public static CblDiagnosticException expect(CblToken token, String... variants) {
    // TODO proper error message
    String s = "Expect one of tokens: " + String.join(", ", variants);
    return new CblDiagnosticException(token, s);
  }

  public SyntaxError toSyntaxError() {
    SyntaxError.SyntaxErrorBuilder seb = SyntaxError.syntaxError();
    seb.errorSource(ErrorSource.PREPROCESSING);
    seb.location(
        new OriginalLocation(
            Optional.ofNullable(token).map(CblDiagnosticException::makeLocation).orElse(null),
            null));
    seb.suggestion(this.getMessage());
    return seb.build();
  }

  private static Location makeLocation(CblToken cblToken) {
    return new Location();
  }

  public CblNode getToken() {
    return token;
  }
}
