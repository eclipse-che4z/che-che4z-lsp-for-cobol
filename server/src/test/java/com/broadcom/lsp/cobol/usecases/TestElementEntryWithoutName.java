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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This test checks the variable definition without a name doesn't throw an exception. */
class TestElementEntryWithoutName {
  private static final String TEXT =
      "        Identification Division.\n"
          + "        Program-Id. 'TEST'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       1 {$*PARENT}.\n"
          + "       2 pic x(11) value \n"
          + "            'dfhcommarea'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
