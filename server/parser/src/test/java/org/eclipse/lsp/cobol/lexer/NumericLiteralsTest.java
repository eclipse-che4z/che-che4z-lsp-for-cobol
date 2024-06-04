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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.lexer.LexerTestUtils.assertToken;
import static org.junit.jupiter.api.Assertions.assertFalse;

/**
 * Test numeric literals tokenization
 */
class NumericLiteralsTest {
    //    https://www.ibm.com/docs/en/cobol-zos/6.4?topic=literals-numeric

    @ParameterizedTest(name = "[{index}] test {0}")
    @MethodSource("numbers")
    void floatingNumber(String token) {
        CobolLexer lexer = new CobolLexer(token);
        assertToken(lexer.forward(), token, 0, 0, 0);
        assertFalse(lexer.hasMore());
    }

    public static Stream<Arguments> numbers() {
        return Stream.of(
                Arguments.of("1"),
                Arguments.of("+1"),
                Arguments.of("-1"),
                Arguments.of("12"),
                Arguments.of("+12"),
                Arguments.of("-12"),
                Arguments.of("12.01"),
                Arguments.of("+12.01"),
                Arguments.of("-12.01"),
                Arguments.of("12.01E-78"),
                Arguments.of("+12.01E-78"),
                Arguments.of("-12.01E-78"),
                Arguments.of("12.01E+8"),
                Arguments.of("+12.01E+78"),
                Arguments.of("-12.01E+78"),
                Arguments.of("12E+8"),
                Arguments.of("+1E+78"),
                Arguments.of("-11E+78"),
                Arguments.of(".12E+8"),
                Arguments.of(".1E+78"),
                Arguments.of(".11E+78")
        );
    }
}
