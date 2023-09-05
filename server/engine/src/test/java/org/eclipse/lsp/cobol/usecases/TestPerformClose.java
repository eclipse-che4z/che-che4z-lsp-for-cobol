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

/**
 * Paragraph name can be "CLOSE"
 */
class TestPerformClose {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. CLOSEPAR.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           PERFORM {#CLOSE}.\n"
          + "       {#*CLOSE}.\n"
          + "           DISPLAY 'CLOSE'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of());
  }
}
