/*
 * Copyright (c) 2023 Broadcom.
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
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;

/**
 * Tests a nested copybook with replacing can be used at multiple place in a cobol document.
 */
public class TestNestedCopybookMultipleUseInCobolDocument {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. Untitled-1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       1 {$*data1}.\n"
          + "         COPY {~copyfile}  REPLACING ==:filename:== by ==file1==.\n"
          + "         02 {$*SOME} pic x(9).\n"
          + "\n"
          + "       1 {$*dat2}.\n"
          + "         COPY {~copyfile} REPLACING ==:filename:== by ==file2==.\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO {$FILE2_OBJECT} of {$DAT2}.\n"
          + "           MOVE 0 TO {$FILE1_OBJECT} of {$DATA1}.\n"
          + "           move 0 to {$SOME}.";

  public static final String COPYBOOK1 =
      "      **************************************************************************\n"
          + "       COPY {~cpyFile1} SUPPRESS.\n"
          + "       ";

  public static final String COPYBOOK2 =
      "      **************************************************************************\n"
          + "         3 {$*:filename:_object^FILE2_OBJECT} PIC X(143).";

  @Test
  void test() {
    AnalysisResult analysisResult =
        UseCaseEngine.runTestForDiagnostics(
            TEXT,
            ImmutableList.of(
                new CobolText("COPYFILE", COPYBOOK1), new CobolText("CPYFILE1", COPYBOOK2)),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
    Assertions.assertEquals(analysisResult.getDiagnostics().get(DOCUMENT_URI).size(), 0);
    Optional<ProgramNode> programNode =
        analysisResult
            .getRootNode()
            .getDepthFirstStream()
            .filter(ProgramNode.class::isInstance)
            .map(ProgramNode.class::cast)
            .findFirst();
    Assertions.assertTrue(programNode.isPresent());
    Multimap<String, VariableNode> variables =
        analysisResult
            .getSymbolTableMap()
            .get(SymbolTable.generateKey(programNode.get()))
            .getVariables();
    Assertions.assertTrue(variables.containsKey("FILE2_OBJECT"));
    Assertions.assertTrue(variables.containsKey("FILE1_OBJECT"));
    Assertions.assertTrue(variables.containsKey("DAT2"));
    Assertions.assertTrue(variables.containsKey("DATA1"));
  }
}
