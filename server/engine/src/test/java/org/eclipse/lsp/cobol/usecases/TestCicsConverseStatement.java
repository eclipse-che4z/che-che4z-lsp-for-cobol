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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.*;

/**
 * Test CICS CONVERSE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">CONVERSE
 * Command</a>
 *
 * <p>This class tests all variations of the CONVERSE command found in the link above.
 */
public class TestCicsConverseStatement {
    // Main Building Blocks
    private static final String BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. ABCDEF.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       01 {$*fromVar} PIC S9 VALUE +100.\n"
                    + "       01 {$*fromLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*maxLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*toLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*intoVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*convidVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*stateVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*attachVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*ctlCharVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*ldcVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*lineAddrVar} PIC S9 VALUE +1000.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    private static final String CONVERSE = "CONVERSE ";
    private static final String FROM = "FROM({$fromVar}) FROMLENGTH({$fromLen}) ";
    private static final String FROM_INTO = FROM + "INTO({$intoVar}) ";
    private static final String FROM_INTO_TO = FROM_INTO + "TOLENGTH({$toLen}) ";

    private static final String CONVERSE_FROM = CONVERSE + FROM;
    private static final String CONVERSE_FROM_INTO = CONVERSE + FROM_INTO;
    private static final String CONVERSE_FROM_INTO_TO = CONVERSE + FROM_INTO_TO;

    // Test Strings
    private static final String DEFAULT_VALID_1 = CONVERSE_FROM_INTO_TO + "MAXLENGTH({$maxLen})";
    private static final String DEFAULT_VALID_2 = CONVERSE_FROM_INTO_TO + "MAXLENGTH({$maxLen}) NOTRUNCATE";
    private static final String DEFAULT_INVAL_1 = CONVERSE_FROM_INTO_TO + "MAXLENGTH({$maxLen}) NOTRUNCATE {NOTRUNCATE|errorOne}";
    private static final String DEFAULT_INVAL_2 = "CONVERSE {MAXLENGTH(123) NOTRUNCATE|errorOne}";
    private static final String DEFAULT_INVAL_3 = "CONVERSE FROM(123) {FROMLENGTH|errorOne}(123) {FROMFLENGTH|errorTwo}(123) MAXLENGTH({$maxLen})";

    private static final String APPC_VALID = CONVERSE + "CONVID({$convidVar}) " + FROM_INTO_TO + "MAXLENGTH({$maxLen}) STATE({$stateVar})";
    private static final String APPC_INVAL = CONVERSE + "CONVID({$convidVar}) " + FROM_INTO_TO + "MAXLENGTH({$maxLen}) STATE({$stateVar}) {CTLCHAR|errorOne}(123)";

    private static final String LU23_3270_VALID_1 = CONVERSE_FROM_INTO + "ERASE DEFAULT TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID_2 = CONVERSE_FROM_INTO + "ERASE DEFAULT CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID_3 = CONVERSE_FROM_INTO + "ERASE ALTERNATE CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID_4 = CONVERSE_FROM_INTO + "ERASE TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID_5 = CONVERSE_FROM_INTO + "CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID_6 = CONVERSE_FROM_INTO + "STRFIELD TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";

    private static final String LU4_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP FMH NOTRUNCATE";

    private static final String LU61_VALID = CONVERSE_FROM + "SESSION({$convidVar}) ATTACHID({$attachVar}) INTO({$intoVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) NOTRUNCATE DEFRESP";

    private static final String SCS_VALID = CONVERSE_FROM_INTO_TO + "MAXLENGTH({$maxLen}) DEFRESP STRFIELD NOTRUNCATE";

    private static final String T3601_VALID = CONVERSE_FROM_INTO_TO + "LDC({$ldcVar}) DEFRESP MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String T3614_3653_3767_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String T3650INT_3770_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP FMH MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String T3650_3270_VALID = CONVERSE_FROM_INTO_TO + "CTLCHAR({$ctlCharVar}) ERASE DEFAULT DEFRESP FMH MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String T3650_3680_3790_VALID = CONVERSE_FROM_INTO_TO + "FMH DEFRESP MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String T3790_3270DISP_VALID_1 = CONVERSE_FROM_INTO_TO + "DEFRESP CTLCHAR({$ctlCharVar}) ERASE DEFAULT MAXLENGTH({$maxLen}) NOTRUNCATE";
    private static final String T3790_3270DISP_VALID_2 = CONVERSE_FROM_INTO_TO + "DEFRESP CTLCHAR({$ctlCharVar}) ERASE ALTERNATE MAXLENGTH({$maxLen}) NOTRUNCATE";
    private static final String T3790_3270DISP_VALID_3 = CONVERSE_FROM_INTO_TO;

