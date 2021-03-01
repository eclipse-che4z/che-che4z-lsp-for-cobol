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

import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** This use case checks the error shown if there is an unexpected symbol in the indicator area. */
class TestIndicatorAreaError {

  private static final String TEXT = "qwerty{u|1}{iop|2}";

  private static final String MESSAGE_1 = "Unexpected indicator area content";
  private static final String MESSAGE_2 = "Syntax error on 'iop' expected {ID, IDENTIFICATION}";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(null, MESSAGE_1, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(null, MESSAGE_2, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
  }
}
