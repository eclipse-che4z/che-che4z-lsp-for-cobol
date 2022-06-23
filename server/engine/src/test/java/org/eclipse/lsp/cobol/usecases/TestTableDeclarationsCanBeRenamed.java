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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that the table declarations can be renamed. */
class TestTableDeclarationsCanBeRenamed {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          02 {$*VARNAME2} OCCURS 5 TIMES PIC 9.\n"
          + "       66 {$*VARNAME3} RENAMES {$VARNAME2}.\n"
          + "       01 {$*VARNAME4}.\n"
          + "          02 {$*VARNAME5} OCCURS 5 TIMES.\n"
          + "            03 {$*VARNAME6} PIC 9.\n"
          + "       66 {$*VARNAME7} RENAMES {$VARNAME5}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
