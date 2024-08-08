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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Test CICS RECEIVE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">RECEIVE
 * Command</a>
 *
 * <p>This class tests all variations of the RECEIVE command found in the link above.
 */
public class TestCicsReceive {
  private static final String DEFAULT_BASE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  private static final String[] DEFAULT_ALL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO(100)", "LENGTH(10)", "MAXLENGTH(100)", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_ALL_OPTIONS_INVALID_ONE = {
    "{RECEIVE|1}", "INTO(100)", "MAXLENGTH(100)", "LENGTH(10)", "MAXLENGTH(100)", "NOTRUNCATE"
  };

  private static String getTestString(String[] components) {
    for (int i = 0; i < components.length; i++) {
      components[i] = "                " + components[i];
    }
    ArrayList<String> base = new ArrayList<String>(Arrays.asList(DEFAULT_BASE_TEXT.split("\n")));
    base.addAll(base.indexOf("            END-EXEC."), Arrays.asList(components));
    return String.join("\n", base);
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
