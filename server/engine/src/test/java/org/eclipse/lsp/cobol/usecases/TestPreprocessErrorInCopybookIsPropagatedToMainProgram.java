/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Tests that the pre-process error from a copybook is propagated to the source cobol prohram. */
public class TestPreprocessErrorInCopybookIsPropagatedToMainProgram {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST12.\n"
          + "       DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "        {_copy {~test9}.|error1_}";
  public static final String COPYBOOK_CONTENT =
      "                                                                                {extra|error2}";
  private static final String COPYBOOK_ID = "TEST9";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(COPYBOOK_ID, COPYBOOK_CONTENT)),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(), "Errors inside the copybook", Error, ErrorSource.COPYBOOK.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Source text cannot go past column 80",
                Error,
                ErrorSource.PREPROCESSING.getText())));
  }
}
