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

/** Test sql host variables */
public class TestSqlHostVariableVarbinary {
  public static final String TEXT =
      "        Identification Division.\n"
          + "        Program-Id. VBT.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "       01 {$*VAR-VBIN`->VAR-VBIN`->VAR-VBIN-LEN`->VAR-VBIN-TEXT} USAGE IS SQL TYPE IS VARBINARY(100).\n"
          + "        PROCEDURE DIVISION.\n"
          + "           DISPLAY {$VAR-VBIN}.\n"
          + "           DISPLAY {$VAR-VBIN-LEN}.\n"
          + "           DISPLAY {$VAR-VBIN-TEXT}.\n";

  @Test
  void testSupportForResultSetLocator() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
