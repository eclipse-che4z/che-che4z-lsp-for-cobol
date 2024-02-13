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
import org.junit.jupiter.api.Test;

/** This use case checks the error shown if there is an unexpected symbol in the indicator area. */
class TestIndicatorAreaError {

  private static final String TEXT = "qwerty{u|1}{iop|2}";

  private static final String MESSAGE_1 = "Unexpected indicator area content";
  private static final String MESSAGE_2 = ParserUtils.isHwParserEnabled()
          ? "Unknown input: 'iop'"
          :  "Syntax error on 'iop'";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), MESSAGE_1, DiagnosticSeverity.Error, ErrorSource.PREPROCESSING.getText()),
            "2",
            new Diagnostic(
                new Range(), MESSAGE_2, DiagnosticSeverity.Error, ErrorSource.PARSING.getText())));
  }
}
