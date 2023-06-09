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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test group variables with multiple copybooks processing
 */
class TestMultipleCopybooks {

  private static final String TEXT = "000300 IDENTIFICATION DIVISION.\n"
      + "000400 PROGRAM-ID.    BMROVF1M.\n"
      + "001600 ENVIRONMENT  DIVISION.\n"
      + "001700 IDMS-CONTROL SECTION.\n"
      + "001800 PROTOCOL.    MODE IS BATCH DEBUG\n"
      + "001900              IDMS-RECORDS MANUAL.\n"
      + "002300 DATA   DIVISION.\n"
      + "002400 WORKING-STORAGE SECTION.\n"
      + "007200 01  COPY IDMS {~SUBSCHEMA-SETNAMES!IDMS}.\n"
      + "007300 01  COPY IDMS {~SUBSCHEMA-AREANAMES!IDMS}.\n"
      + "007600 LINKAGE SECTION.\n"
      + "007800 01  COPY MAID {~LDDAFC1M!DaCo}.\n"
      + "008100 01  {$*TRAREC-XL1}.\n"
      + "008200     03 {$*F00-XL1}.\n"
      + "008300       05 COPY MAID {~LDROVF1M!DaCo} INP.";

  private static final String SETNAMES = "       01  {$*SUBSCHEMA-SETNAMES}.\n"
      + "           03 {$*HSTSTK-PROSTK}            PIC X(16)   VALUE\n"
      + "           'HSTSTK-PROSTK   '.\n"
      + "           03 {$*KMKBRO-KMKADD}            PIC X(16)   VALUE\n"
      + "           'KMKBRO-KMKADD   '.\n"
      + "           03 {$*SYSIDX-KMKBRO-I1}         PIC X(16)   VALUE\n"
      + "           'SYSIDX-KMKBRO-I1'.\n";

  private static final String AREANAMES = "       01  {$*SUBSCHEMA-AREANAMES}.\n"
      + "           03 {$*D0911-00}                 PIC X(16)   VALUE\n"
      + "           'D0911-00        '.\n"
      + "           03 {$*D0911-01}                 PIC X(16)   VALUE\n"
      + "           'D0911-01        '.\n"
      + "           03 {$*D4244-01}                 PIC X(16)   VALUE\n"
      + "           'D4244-01        '.\n";

  private static final String LDDAFC1M = "     1 01  {$*LDDAFC1M-XPC}.\n"
      + "    16     03 FILLER                   PIC X(44).";

  private static final String LDROVF1M = "     1 01  {$*LDROVF1M-X^LDROVF1M-XL1}.\n"
      + "     2     03 {$*TRAKOD-X^TRAKOD-XL1}                 PIC X(4)    VALUE SPACE.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(
            new CobolText("SUBSCHEMA-SETNAMES", IdmsDialect.NAME, SETNAMES),
            new CobolText("SUBSCHEMA-AREANAMES", IdmsDialect.NAME, AREANAMES),
            new CobolText("LDDAFC1M", DaCoDialect.NAME, LDDAFC1M),
            new CobolText("LDROVF1M", DaCoDialect.NAME, LDROVF1M)
        ), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

}
