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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test that the functional identifiers are allowed in copy replace statement. COBOL LSP supports
 * just the syntax, actual manipulation of function doesn't take place.
 */
class TestFunctionalIdentifiersAllowedInCopyReplace {
  private static final String BASE =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n";
  private static final String TEXT =
      BASE
          + "5      COPY {~DEMO1} REPLACING TAG_ID BY FUNCTION CONCAT(\"ACC\",\"_ID\").\n"
          + "8      PROCEDURE DIVISION.";

  private static final String TEXT2 =
      BASE
          + "5      COPY {~DEMO1} REPLACING FUNCTION CONCAT(\"ACC\",\"_ID\") BY TAG_ID.\n"
          + "8      PROCEDURE DIVISION.";

  private static final String DEMO1 = "     \n";
  private static final String DEMO1_NAME = "DEMO1";

  @Test
  void testReplacementWithFunctionIdentifier() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(DEMO1_NAME, DEMO1)), ImmutableMap.of());
  }

  @Test
  void testReplaceableWithFunctionIdentifier() {
    UseCaseEngine.runTest(
        TEXT2, ImmutableList.of(new CobolText(DEMO1_NAME, DEMO1)), ImmutableMap.of());
  }
}
