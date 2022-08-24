/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test for missed IDMS copybook functionality
 */
class TestCopyIdmsMissed {

  private static final String TEXT = "        IDENTIFICATION DIVISION. \n"
      + "        PROGRAM-ID. test1.\n"
      + "        DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 COPY IDMS {~COPY1!IDMS|1}.\n"
      + "       PROCEDURE DIVISION.\n";


  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT, ImmutableList.of(),
        ImmutableMap.of("1", new Diagnostic(new Range(), "COPY1: Copybook not found",
            DiagnosticSeverity.Error, ErrorSource.DIALECT.getText(), "missing copybook")),
        ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

}
