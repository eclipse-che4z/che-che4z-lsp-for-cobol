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

/** Test the REPLACE compiler directive. */
class TestReplaceDirectiveCaseInsensitive {
  private static final String TEXT =
        "       IDENTIFICATION DIVISION.         \n"
      + "       PROGRAM-ID. HELLO.\n"
      + "       REPLACE ==END-DISPLAY== BY ====.\n"
      + "       PROCEDURE DIVISION.\n"
      + "       {#*MAIN-PARAGRAPH}.\n"
      + "              display \"hello world\"\n"
      + "              end-display\n"
      + "              goback.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