    private static final String MRO_VALID = CONVERSE + "SESSION({$convidVar}) ATTACHID({$attachVar}) " + FROM_INTO_TO + "MAXLENGTH({$maxLen}) NOTRUNCATE DEFRESP STATE({$stateVar})";

    private static final String T2660_VALID = CONVERSE_FROM_INTO_TO + "MAXLENGTH({$maxLen}) CTLCHAR({$ctlCharVar}) LINEADDR({$lineAddrVar}) LEAVEKB";

    // Utility Functions
    private static void noErrorTest(String newCommand) {
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
    }

    private static void errorTest(String newCommand, String errorMessage) {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                errorMessage,
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), expectedDiagnostics);
    }

    private static String getTestString(String newCommand) {
        List<String> instances = Arrays.asList(newCommand.split("\\s"));
        instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(BASE_TEXT.split("\n")));
        base.addAll(base.size() - 1, instances);
        return String.join("\n", base);
    }

    // Test Functions
    @Test
    void testDefaultValid() {
        noErrorTest(DEFAULT_VALID_1);
        noErrorTest(DEFAULT_VALID_2);
    }

    @Test
    void testDefaultInvalid_1() {
        errorTest(DEFAULT_INVAL_1, "Excessive options provided for: NOTRUNCATE");
    }

    @Test
    void testDefaultInvalid_2() {
        errorTest(DEFAULT_INVAL_2, "Missing required option: FROM");
    }

    @Test
    void testDefaultInvalid_3() {
        Map<String, Diagnostic> expectedDiagnostics = new HashMap<String, Diagnostic>();
        expectedDiagnostics.put("errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: FROMLENGTH or FROMFLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo",
             new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: FROMLENGTH or FROMFLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

        UseCaseEngine.runTest(getTestString(DEFAULT_INVAL_3), ImmutableList.of(), expectedDiagnostics);
    }

    @Test
    void testAPPCValid() {
        noErrorTest(APPC_VALID);
    }

    @Test
    void testAPPCInvalid() {
        errorTest(APPC_INVAL, "Extraneous input CTLCHAR");
    }

    @Test
    void testLU23Valid() {
        noErrorTest(LU23_3270_VALID_1);
        noErrorTest(LU23_3270_VALID_2);
        noErrorTest(LU23_3270_VALID_3);
        noErrorTest(LU23_3270_VALID_4);
        noErrorTest(LU23_3270_VALID_5);
        noErrorTest(LU23_3270_VALID_6);
    }

    @Test
    void testLU4Valid() {
        noErrorTest(LU4_VALID);
    }

    @Test
    void testLU61Valid() {
        noErrorTest(LU61_VALID);
    }

    @Test
    void testSCSValid() {
        noErrorTest(SCS_VALID);
    }

    @Test
    void test3601Valid() {
        noErrorTest(T3601_VALID);
    }

    @Test
    void test3614_3653_3767Valid() {
        noErrorTest(T3614_3653_3767_VALID);
    }

    @Test
    void test3650int_3770Valid() {
        noErrorTest(T3650INT_3770_VALID);
    }

    @Test
    void test3650_3270Valid() {
        noErrorTest(T3650_3270_VALID);
    }

    @Test
    void test3650_3680_3790Valid() {
        noErrorTest(T3650_3680_3790_VALID);
    }

    @Test
    void test3790_3270DISPValid() {
        noErrorTest(T3790_3270DISP_VALID_1);
        noErrorTest(T3790_3270DISP_VALID_2);
        noErrorTest(T3790_3270DISP_VALID_3);
    }

    @Test
    void testMROValid() {
        noErrorTest(MRO_VALID);
    }

    @Test
    void testT2660Valid() {
        noErrorTest(T2660_VALID);
    }
}
