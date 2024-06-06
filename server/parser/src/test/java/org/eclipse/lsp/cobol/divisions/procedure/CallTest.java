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
 */
package org.eclipse.lsp.cobol.divisions.procedure;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

/** Test Call statement */
public class CallTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void case1() {
    String source =
        HEADER
            + "           CALL \"IC223A-1\" USING REFERENCE DN1, DN2, DN3, DN4;\n"
            + "               ON OVERFLOW MOVE \"OVERFLOW SHOULD NOT OCCUR\" TO RE-MARK\n"
            + "                           GO TO CALL-FAIL-03-01\n"
            + "           END-CALL.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    // Statement should be nested
    assertEquals(
        2, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());

  }

  @Test
  void case2() {
    String source = HEADER + "           CALL \"FIC401M\" USING BY CONTENT GLOB.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
  }

  @Test
  void case3() {
    String source = HEADER + "           CALL \"IC111A\" USING LS1 GRP-01 WS2. DISPLAY A";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
  }

  @Test
  void case4() {
    String source =
        HEADER
            + "           CALL \"IC225A-1\" USING REFERENCE DN1,\n"
            + "                                 CONTENT   DN2,\n"
            + "                                 REFERENCE DN3,\n"
            + "                                 CONTENT   DN4,\n"
            + "               OVERFLOW MOVE \"OVERFLOW SHOULD NOT OCCUR\" TO RE-MARK\n"
            + "                           PERFORM FAIL\n"
            + "                           PERFORM PRINT-DETAIL.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(4, result.getSourceUnit().list(Statement.class).size());
    assertEquals(
            3, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case5() {
    String source =
        HEADER
            + "           CALL \"CEEDAYS\" USING\n"
            + "                  WS-DATE-TO-TEST,\n"
            + "                  WS-DATE-FORMAT,\n"
            + "                  OUTPUT-LILLIAN,\n"
            + "                  FEEDBACK-CODE\n"
            + "           MOVE WS-DATE-TO-TEST O WS-DATE";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
  }

  @Test
  void case6() {
    String source = HEADER + "           CALL \"FIC401M\" USING BY CONTENT GLOB.\n ID DIVISION";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
  }
}
