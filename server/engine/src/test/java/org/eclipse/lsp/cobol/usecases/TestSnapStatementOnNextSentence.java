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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** SNAP FROM with ON and NEXT SENTENCE should not cause errors during analysis */
class TestSnapStatementOnNextSentence {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*SUSCHEMA}.\n"
          + "            05 {$*SUBSCHEMA-CTRL} PIC X.\n"
          + "            05 {$*SUBSCHEMA-CTRL-END} PIC X.\n"
          + "            05 {$*ANY-STATUS} PIC X.\n"
          + "        PROCEDURE DIVISION.\n"
          + "            SNAP FROM {$SUBSCHEMA-CTRL} TO {$SUBSCHEMA-CTRL-END} ON \n"
          + "               {$ANY-STATUS} NEXT SENTENCE.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
