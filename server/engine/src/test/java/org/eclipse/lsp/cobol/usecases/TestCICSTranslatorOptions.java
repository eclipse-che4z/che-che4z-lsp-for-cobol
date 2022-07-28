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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/**
 * Tests CICS translator options. Refer <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.1?topic=compilation-using-cics-translator">CICS
 * translator</a> for more details.
 */
public class TestCICSTranslatorOptions {
  public static final String PREFIX = "       CBL XOPTS (";
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AB01FORE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.";

  public static final String MIXED_COMPILER_DIRECTIVE_CICS_TRANSLATOR =
      "       CBL XOPTS (COBOL3 CBLCARD) ADATA, NOADATA AFP(NOVOLATILE)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AB01FORE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.";

  private static Stream<String> getOptions() {
    return Stream.of(
        "APOST",
        "CBLCARD",
        "CICS",
        "COBOL2",
        "COBOL3",
        "CPSM",
        "DBCS",
        "DEBUG",
        "DLI",
        "EDF",
        "EXCI",
        "FEPI",
        "FLAG(I)",
        "FLAG(W)",
        "FLAG(E)",
        "FLAG(S)",
        "LENGTH",
        "LINECOUNT(1)",
        "LINECOUNT(2)",
        "LINKAGE",
        "NATLANG",
        "NOCBLCARD",
        "NOCPSM",
        "NODEBUG",
        "NOEDF",
        "NOFEPI",
        "NOLENGTH",
        "NOLINKAGE",
        "NONUM",
        "NOOPTIONS",
        "NOSEQ",
        "NOSPIE",
        "NOVBREF",
        "NUM",
        "OPTIONS",
        "QUOTE",
        "SEQ",
        "SP",
        "SPACE(1)",
        "SPACE(2)",
        "SPACE(3)",
        "SPIE",
        "SYSEIB",
        "VBREF");
  }

  @ParameterizedTest
  @MethodSource("getOptions")
  void testOption(String cblOption) {
    UseCaseEngine.runTest(PREFIX + cblOption + ")\n" + TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testCompilerDirectivesMixedWithCICSTranslatorOptions() {
    UseCaseEngine.runTest(
        MIXED_COMPILER_DIRECTIVE_CICS_TRANSLATOR, ImmutableList.of(), ImmutableMap.of());
  }
}
