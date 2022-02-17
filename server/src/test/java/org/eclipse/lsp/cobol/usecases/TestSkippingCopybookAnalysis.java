/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/**
 * The COPY MAID statement without the level number specified should not be resolved, but the
 * semantic data should be collected.
 */
class TestSkippingCopybookAnalysis {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. VSAMTEST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       COPY MAID {~ABCD}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {ABCD1|1}.";

  private static final String COPYBOOK = "       01 ABCD1 PIC 9.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("ABCD", DialectType.MAID.name(), COPYBOOK)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Variable ABCD1 is not defined",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
