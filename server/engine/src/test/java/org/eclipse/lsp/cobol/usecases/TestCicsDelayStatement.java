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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test CICS DELAY statement as per https://www.ibm.com/docs/en/cics-ts/6.1?topic=summary-delay */
public class TestCicsDelayStatement {
  private static final String PREFIX =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEXTEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*CHECK} pic x(9).\n"
          + "       PROCEDURE DIVISION.\n";
  public static final String TEXT =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY FOR MILLISECS(500) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  public static final String TEXT2 =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY INTERVAL({$CHECK}) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  public static final String TEXT3 =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY UNTIL HOURS(500) MINUTES(800) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  @Test
  void test_delayStatement_flow1() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_delayStatement_flow2() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_delayStatement_flow3() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }
}
