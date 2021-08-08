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
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Warning;

/** This test checks that there are no NPE thrown while typing in MAP SECTION. */
class TestIdmsMapSectionDoesntProduceNPE {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    EMPRPT.\n"
          + "       DATA DIVISION.\n"
          + "       MAP SECTION.\n"
          + "           MAX {FILE|1|2} {LIST|3} 30.\n"
          + "           {MAP|4} {MCAR100|5}.\n"
          + "       FILE SECTION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'FILE' expected FIELD",
                Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "The following token must start in Area A: FILE",
                Warning,
                SourceInfoLevels.WARNING.getText()),
            "3",
            new Diagnostic(
                null,
                "Syntax error on 'LIST' expected SECTION",
                Error,
                SourceInfoLevels.ERROR.getText()),
            "4",
            new Diagnostic(
                null,
                "The following token must start in Area A: MAP",
                Warning,
                SourceInfoLevels.WARNING.getText()),
            "5",
            new Diagnostic(
                null,
                "Syntax error on 'MCAR100' expected SECTION",
                Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
