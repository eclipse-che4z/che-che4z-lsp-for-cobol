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
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

/** Test for ambiguous paragraph perform call */
public class TestPerformAmbiguousReference {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "       {@*SEC1} SECTION.\n"
                  + "           PERFORM {_PAR|1_}.\n"
                  + "       {@*SEC2} SECTION.\n"
                  + "       {#*PAR}.\n"
                  + "       {@*SEC3} SECTION.\n"
                  + "       {#*PAR}.\n";

  @Test
  void test() {
    AnalysisResult analysisResult =
            UseCaseEngine.runTest(
                    TEXT,
                    ImmutableList.of(),
                    ImmutableMap.of("1",
                            new Diagnostic(new Range(),
                                    "Ambiguous reference for PAR",
                                    DiagnosticSeverity.Error,
                                    "COBOL Language Support (parsing)"
                            )),
                    ImmutableList.of());
  }
}
