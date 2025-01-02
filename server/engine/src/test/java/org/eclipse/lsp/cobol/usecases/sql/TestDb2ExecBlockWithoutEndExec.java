/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests that a mandatory END-EXEC is required for an exec block
 */
public class TestDb2ExecBlockWithoutEndExec {
    public static final String TEXT_EOF =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION .\n"
                    + "           EXEC SQL \n"
                    + "               SELECT DIAG_CODE FROM DIAG_CODES WHERE COPAY > {|1}100";

    @Test
    void testEndByEof() {
        UseCaseEngine.runTest(
                TEXT_EOF,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Missing token END-EXEC for the EXEC block",
                                DiagnosticSeverity.Error,
                                ErrorSource.PREPROCESSING.getText())));
    }

    public static final String TEXT_SEMICOLON =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION .\n"
                    + "           EXEC SQL \n"
                    + "               SELECT DIAG_CODE FROM DIAG_CODES WHERE COPAY > 100;\n"
                    + "       {|1}{#*A}.\n"
                    + "               DISPLAY {A|2}.\n";

    @Test
    void testEndSemicolon() {
        UseCaseEngine.runTest(
                TEXT_SEMICOLON,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Missing token END-EXEC for the EXEC block",
                                DiagnosticSeverity.Error,
                                ErrorSource.PREPROCESSING.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Variable A is not defined",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())));
    }

    public static final String TEXT_DOT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION .\n"
                    + "           EXEC SQL \n"
                    + "               SELECT DIAG_CODE FROM DIAG_CODES WHERE COPAY > 100{|1}.\n"
                    + "       {#*A}.\n"
                    + "               DISPLAY {A|2}.\n";

    @Test
    void testEndByDot() {
        UseCaseEngine.runTest(
                TEXT_DOT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Missing token END-EXEC for the EXEC block",
                                DiagnosticSeverity.Error,
                                ErrorSource.PREPROCESSING.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Variable A is not defined",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())));
    }

    public static final String TEXT_PARAGRAPH =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION .\n"
                    + "           EXEC SQL \n"
                    + "               SELECT DIAG_CODE FROM DIAG_CODES WHERE COPAY > 100\n"
                    + "       {|1}{#*A}.\n"
                    + "               DISPLAY {A|2}.\n";
    @Test
    void testEndByParagraph() {
        UseCaseEngine.runTest(
                TEXT_PARAGRAPH,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Missing token END-EXEC for the EXEC block",
                                DiagnosticSeverity.Error,
                                ErrorSource.PREPROCESSING.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Variable A is not defined",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())));
    }
}
