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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assumptions.assumeFalse;

/** This test checks if the parser recognizes an unexpected symbol and shows it as an error. */
class TestUnexpectedCharErrorShown {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION{?|typo}.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        END PROGRAM test1.";

  private static final String MESSAGE = "Extraneous input '?'";

  @BeforeAll
  public static void beforeMethod() {
    assumeFalse(ParserUtils.isHwParserEnabled());
  }

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "typo",
            new Diagnostic(new Range(), MESSAGE, DiagnosticSeverity.Error, ErrorSource.PARSING.getText())));
  }
}
