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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks that structured variable calls with skipped intermediate levels don't produce
 * semantic errors.
 */
class TestVariableCallsWithSkippedLevels {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "           05  {$*INTERM1}.    COPY {~ASDQWE}.\n"
          + "       LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           SET {$CHILD} OF {$PARENT} TO TRUE.\n"
          + "           GOBACK.";

  private static final String ASDQWE =
      "           10 {$*INTERM2}.\n"
          + "               20  {$*INTERM3}  PIC X.\n"
          + "               20  {$*INTERM4}  PIC X.\n"
          + "                 88 {$*CHILD}    VALUE 'R'.";

  private static final String ASDQWE_NAME = "ASDQWE";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(ASDQWE_NAME, ASDQWE)), ImmutableMap.of());
  }
}
