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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** This test checks that if a copybook not found then error shown. */
public class TestMissingCopybooksReturnsError {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        COPY {~MISSCPY|missing}.\n\n"
          + "        PROCEDURE DIVISION.\n\n";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "missing",
            new Diagnostic(
                null, "MISSCPY: Copybook not found", Error, ERROR.getText(), "MISSING_COPYBOOK")));
  }
}
