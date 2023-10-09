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
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Test for multiline variable definition **/
class TestMappingMultilineVariable {
  private static final String TEXT = "000100 IDENTIFICATION DIVISION.                                         NC2054.2\n"
      + "000200 PROGRAM-ID.                                                      NC2054.2\n"
      + "000300     NC205A.                                                      NC2054.2\n"
      + "003800 DATA DIVISION.                                                   NC2054.2\n"
      + "004300 WORKING-STORAGE SECTION.                                         NC2054.2\n"
      + "006200 77                                                               NC2054.2\n"
      + "006400     {$*SPACING-77}                                                   NC2054.2\n"
      + "006500      PICTURE                                                     NC2054.2\n"
      + "006600                                                                  NC2054.2\n"
      + "006700     X(10)                                                   VALUENC2054.2\n"
      + "006900     \"ABCDE12345\".                                                NC2054.2\n"
      + "007100 77  {$*SPACING-RECEIVE|1}    {PICTUREQ|2}                                  NC2054.2\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item SPACING-RECEIVE",
                Error,
                    ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'PICTUREQ'",
                Error,
                    ErrorSource.PARSING.getText())
        ),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(CopybookProcessingMode.DISABLED));
  }
}
