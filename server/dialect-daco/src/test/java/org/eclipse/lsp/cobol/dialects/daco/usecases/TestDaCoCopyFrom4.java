/*
 * Copyright (c) 2023 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** A test case for COPY FROM statement with line concatenation */
public class TestDaCoCopyFrom4 {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. PROGNAME.\n"
                  + "       ENVIRONMENT  DIVISION.\n"
                  + "       IDMS-CONTROL SECTION.\n"
                  + "       PROTOCOL. MODE BATCH DEBUG IDMS-RECORDS MANUAL.\n"
                  + "       DATA   DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01  {$*A-SYY}.\n"
                  + "           03 {$*AA-SYY`&AA-SXX} PIC X(4).\n"
                  + "       01  {$*B} PIC X(72)   VALUE                  \n"
                  + "           '-\n"
                  + "      -    '-'.\n"
                  + "       01  {$*A-SXX} COPY-FROM YY.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$A-SXX}.\n";



  @Test
  void test() {
     UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
