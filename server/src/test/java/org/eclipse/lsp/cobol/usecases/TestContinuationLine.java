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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** The test for various cases with the continuation line */
class TestContinuationLine {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*COD-RETOUR} PIC X(9).\n"
          + "       Procedure Division.\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -{asdf|1}asdf\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -   {a|1}sdfasdf\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -    asdfasdf\n"
          + "       .\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "A continuation line cannot contain values in the Content Area A",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
