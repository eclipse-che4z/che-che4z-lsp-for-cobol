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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the error shown if the copybook that is used in the Cobol file contains a
 * link to itself.
 */
class TestCopybookWithRecursiveDependencyIsDetected {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        COPY {~REC-CPY|1}.\n\n"
          + "        PROCEDURE DIVISION.\n\n";

  private static final String REC_CPY = "        COPY {~REC-CPY}.";
  private static final String REC_CPY_NAME = "REC-CPY";
  private static final String MESSAGE = "Recursive copybook declaration for: " + REC_CPY_NAME;

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REC_CPY_NAME, REC_CPY)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), MESSAGE, DiagnosticSeverity.Error, ErrorSource.COPYBOOK.getText())));
  }
}
