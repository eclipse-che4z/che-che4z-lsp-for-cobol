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

import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the copybook name with quotes processed successfully
 */
class TestCopybookNameWithQuotes {
  private static final String TEXT =
          "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. PARTEST.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n";

  private static final String QUITES_LOWERCASE = "            COPY {~'cpbtest'}.\n";
  private static final String DOUBLE_QUITES = "            COPY {~\"CPBTEST\"}.\n";

  private static final String COPYBOOK =
      "         {#*PROGA}.";

  @Test
  void assertCopybookWithQuotesProcessing() {
    UseCaseEngine.runTest(TEXT + QUITES_LOWERCASE, ImmutableList.of(new CobolText("CPBTEST", COPYBOOK)), ImmutableMap.of());
  }

  @Test
  void assertCopybookWithDoubleQuotesProcessing() {
    UseCaseEngine.runTest(TEXT + DOUBLE_QUITES, ImmutableList.of(new CobolText("CPBTEST", COPYBOOK)), ImmutableMap.of());
  }

}
