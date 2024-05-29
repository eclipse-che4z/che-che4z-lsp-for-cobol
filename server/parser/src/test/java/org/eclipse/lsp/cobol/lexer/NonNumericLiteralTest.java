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
package org.eclipse.lsp.cobol.lexer;

import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.lexer.LexerTestUtils.assertToken;

/**
 * Make sure that we can distinguish 100-A from 100-100
 */
class NonNumericLiteralTest {
    @Test
    void test() {
        CobolLexer lexer = new CobolLexer("0000-MAIN ");
        assertToken(lexer.forward(), "0000-MAIN", 0, 0, 0);
        assertToken(lexer.forward(), " ", 0, 9, 9);
    }

    @Test
    void minusAtTheEndOfWord() {
        CobolLexer lexer = new CobolLexer("W-11- -2");
        assertToken(lexer.forward(), "W-11", 0, 0, 0);
        assertToken(lexer.forward(), "-", 0, 4, 4);
        assertToken(lexer.forward(), " ", 0, 5, 5);
        assertToken(lexer.forward(), "-2", 0, 6, 6);
    }

    @Test
    void minusMinusAtTheEndOfWord() {
        CobolLexer lexer = new CobolLexer("W-11-- -2");
        assertToken(lexer.forward(), "W-11", 0, 0, 0);
        assertToken(lexer.forward(), "--", 0, 4, 4);
        assertToken(lexer.forward(), " ", 0, 6, 6);
        assertToken(lexer.forward(), "-2", 0, 7, 7);
    }
    @Test
    void minusMinusAtTheEndOfWord2() {
        CobolLexer lexer = new CobolLexer("W---11-- -2");
        assertToken(lexer.forward(), "W---11", 0, 0, 0);
        assertToken(lexer.forward(), "--", 0, 6, 6);
        assertToken(lexer.forward(), " ", 0, 8, 8);
        assertToken(lexer.forward(), "-2", 0, 9, 9);
    }

    @Test
    void minusesInCobolWord() {
        CobolLexer lexer = new CobolLexer("SEP-WRITE-5 ");
        assertToken(lexer.forward(), "SEP-WRITE-5", 0, 0, 0);
        assertToken(lexer.forward(), " ", 0, 11, 11);
    }

    @Test
    void symbols() {
        CobolLexer lexer = new CobolLexer("(A,B)");
        assertToken(lexer.forward(), "(", 0, 0, 0);
        assertToken(lexer.forward(), "A", 0, 1, 1);
        assertToken(lexer.forward(), ",", 0, 2, 2);
        assertToken(lexer.forward(), "B", 0, 3, 3);
        assertToken(lexer.forward(), ")", 0, 4, 4);
    }

    @Test
    void operands() {
        CobolLexer lexer = new CobolLexer("<= >= =< => * **");
        assertToken(lexer.forward(), "<=", 0, 0, 0);
        assertToken(lexer.forward(), " ", 0, 2, 2);
        assertToken(lexer.forward(), ">=", 0, 3, 3);
        assertToken(lexer.forward(), " ", 0, 5,  5);
        assertToken(lexer.forward(), "=", 0, 6, 6);
        assertToken(lexer.forward(), "<", 0, 7, 7);
        assertToken(lexer.forward(), " ", 0, 8, 8);
        assertToken(lexer.forward(), "=", 0, 9, 9);
        assertToken(lexer.forward(), ">", 0, 10, 10);
        assertToken(lexer.forward(), " ", 0, 11, 11);
        assertToken(lexer.forward(), "*", 0, 12, 12);
        assertToken(lexer.forward(), " ", 0, 13, 13);
        assertToken(lexer.forward(), "**", 0, 14, 14);
    }

}
