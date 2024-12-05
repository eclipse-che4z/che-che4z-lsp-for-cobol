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

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/** Checks CICS Move rules for required and invalid options */
public class TestCicsMove {
    private static final String MOVE_ALL_VALID_ONE = "MOVE CONTAINER(1) AS(2) FROMPROCESS TOPROCESS";
    private static final String MOVE_ALL_VALID_TWO = "MOVE CHANNEL(4) AS(2) TOCHANNEL(5) CONTAINER(1)";
    private static final String MOVE_ALL_VALID_THREE = "MOVE FROMPROCESS CONTAINER(2) AS(3) TOACTIVITY(4)";
    private static final String MOVE_ALL_VALID_FOUR = "MOVE TOPROCESS AS(2) CONTAINER(1) FROMACTIVITY(4)";

    private static final String MOVE_SOME_VALID_ONE = "MOVE CONTAINER(2) TOPROCESS AS(3)";
    private static final String MOVE_SOME_VALID_TWO = "MOVE CHANNEL(1) AS(3) CONTAINER(2)";
    private static final String MOVE_SOME_VALID_THREE = "MOVE FROMACTIVITY(2) CONTAINER(1) AS(2)";
    private static final String MOVE_SOME_VALID_FOUR = "MOVE CONTAINER(1) AS(2) TOCHANNEL(3)";

    private static final String MOVE_BARE_VALID = "MOVE CONTAINER(1) AS(2)";

    private static final String MOVE_INVALID_ONE = "MOVE CONTAINER(1) AS(2) {CHANNEL|error1}(1) TOPROCESS";
    private static final String MOVE_INVALID_TWO = "MOVE {FROMACTIVITY|error1}(2) AS(3) CONTAINER(1) {FROMPROCESS|error1}";
    private static final String MOVE_INVALID_THREE = "MOVE FROMPROCESS CONTAINER(1) AS(2) {TOCHANNEL|error1}(3)";
    private static final String MOVE_INVALID_FOUR = "MOVE AS(2) CONTAINER(1) {CHANNEL|error1}(3) TOACTIVITY(4)";

    @Test
    void testMoveAllValidOne() {
        CICSTestUtils.noErrorTest(MOVE_ALL_VALID_ONE);
    }

    @Test
    void testMoveAllValidTwo() {
        CICSTestUtils.noErrorTest(MOVE_ALL_VALID_TWO);
    }

    @Test
    void testMoveAllValidThree() {
        CICSTestUtils.noErrorTest(MOVE_ALL_VALID_THREE);
    }

    @Test
    void testMoveAllValidFour() {
        CICSTestUtils.noErrorTest(MOVE_ALL_VALID_FOUR);
    }

    @Test
    void testMoveSomeValidOne() {
        CICSTestUtils.noErrorTest(MOVE_SOME_VALID_ONE);
    }

    @Test
    void testMoveSomeValidTwo() {
        CICSTestUtils.noErrorTest(MOVE_SOME_VALID_TWO);
    }

    @Test
    void testMoveSomeValidThree() {
        CICSTestUtils.noErrorTest(MOVE_SOME_VALID_THREE);
    }

    @Test
    void testMoveSomeValidFour() {
        CICSTestUtils.noErrorTest(MOVE_SOME_VALID_FOUR);
    }

    @Test
    void testMoveBareValid() {
        CICSTestUtils.noErrorTest(MOVE_BARE_VALID);
    }

    @Test
    void testMoveInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: CHANNEL with TOPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(MOVE_INVALID_ONE, expectedDiagnostics);
    }

    @Test
    void testMoveInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: FROMPROCESS or FROMACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(MOVE_INVALID_TWO, expectedDiagnostics);
    }

    @Test
    void testMoveInvalidThree() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: TOCHANNEL with FROMPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(MOVE_INVALID_THREE, expectedDiagnostics);
    }

    @Test
    void testMoveInvalidFour() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: CHANNEL with TOACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(MOVE_INVALID_FOUR, expectedDiagnostics);
    }
}
