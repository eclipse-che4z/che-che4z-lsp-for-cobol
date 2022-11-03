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

package org.eclipse.lsp.cobol.usecases.idms;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** This test checks that there are no NPE thrown while typing in MAP SECTION. */
class TestIdmsMapSectionDoesntProduceNPE {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    EMPRPT.\n"
          + "       DATA DIVISION.\n"
          + "       {MAP|1} SECTION.\n"
          + "           MAX FILE LIST 30.\n"
          + "           MAP MCAR100.\n"
          + "       FILE SECTION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'MAP' expected {CBL, END, EXEC, FILE, ID, IDENTIFICATION, LINKAGE, "
                    + "LOCAL-STORAGE, PROCEDURE, PROCESS, WORKING-STORAGE}",
                Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
