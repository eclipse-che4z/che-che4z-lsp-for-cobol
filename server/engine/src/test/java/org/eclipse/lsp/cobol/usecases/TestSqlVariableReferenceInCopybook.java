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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test the variable references within a SQL block present inside a copybook */
public class TestSqlVariableReferenceInCopybook {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.    CCB008.                                           \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       01 {$*AB} pic x.\n"
          + "       PROCEDURE DIVISION.                                              \n"
          + "           EXEC SQL                                                     \n"
          + "              INCLUDE {~CCPP0008}                                          \n"
          + "           END-EXEC.                                                    \n"
          + "           DISPLAY {$AB}.";

  public static final String COPYBOOK =
      "                  EXEC SQL                                              \n"
          + "                INSERT INTO CCA009                                      \n"
          + "                               ( C_S_EVEN                               \n"
          + "                                )                                       \n"
          + "                        VALUES( :{$AB}  )                                   \n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText("CCPP0008", COPYBOOK)), ImmutableMap.of());
  }
}
