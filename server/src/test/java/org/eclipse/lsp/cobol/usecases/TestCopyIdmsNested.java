/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.junit.jupiter.api.Test;

/**
 * Test for nested COPY IDMS statement inside the IDMS copybook
 */
public class TestCopyIdmsNested {

  private static final String TEXT = "        IDENTIFICATION DIVISION. \n"
      + "        PROGRAM-ID. test1.\n"
      + "        DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*NAME1}.\n"
      + "           03 COPY IDMS {~COPY1}.\n"
      + "       PROCEDURE DIVISION.\n";

  private static final String COPY1 =        "       01  COPY IDMS {~NESTED_COPY}.\n";
  private static final String NESTED_COPY =  "       01  {$*NESTED_COPY}.\n"
      + "           03 {$*RANDOM-NAME}            PIC X(16).\n";

  @Test
  void testNestedIdmsCopybook() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPY1),
            new CobolText("NESTED_COPY", IdmsDialect.NAME, null, NESTED_COPY, UseCaseUtils.toURI("COPY1"))),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }
}
