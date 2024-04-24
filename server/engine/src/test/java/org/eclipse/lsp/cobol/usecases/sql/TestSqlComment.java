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
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test DB2 SQL comments */
public class TestSqlComment {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "             EXEC SQL \n"
          + "             open a\n"
          + "      *      select a from table a = b  \n"
          + "             select a from table -- random where stuffss ss sdjsd  \n"
          + "              END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
