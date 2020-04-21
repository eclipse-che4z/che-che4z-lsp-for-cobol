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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/** This use case checks if the absence of dot at the end recognized as an error. */
public class TestExtraneousInputEOFExpecting extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           if (1 > 0) NEXT SENTENCE"; // No dot at the end of file

  public TestExtraneousInputEOFExpecting() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Number of diagnostics", 1, diagnostics.size());
    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals(
        "Extraneous input '<EOF>' expected {ACCEPT, ADD, ALTER, CALL, CANCEL, CLOSE, "
            + "COMPUTE, CONTINUE, DELETE, DISABLE, DISPLAY, DIVIDE, ENABLE, ENTRY, EVALUATE, "
            + "EXHIBIT, EXIT, GENERATE, GOBACK, GO, IF, INITIALIZE, INITIATE, INSPECT, MERGE, "
            + "MOVE, MULTIPLY, OPEN, PERFORM, PURGE, READ, RECEIVE, RELEASE, RETURN, REWRITE, "
            + "SEARCH, SEND, SERVICE, SET, SORT, START, STOP, STRING, SUBTRACT, TERMINATE, TITLE, "
            + "UNSTRING, WRITE, XML, DOT_FS, '*>CPYENTER', '*>CPYEXIT', EXECCICSLINE, EXECSQLIMSLINE, "
            + "EXECSQLLINE}",
        diagnostic.getMessage());

    Range range = diagnostic.getRange();
    assertEquals("Diagnostic start line", 5, range.getStart().getLine());
    assertEquals("Diagnostic start character", 35, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 5, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 35, range.getEnd().getCharacter());
  }
}
