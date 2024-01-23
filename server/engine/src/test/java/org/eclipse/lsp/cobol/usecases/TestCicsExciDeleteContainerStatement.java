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

/**
 * Tests CICS EXCI DELETE CONTAINER statement. Ref:
 * https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-link-command-exci
 */
public class TestCicsExciDeleteContainerStatement {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEXTEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*CHECK} pic x(9).\n"
          + "       01 {$*evaluate-var} pic x(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS \n"
          + "               DELETE CONTAINER({$EVALUATE-VAR}) \n"
          + "               CHANNEL({$CHECK}) \n"
          + "               RETCODE({$CHECK})\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
