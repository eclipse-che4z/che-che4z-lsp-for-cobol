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

/** This test checks that the CICS security query is properly parsed. */
public class TestCicsSecurityQuery {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.  \n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-RESOURCE-CLASS} PIC x VALUE 'a'.\n"
          + "       01 {$*WS-RESOURCE-PROFIL} PIC x VALUE 'a'.\n"
          + "       01 {$*WS-RESPONSE} PIC x VALUE 'a'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS QUERY\n"
          + "               SECURITY RESCLASS({$WS-RESOURCE-CLASS})\n"
          + "               RESID({$WS-RESOURCE-PROFIL})\n"
          + "               RESIDLENGTH(LENGTH OF {$WS-RESOURCE-PROFIL})\n"
          + "               READ({$WS-RESPONSE})\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
