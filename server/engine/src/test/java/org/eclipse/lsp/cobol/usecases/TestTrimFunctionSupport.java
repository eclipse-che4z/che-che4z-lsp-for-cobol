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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test intrinsic function's trim support */
public class TestTrimFunctionSupport {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TRIM.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*TRIM-OUT-VAL}                     PIC X(80).\n"
          + "       LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*MAIN} SECTION.\n"
          + "           MOVE FUNCTION TRIM('TEST123   ', TRAILING)\n"
          + "             TO {$TRIM-OUT-VAL}\n"
          + "           MOVE FUNCTION TRIM('   TEST123', LEADING)\n"
          + "             TO {$TRIM-OUT-VAL}\n"
          + "           GOBACK.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
