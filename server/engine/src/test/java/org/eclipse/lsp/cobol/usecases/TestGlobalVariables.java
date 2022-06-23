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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** Test Global variables errors. */
class TestGlobalVariables {
  private static final String GLOBAL_USAGE =
      "       Identification Division.\n"
          + "       Program-Id. 'P1'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*FOO} pointer GLOBAL.\n"
          + "       Procedure Division.\n"
          + "           DISPLAY {$FOO}.\n"
          + "       Identification Division.\n"
          + "       Program-Id. 'P11'.\n"
          + "       Procedure Division.\n"
          + "           DISPLAY {$FOO}.\n"
          + "       End Program 'P11'.\n"
          + "       End Program 'P1'.\n"
          + "       Identification Division.\n"
          + "       Program-Id. 'P2'.\n"
          + "       Procedure Division.\n"
          + "           DISPLAY {FOO|1}.\n"
          + "       End Program 'P2'.";

  private static final String VARIABLE_SHADOWING =
      "       Identification Division.\n"
          + "       Program-Id. 'P1'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*FOO} GLOBAL.\n"
          + "        05 {$*BAR} POINTER.\n"
          + "       Procedure Division.\n"
          + "           DISPLAY {$BAR}.\n"
          + "           DISPLAY {$FOO}.\n"
          + "           DISPLAY {$BAR} of {$FOO}.\n"
          + "       Identification Division.\n"
          + "       Program-Id. 'P11'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*FOO} PIC 9.\n"
          + "       Procedure Division.\n"
          + "           DISPLAY {$BAR}.\n"
          + "           DISPLAY {$FOO}.\n"
          + "           DISPLAY {$BAR} of {$FOO}.\n"
          + "       End Program 'P11'.\n"
          + "       End Program 'P1'.";

  private static final String TWO_GLOBALS =
      "       Identification Division.\n"
          + "       Program-Id. 'P1'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*FOO|1} GLOBAL POINTER.\n"
          + "       01 {$*FOO|1} GLOBAL POINTER.\n"
          + "       End Program 'P1'.";

  private static final String GLOBAL_ON_WRONG_LEVEL =
      "       Identification Division.\n"
          + "       Program-Id. 'P1'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*FOO}.\n"
          + "        05 {$*BAR|1} PIC X(10) GLOBAL.\n"
          + "       End Program 'P1'.";

  @Test
  void globalVariableUsage() {
    UseCaseEngine.runTest(
        GLOBAL_USAGE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), "Variable FOO is not defined", DiagnosticSeverity.Error, ERROR.getText())));
  }

  @Test
  void globalVariableShadowing() {
    UseCaseEngine.runTest(VARIABLE_SHADOWING, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void twoGlobalsWithSameName() {
    UseCaseEngine.runTest(
        TWO_GLOBALS,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Global variable must have a unique name",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void globalOnWrongLevel() {
    UseCaseEngine.runTest(
        GLOBAL_ON_WRONG_LEVEL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "GLOBAL can only be used on level 01",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
