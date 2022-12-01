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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that a multi-table and index variables may be global. */
class TestIndexItemMayBeGlobal {
  private static final String TEXT =
      "       identification division.\n"
          + "       program-id. asdf.\n"
          + "       data division.\n"
          + "       working-storage section.\n"
          + "       01 {$*VAR1} global OCCURS 5 times indexed by {$*INDX}.\n"
          + "       1 {$*c-xml-rsp-dsc} global.\n"
          + "       2 {$*c-xml-rsp-len} comp pic 9(8).\n"
          + "       procedure division.\n"
          + "           display {$INDX}.\n"
          + "           display {$VAR1}.\n"
          + "           display {$C-XML-RSP-DSC}.\n"
          + "           display {$C-XML-RSP-LEN}.\n"
          + "       identification division.\n"
          + "       program-id. nested.\n"
          + "       procedure division.\n"
          + "           display {$INDX}.\n"
          + "           display {$VAR1}.\n"
          + "           display {$C-XML-RSP-DSC}.\n"
          + "           display {$C-XML-RSP-LEN}.\n"
          + "       \n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
