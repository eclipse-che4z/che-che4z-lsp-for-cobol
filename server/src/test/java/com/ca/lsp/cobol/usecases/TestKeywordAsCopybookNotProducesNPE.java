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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test checks that there is no syntax error shown on a copybook usage when the copybook name
 * is a keyword.
 */
class TestKeywordAsCopybookNotProducesNPE {

  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   {$*PARENT1}. \n"
          + "        COPY {~DETAIL}. \n"
          + "        COPY {~IDENTIFICATION|long1}. \n"
          + "        COPY {~ADATA}. \n"
          + "        COPY {~DOT}. \n"
          + "        COPY {~DISPLAY}. \n"
          + "        COPY {~End}. \n"
          + "        COPY {~NUMERICLITERAL|long2}. \n"
          + "        COPY {~FILENAME}. \n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           DISPLAY {$CHILD1} OF {$PARENT1}.\n"
          + "       End program ProgramId.";

  private static final String DETAIL =
      "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n"
          + "           03  {$*CHILD2}         PIC 9   VALUE IS '1'.";

  private static final String DETAIL_NAME = "DETAIL";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(
            new CobolText(DETAIL_NAME, DETAIL),
            new CobolText("IDENTIFICATION", ""),
            new CobolText("ADATA", ""),
            new CobolText("DOT", ""),
            new CobolText("DISPLAY", ""),
            new CobolText("END", ""),
            new CobolText("NUMERICLITERAL", ""),
            new CobolText("FILENAME", "")),
        Map.of(
            "long1",
            new Diagnostic(
                null,
                "Copybook declaration has more than 8 characters for: IDENTIFICATION",
                Information,
                "COBOL Language Support - I"),
            "long2",
            new Diagnostic(
                null,
                "Copybook declaration has more than 8 characters for: NUMERICLITERAL",
                Information,
                "COBOL Language Support - I")));
  }
}
