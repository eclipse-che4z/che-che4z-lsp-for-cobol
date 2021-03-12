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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks that parser collect variable usages in call statement correctly.
 */
class TestCallVariableUsages {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*Variable} PIC 9(9).\n"
          + "       Procedure Division.\n"
          + "           call {%\"foobar\"} using {$VARIABLE}.\n"
          + "           call {%\"foobar\"} using by VALUE {$Variable}.\n"
          + "           call {%\"foobar\"} using by content {$VARIABLE}.\n"
          + "           call {%\"foobar\"} using by reference {$VARIABLE}.\n"
          + "       End program HELLO-WORLD.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("FOOBAR"));
  }
}
