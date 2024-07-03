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
package org.eclipse.lsp.cobol;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Test complex IF condition parsing */
public class IsElseCaseTest {
    private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID. IFELSE.\n"
            + "       DATA DIVISION. \n"
            + "       WORKING-STORAGE SECTION.\n"
            + "       77  C1  PIC 9 VALUE 0.\n"
            + "       77  C2  PIC 9 VALUE 0.\n"
            + "       77  C3  PIC 9 VALUE 0.\n"
            + "       PROCEDURE DIVISION.\n"
            + "           IF C1 EQUAL \"1\"\n"
            + "               IF C2 EQUAL \"2\"\n"
            + "                   IF C3 EQUAL \"3\"\n"
            + "                       DISPLAY \"C3 TRUE\"\n"
            + "                   ELSE\n"
            + "                       DISPLAY \"C3 FALSE\"\n"
            + "               ELSE\n"
            + "                   DISPLAY \"DOT\".";

    @Test
    void test() {
        CobolLexer antlrLexer = new CobolLexer(CharStreams.fromString(TEXT));
        CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
        CobolParser antlrParser = new CobolParser(tokens);
        antlrParser.startRule();
        assertEquals(0, antlrParser.getNumberOfSyntaxErrors());
    }
}
