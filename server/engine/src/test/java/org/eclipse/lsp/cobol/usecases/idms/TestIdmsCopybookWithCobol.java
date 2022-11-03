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
package org.eclipse.lsp.cobol.usecases.idms;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Idms copybook may contain COBOL code */
class TestIdmsCopybookWithCobol {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID. MIN.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY \"MAIN\".\n"
          + "           COPY IDMS {~IDMSCB!IDMS}.";

  private static final String IDMSCB = "           DISPLAY \"COPY\".\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("IDMSCB", IdmsDialect.NAME, IDMSCB)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
