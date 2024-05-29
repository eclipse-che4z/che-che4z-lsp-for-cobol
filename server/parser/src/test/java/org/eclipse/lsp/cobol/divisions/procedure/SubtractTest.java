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

/** Test Subtract statement */
public class SubtractTest {
    private static final String HEADER =
            "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

    @Test
    void case1() {
        String source =
                HEADER
                        + "           SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00 ON SIZE ERROR\n"
                        + "                    PERFORM PASS GO TO SUB-WRITE-F1-8-1.";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(3, result.getSourceUnit().list(Statement.class).size());
        // Statement should be nested
        assertEquals(2, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case2() {
    String source =
        HEADER
            + "           SUBTRACT CORRESPONDING GRP-FOR-ADD-CORR-1 FROM GRP-FOR-ADD-CORR-R.\n";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(1, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case3() {
    String source =
        HEADER
            + "           SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED ON \n"
            + "           SIZE ERROR MOVE \"G\" TO WRK-AN-00001.\n";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(2, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
        // Statement should be nested
        assertEquals(1, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case4() {
        String source =
                HEADER
                        + "           SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF\n"
                        + "               TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A\n"
                        + "               FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF\n"
                        + "               TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B\n"
                        + "               GIVING ACCUMULATOR1.\n";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(1, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case5() {
        String source =
                HEADER
                        + "           SUBTRACT TABLE1-NUM (INDEX1) FROM NUM-9V9.";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(1, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }

    @Test
    void case6() {
        String source =
                HEADER
                        + "           SUBTRACT A FROM B DISPLAY A";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(2, result.getSourceUnit().list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }
}
