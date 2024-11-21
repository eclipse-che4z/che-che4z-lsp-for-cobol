/*
 * Copyright (c) 2024 Broadcom.
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

// import com.google.common.collect.ImmutableList;
// import com.google.common.collect.ImmutableMap;
// import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
// import org.junit.jupiter.api.Test;

/**
 * Test CICS INQUIRE URIMAP Ref:
 * https://www.ibm.com/docs/en/cics-ts/6.1?topic=commands-inquire-urimap
 */
public class TestCicsInquireUrimap {
  /** below program is a generated code from the grammar. Do not showcase the actual code */
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*variable}.\n"
          + "            05 {$*var} pic x.\n"
          + "       PROCEDURE DIVISION.\n"
          + "\n"
          + "            EXEC CICS \n"
          + "              inquire URIMAp ( 09099    )  \n"
          + "                  aPpLICaTION ( X\"cEfffD5\"  )  \n"
          + "                  ApPLmIcrOver ( 4    ) \n"
          + "                  DeFINetimE ( 12990    )\n"
          + "                  IpreSolved ( {$variable} )  \n"
          + "                  teMplAteNaME ( +,92E-9   )  \n"
          + "                  anALyZersTAT ( AdDresS of liNaGE-CoUNTEr       )\n"
          + "                  anALyZersTAT ( AdDresS of liNaGE-CoUNTEr       )\n"
          + "                  iNSTAlLAGENt ( Z\"\"   )     \n"
          + "            END-EXEC.";

  //  @Test
  //  void test() {
  //    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  //  }
}
