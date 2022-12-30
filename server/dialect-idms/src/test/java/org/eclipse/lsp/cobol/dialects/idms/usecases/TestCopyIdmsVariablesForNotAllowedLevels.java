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

package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/** Test the variables for IDMS copybooks are not modified for Level 66/77/88 */
public class TestCopyIdmsVariablesForNotAllowedLevels {

  private static final String TEXT_IDMS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TESTPRM.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*MRB}.\n"
          + "           03 COPY IDMS {~COPY1!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           OBTAIN NEXT {$MRB} WITHIN {$VAR3}.\n";

  private static final String COPY1 =
      "       01  {$*VAR1}.                                                      \n"
          + "            03  {$*VAR2}           PIC X(8)                                 \n"
          + "                                       VALUE  SPACES .                          \n"
          + "             88  {$*VAR3}          VALUE  '0000' . ";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT_IDMS,
            ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPY1)),
            ImmutableMap.of(),
            ImmutableList.of(),
            DialectConfigs.getIDMSAnalysisConfig());

    ProgramNode program =
        result
            .getRootNode()
            .getDepthFirstStream()
            .filter(node -> node instanceof ProgramNode)
            .map(ProgramNode.class::cast)
            .findFirst()
            .orElse(null);
    Assertions.assertNotNull(program);
    String generateKey = SymbolTable.generateKey(program);
    result
        .getSymbolTableMap()
        .get(generateKey)
        .getVariables()
        .get("VAR3")
        .forEach(
            ele ->
                Assertions.assertEquals(ele.getVariableType(), VariableType.CONDITION_DATA_NAME));
  }
}
