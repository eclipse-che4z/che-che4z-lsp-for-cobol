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

/**
 * Tests program-id syntax. Ref -
 * https://www.ibm.com/docs/en/developer-for-zos/14.1?topic=structure-cobol-program
 */
public class TestProgramIdSyntaxRule {
  public static final String TEXT1 =
      "      *\n" + "       IDENTIFICATION DIVISION.\n" + "       PROGRAM-ID SLICKB0";

  public static final String TEXT2 =
      "      *\n" + "       IDENTIFICATION DIVISION.\n" + "       PROGRAM-ID. SLICKB0";

  public static final String TEXT3 =
      "      *\n" + "       IDENTIFICATION DIVISION.\n" + "       PROGRAM-ID. SLICKB0.";

  @Test
  void testWhenProgramIdAndProgramNameNotFollowedByDot_ThenNoError() {
    UseCaseEngine.runTest(TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testWhenProgramNameNotFollowedByDot_ThenNoError() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testWhenProgramIdAndProgramNameFollowedByDot_ThenNoError() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }
}
