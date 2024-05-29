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

/** Test Read statement */
public class DivideTest {
    private static final String HEADER =
            "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

    @Test
    void case1() {
        String source =
                HEADER
                        + "       DIVINIT.\n"
                        + "           DIVIDE 64.3 INTO WRK9.\n"
                        + "           MOVE    1620.36 TO DIV1.";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(2, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }
    @Test
    void case2() {
        String source =
                HEADER
                        + "           DIVIDE AD\n"
                        + "             INTO WRK9 ROUNDED\n"
                        + "               ON SIZE ERROR\n"
                        + "                  MOVE \"1\" TO WRK01\n"
                        + "           NOT ON SIZE ERROR\n"
                        + "                  MOVE \"2\" TO WRK01.";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(3, result.getSourceUnit().list(Statement.class).size());
        // Statement should be nested
        assertEquals(2, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case3() {
        String source =
                HEADER
                        + "           DIVIDE A BY B GIVING ACCUMULATOR1.\n"
                        + "           IF ACCUMULATOR1 EQUAL TO 1 GO TO DIV-WRITE-F3-1.";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(3, result.getSourceUnit().list(Statement.class).size());
        // Statement should be nested
        assertEquals(1, result.getSourceUnit().list(Statement.class).get(1).list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }
}
