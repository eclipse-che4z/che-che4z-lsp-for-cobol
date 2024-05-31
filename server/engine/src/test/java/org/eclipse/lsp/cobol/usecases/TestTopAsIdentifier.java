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

/** TOP is allowed as a name for variables, paragraphs, etc. */
class TestTopAsIdentifier {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       working-storage section.\n"
          + "       01 {$*TOP} PIC 9.\n"
          + "       procedure division.\n"
          + "       {#*TOP}.\n"
          + "           MOVE 0 TO {$TOP}.";
//    ----------- SYSPRINT ----------------
//  LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
//0  000001                IDENTIFICATION DIVISION.
//          000002                PROGRAM-ID. TEST1.
//   000003                DATA DIVISION.
//          000004                working-storage section.
//          000005                01 TOP PIC 9.                                                                       000000000 1C
//
// ==000005==> IGYDS1089-S "TOP" was invalid.  Scanning was resumed at the next area "A" item,
//  level-number, or the start of the next clause.
//
//   000006                procedure division.
//          000007                TOP.
//
// ==000007==> IGYPS0009-E "TOP" should not begin in area "A".  It was processed as if found in area
//                         "B".
//
//                                 ==000007==> IGYPS2072-S "TOP" was invalid.  Skipped to the next verb, period or procedure-name
//  definition.
//
// ==000007==> IGYPS0009-E ". " should not begin in area "A".  It was processed as if found in area
//                         "B".
//
//                                 000008                    MOVE 0 TO TOP.
//
//          ==000008==> IGYPS2000-S Expected a data-name, but found "TOP".  The "MOVE" statement was
//  discarded.
  @Test
  @Disabled(" Issue https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/issues/1004, is not valid. Check sysprint attached along with this class")
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
