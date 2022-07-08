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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test with two COPY REPLACING statements. Show how to generate two variable definitions from one
 * copybook.
 */
class TestReplacingSameCopybookTwice {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. REPLTEST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       copy {~BOOK1} replacing ==:TAG:== by ==FIRST==.\n"
          + "       copy {~BOOK2} replacing ==:TAG:== by ==SECOND==.\n"
          + "       Procedure Division.\n"
          + "           MOVE {$FIRST-XYZ} to {$SECOND-XYZ}.";

  private static final String BOOK1 = "       01 {$*:TAG:-XYZ^FIRST-XYZ} PIC 9.";
  private static final String BOOK2 = "       01 {$*:TAG:-XYZ^SECOND-XYZ} PIC 9.";

  @Test
  void testIt() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("BOOK1", BOOK1), new CobolText("BOOK2", BOOK2)),
        ImmutableMap.of());
  }
}
