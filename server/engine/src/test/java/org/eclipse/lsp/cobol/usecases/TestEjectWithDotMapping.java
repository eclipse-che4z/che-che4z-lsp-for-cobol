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

/** This test verifies that EJECT directive position is mapped without enabling the lookahead */
class TestEjectWithDotMapping {

  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\n"
          + "000200 PROGRAM-ID.   TEST1.\n"
          + "000000 DATA DIVISION.\n"
          + "000000 WORKING-STORAGE SECTION.\n"
          + "000000  EJECT.\n"
          + "000000  EJECT\n"
          + "000400 PROCEDURE DIVISION.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
