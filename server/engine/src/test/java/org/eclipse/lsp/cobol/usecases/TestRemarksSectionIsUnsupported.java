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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the remarks section is not marked as a comment, and the syntax analysis
 * applied.
 *
 * <p>The REMARKS is an old syntax that is not supported anymore, so it should be marked as error.
 */
class TestRemarksSectionIsUnsupported {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "          {REMARKS.|unsupported}\n"
          + "       AUTHOR.     SE.\n"
          + "              PURPOSE.\n"
          + "              THIS PROGRAM IS DEFINED TO TEST A NUMBER OF THE\n"
          + "              APPLICATION TESTING COLLECTION AND DEBUG TOOL FUNCTIONS\n"
          + "       ENVIRONMENT DIVISION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "unsupported",
            new Diagnostic(
                new Range(),
                "The code block is deprecated and not supported",
                DiagnosticSeverity.Warning,
                SourceInfoLevels.WARNING.getText())));
  }
}
