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

/** Test Return statement */
public class UnstringTest {
    private static final String HEADER =
            "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

    @Test
    void case1() {
    String source =
        HEADER
            + "           UNSTRING ID1-XN-7 DELIMITED BY ZERO\n"
            + "                    INTO ID4-X DELIMITER IN ID5-XN-4\n"
            + "                    COUNT IN ID6-DU-2V0\n"
            + "                    WITH POINTER ID10-DU-2V0\n"
            + "                    TALLYING ID11-DU-2V0\n"
            + "                    ON OVERFLOW  PERFORM PASS\n"
            + "                                 GO TO UST-WRITE-GF-1.\n";
        CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
        ParseResult result = parser.parse();
        assertEquals(0, result.getDiagnostics().size());
        assertEquals(3, result.getSourceUnit().list(Statement.class).size());
        // Statement should be nested
        assertEquals(2, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
        assertEquals(source, result.getSourceUnit().toText());
    }
}
