/*
 * Copyright (c) 2021 Broadcom.
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

/**
 * This test checks that redefined variable has correct usage even if names the same.
 */
public class TestVariableRedefinesSameNameInDifferentGroup {
  private static final String REDEFINES =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "          01 {$*WS-DESCRIPTION1}.\n"
          + "              05 {$*WS-DATE1} PIC X(20).\n"
          + "              05 {$*WS-DATE2} REDEFINES {$WS-DATE1} PIC 9(8).\n"
          + "          01 {$*WS-DESCRIPTION2}.\n"
          + "              05 {$*WS-DATE1} PIC X(20).\n"
          + "              05 {$*WS-DATE2} REDEFINES {$WS-DATE1} PIC 9(8).";

  @Test
  void testError() {
    UseCaseEngine.runTest(REDEFINES, ImmutableList.of(), ImmutableMap.of());
  }
}
