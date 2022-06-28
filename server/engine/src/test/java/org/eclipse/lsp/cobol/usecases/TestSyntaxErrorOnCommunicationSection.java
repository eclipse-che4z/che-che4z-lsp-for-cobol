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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import org.eclipse.lsp.cobol.core.model.ErrorStage;

/** Test deprecated COMMUNICATION SECTION produces error */
class TestSyntaxErrorOnCommunicationSection {
  private static final String TEXT =
      "         IDENTIFICATION DIVISION.\n"
          + "         PROGRAM-ID. TEST1.\n"
          + "         DATA DIVISION.\n"
          + "         {COMMUNICATION|1} SECTION. \n"
          + "         WORKING-STORAGE SECTION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'COMMUNICATION' expected {CBL, END, EXEC, FILE, ID, IDENTIFICATION, "
                    + "LINKAGE, LOCAL-STORAGE, PROCEDURE, PROCESS, WORKING-STORAGE}",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText())));
  }
}
