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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.Ignore;
import org.junit.Test;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonMap;

/** This use case checks if extra symbols on one line do not cause any errors on the next line. */
public class TestExtraSymbolsNotCauseErrorOnNextLine {

  private static final String TEXT =
      "000000 Identification DIVISION.                                         23323232{extra|1}\r\n" // Extra symbols at the end of this line
          + "002800 Program-ID.                                                      23323232\r\n" // Should not show an error on this line
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2";

  private static final String MESSAGE = "The line doesn't match the fixed format";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        emptyList(),
        singletonMap(
            "1", new Diagnostic(null, MESSAGE, DiagnosticSeverity.Error, ERROR.getText())));
  }
}
