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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This class test the ENTER compiler directive. */
class TestEnterCompilerDirective {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       ENTER ABC.\n"
          + "       Program-Id. control-dir.";

  private static final String TEXT_NO_LANGUAGE =
      "       Identification Division.\n"
          + "       ENTER {.|1}\n"
          + "       Program-Id. control-dir.";

  private static final String TEXT_JAVA_LANG_ROUTINE =
          "       Identification Division.\n"
                  + "       ENTER JAVA ROUTINE .\n"
                  + "       Program-Id. control-dir.";

  @Test
  void testNoErrorOnEnterCompilerDirective() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testErrorOnEnterCompilerDirective_whenLanguage() {
    UseCaseEngine.runTest(
        TEXT_NO_LANGUAGE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(1, 7), new Position(1, 14)),
                "LanguageName missing for ENTER compiler directive.",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testNoErrorOnEnterCompilerDirectiveWithRoutineName() {
    UseCaseEngine.runTest(TEXT_JAVA_LANG_ROUTINE, ImmutableList.of(), ImmutableMap.of());
  }
}
