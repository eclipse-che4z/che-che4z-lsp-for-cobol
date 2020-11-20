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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** Test cobol CICS intersected keywords are allowed as cobol program name. */
class TestKeywordInProgramId {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. AND.\n"
          + "       END PROGRAM AND.\n"
          + "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. TEST.\n"
          + "       END PROGRAM TEST.\n"
          + "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. ADDRESS.\n"
          + "       END PROGRAM ADDRESS.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
