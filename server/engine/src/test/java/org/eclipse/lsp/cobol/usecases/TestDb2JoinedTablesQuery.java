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

/** Test Joined table query for DB2 */
public class TestDb2JoinedTablesQuery {
  public static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "\n"
          + "       Procedure Division.\n"
          + "\n"
          + "           EXEC SQL \n"
          + "           declare dummy-cu cursor for \n"
          + "           select 'Y' from table t1\n"
          + "           inner join table t2 ON t1.key = t2.KEY\n"
          + "           inner join table t3 ON t3.key = t1.key\n"
          + "           END-EXEC.\n"
          + "\n"
          + "       End program HELLO-WORLD.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
