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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/** This test checks that COUNT variable name is allowed. */
class TestCOUNTVariableNameAllowed {

  //      SYSPRINT OUTPUT
  // 0  000001                 IDENTIFICATION DIVISION.
  //          000002                 PROGRAM-ID. TEST1.
  //   000003                 DATA DIVISION.
  //          000004                 WORKING-STORAGE SECTION.
  //          000005                 01 COUNT PIC 9.
  //                    000000000 1C
  //
  // ==000005==> IGYDS1089-S "COUNT" was invalid.  Scanning was resumed at the next area "A" item,
  //  level-number, or the start of the next clause.
  //
  //   000006                 PROCEDURE DIVISION.
  //          000007                 COUNT.
  //
  // ==000007==> IGYPS0009-E "COUNT" should not begin in area "A".  It was processed as if found in
  //  area "B".
  //
  //          ==000007==> IGYPS2072-S "COUNT" was invalid.  Skipped to the next verb, period or
  // procedure-name
  //  definition.
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. TEST1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*COUNT} PIC 9.\n" // COUNT variable name allowed
          + "        PROCEDURE DIVISION.\n"
          + "        {#*COUNT}.\n" // COUNT paragraphName allowed
          + "        END PROGRAM TEST1.";

  @Test
  @Disabled(
      "Issue https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/646 is not valid. Check sysprint attached along with this class")
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
