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

/** This test checks the RES compiler directive doesn't produce a syntax error. */
class TestNoErrorsOnRes {
  private static final String TEXT =
      "        CBL RES\n       IDENTIFICATION DIVISION.\n          PROGRAM-ID. TEST1.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
