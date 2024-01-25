/*
 * Copyright (c) 2024 Broadcom.
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
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.SortNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test for SORT statement
 */
class TestSortStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       ENVIRONMENT DIVISION.\r\n"
          + "       CONFIGURATION SECTION.\r\n"
          + "       SOURCE-COMPUTER. IBM-3090.\r\n"
          + "       OBJECT-COMPUTER. IBM-3090.\r\n"
          + "       INPUT-OUTPUT SECTION.\r\n"
          + "       FILE-CONTROL.\r\n"
          + "           SELECT {$SORT-WORK-FILE} ASSIGN TO UT-S-SORTFILE.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       FILE SECTION.\r\n"
          + "         SD  {$*SORT-WORK-FILE}\r\n"
          + "           RECORD CONTAINS 80 CHARACTERS\r\n"
          + "           DATA RECORD IS {$SORT-WORK-REC}.\r\n"
          + "         01  {$*SORT-WORK-REC}.\r\n"
          + "             05  {$*SWF-PARTNO}                      PIC  X(21).\r\n"
          + "             05  {$*SWF-REST-OF-REC}                 PIC  X(43).\r\n"
          + "             05  {$*SWF-MODEL}                       PIC  X(3).\r\n"
          + "             05  FILLER                          PIC  X(12).\r\n"
          + "             05  {$*SWF-REC-PAY-CODE}                PIC  X.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAIN-LINE}.\r\n"
          + "           SORT {$SORT-WORK-FILE}\r\n"
          + "               ASCENDING KEY {$SWF-PARTNO}\r\n"
          + "                 INPUT  PROCEDURE {#PAR-INPUT} OF SORT-SEC\r\n"
          + "                 OUTPUT PROCEDURE {#PAR-OUTPUT}.\r\n"
          + "       {@*SORT-SEC} SECTION.\r\n"
          + "       {#*PAR-INPUT}.\r\n"
          + "           DISPLAY 'PAR-INPUT'.\r\n"
          + "       {#*PAR-OUTPUT}.\r\n"
          + "           DISPLAY 'PAR-OUTPUT'.\r\n";

  @Test
  void test() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());

    SortNode sortNode = result.getRootNode().getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.SORT)
        .map(SortNode.class::cast)
        .findFirst()
        .orElse(null);

    assertNotNull(sortNode);
    assertTrue(sortNode.isAscending());
  }

}
