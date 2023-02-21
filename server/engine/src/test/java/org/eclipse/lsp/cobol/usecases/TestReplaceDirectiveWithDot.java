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

/** Test the REPLACE compiler directive with a dot. */
class TestReplaceDirectiveWithDot {
  private static final String TEXT1 =
        "       IDENTIFICATION DIVISION.         \n"
      + "       PROGRAM-ID. HELLO.       \n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "           COPY {~COPY1} REPLACING ==VAR1.== BY ==VAR1.==.";

  private static final String COPYBOOK1 =
        "       01  {$*VAR0} PIC 9(02) VALUE ZERO.\n"
      + "       01  {$*VAR1}.\n"
      + "           05 {$*VAR2} PIC 9(02) VALUE ZERO.";

  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.         \n"
          + "       PROGRAM-ID. HELLO.       \n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "           COPY {~COPY2} REPLACING ==GARBAGE. TEXT== BY ====.";

  private static final String COPYBOOK2 =
      "         01 {$*VAR0} PIC 9(02) VALUE ZERO. GARBAGE. TEXT\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT1, ImmutableList.of(new CobolText("COPY1", COPYBOOK1)), ImmutableMap.of());
  }

  @Test
  void testDotInTheMiddle() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(new CobolText("COPY2", COPYBOOK2)), ImmutableMap.of());
  }

}
