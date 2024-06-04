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
package org.eclipse.lsp.cobol.divisions.procedure.bugs;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

/** Perform \n PASS. - PASS. confused with PARAGRAPH name. */
public class PerformCommentEofTest {
  @Test
  void test() {
    String performStatement = "PERFORM\n" + "       \n" + "            PASS.";
    String gotoStatement = " GO TO A.\n";
    String source =
        "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID. TEST1.\n"
            + "       PROCEDURE DIVISION.\n"
            + "       A.\n           "
            + performStatement
            + gotoStatement;

    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    Statement statement =
        (Statement)
            parseResult
                .getSourceUnit()
                .getChildren()
                .get(1)
                .getChildren()
                .get(3)
                .getChildren()
                .get(6) // PARAGRAPH A.
                .getChildren()
                .get(4); // The perform statement
    assertTrue(parseResult.getDiagnostics().isEmpty());
    assertEquals(performStatement, statement.toText());
    assertEquals(source, parseResult.getSourceUnit().toText());
  }
}
