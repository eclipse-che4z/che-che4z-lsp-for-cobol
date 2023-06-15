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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * This test verifies that mapping is working properly for copybooks with line concatenation
 */
class TestMappingComplexCopybook {

  private static final String TEXT = "       IDENTIFICATION DIVISION.                                         \n"
      + "       PROGRAM-ID.                                                      \n"
      + "           SM206A.                                                      \n"
      + "       DATA DIVISION.                                                   \n"
      + "       WORKING-STORAGE SECTION.                                         \n"
      + "       PROCEDURE DIVISION.                                              \n"
      + "       {@*SECT-SM206-0002} SECTION.                                         \n"
      + "       {#*PST-TEST-002}.                                                    \n"
      + "           COPY                                                    {~KP002}\n"
      + "                   REPLACING == WRK-DS-09V00-901                        \n"
      + "                                SUBTRACT 1 FROM                         \n"
      + "                                WRK-DS-05V00-O005-001 IN GRP-002 (1)==  \n"
      + "                   BY         WRK-DS-05V00-O005-001 IN WRK-XN-00050-O005\n"
      + "      -                  F-001 IN GRP-006 IN GRP-004 IN GRP-002 IN GRP-0\n"
      + "      -    01 (1){|3}.                                                      \n"
      + "       {#*PAR2}.                                                      \n";

  private static final String COPYBOOK = "      *HEADER,CLBRY,KP002                                                       \n"
      + "000100     MOVE   +00009 TO {WRK-DS-05V00-O005-001|1}  IN WRK-XN-00050-O005FKP0024.2\n"
      + "000200-            -001 OF GRP-006 OF GRP-004 IN GRP-003 ( 2 ).         KP0024.2\n"
      + "000300     ADD                                                          KP0024.2\n"
      + "000400         +00001 TO                                                KP0024.2\n"
      + "000500                   WRK-DS-09V00-901                               KP0024.2\n"
      + "000600                                   SUBTRACT                       KP0024.2\n"
      + "000700                                            1                     KP0024.2\n"
      + "000800                                             FROM                 KP0024.2\n"
      + "000900                  {WRK-DS-05V00-O005-001|2} IN GRP-002 (1).           KP0024.2\n"
      + "000900    {#*PAR1}.\n"
      + "      *END-OF,KP002                                                             ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText("KP002", COPYBOOK)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(1, 28), new Position(1, 115)),
                "Variable WRK-DS-05V00-O005-001 is not defined",
                Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(new Position(5, 25), new Position(9, 59)),
                "Variable WRK-DS-05V00-O005-001 is not defined",
                Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(new Position(8, 11), new Position(14, 18)),
                "Errors inside the copybook",
                Error,
                ErrorSource.COPYBOOK.getText())
        )
    );
  }
}
