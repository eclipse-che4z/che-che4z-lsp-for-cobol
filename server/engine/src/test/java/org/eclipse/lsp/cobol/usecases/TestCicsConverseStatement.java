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

    private static final String CONVERSE = "CONVERSE ";
    private static final String FROM = "FROM(123) FROMLENGTH(123) ";
    private static final String FROM_INTO = FROM + "INTO(123) ";
    private static final String FROM_INTO_TO = FROM_INTO + "TOLENGTH(123) ";

    private static final String CONVERSE_FROM = CONVERSE + FROM;
    private static final String CONVERSE_FROM_INTO = CONVERSE + FROM_INTO;
    private static final String CONVERSE_FROM_INTO_TO = CONVERSE + FROM_INTO_TO;

    // Test Strings
    private static final String DEFAULT_VALID_1 = CONVERSE_FROM_INTO_TO + "MAXLENGTH(123)";
    private static final String DEFAULT_VALID_2 = CONVERSE_FROM_INTO_TO + "MAXLENGTH(123) NOTRUNCATE";
    private static final String DEFAULT_INVAL_1 = CONVERSE_FROM_INTO_TO + "MAXLENGTH(123) NOTRUNCATE {NOTRUNCATE|errorOne}";
    private static final String DEFAULT_INVAL_2 = "CONVERSE {INTO(123) MAXLENGTH(123) NOTRUNCATE|errorOne}";
    private static final String DEFAULT_INVAL_3 = "CONVERSE FROM(123) INTO(123) FROMLENGTH(123) {FROMFLENGTH(123)|errorOne} MAXLENGTH(123)";

    private static final String APPC_VALID = CONVERSE + "CONVID(123) " + FROM_INTO_TO + "MAXLENGTH(123) STATE(123)";
    private static final String APPC_INVAL = CONVERSE + "CONVID(123) " + FROM_INTO_TO + "MAXLENGTH(123) STATE(123) {CTLCHAR|errorOne}(123)";

    private static final String LU23_3270_VALID_1 = CONVERSE_FROM_INTO + "ERASE DEFAULT TOLENGTH(123) MAXLENGTH(123) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID_2 = CONVERSE_FROM_INTO + "ERASE DEFAULT CTLCHAR(123) TOLENGTH(123) MAXLENGTH(123) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID_3 = CONVERSE_FROM_INTO + "ERASE ALTERNATE CTLCHAR(123) TOLENGTH(123) MAXLENGTH(123)";
    private static final String LU23_3270_VALID_4 = CONVERSE_FROM_INTO + "ERASE TOLENGTH(123) MAXLENGTH(123)";
    private static final String LU23_3270_VALID_5 = CONVERSE_FROM_INTO + "CTLCHAR(123) TOLENGTH(123) MAXLENGTH(123)";
    private static final String LU23_3270_VALID_6 = CONVERSE_FROM_INTO + "STRFIELD TOLENGTH(123) MAXLENGTH(123)";

    private static final String LU4_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP FMH NOTRUNCATE";

    private static final String LU61_VALID = CONVERSE_FROM + "SESSION(123) ATTACHID(123) INTO(123) TOLENGTH(123) MAXLENGTH(123) NOTRUNCATE DEFRESP";

    private static final String SCS_VALID = CONVERSE_FROM_INTO_TO + "MAXLENGTH(123) DEFRESP STRFIELD NOTRUNCATE";

    private static final String T3601_VALID = CONVERSE_FROM_INTO_TO + "LDC(123) DEFRESP MAXLENGTH(123) NOTRUNCATE";

    private static final String T3614_3653_3767_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP MAXLENGTH(123) NOTRUNCATE";

    private static final String T3650INT_3770_VALID = CONVERSE_FROM_INTO_TO + "DEFRESP FMH MAXLENGTH(123) NOTRUNCATE";

    private static final String T3650_3270_VALID = CONVERSE_FROM_INTO_TO + "CTLCHAR(123) ERASE DEFAULT DEFRESP FMH MAXLENGTH(123) NOTRUNCATE";

    private static final String T3650_3680_3790_VALID = CONVERSE_FROM_INTO_TO + "FMH DEFRESP MAXLENGTH(123) NOTRUNCATE";

    private static final String T3790_3270DISP_VALID_1 = CONVERSE_FROM_INTO_TO + "DEFRESP CTLCHAR(123) ERASE DEFAULT MAXLENGTH(123) NOTRUNCATE";
    private static final String T3790_3270DISP_VALID_2 = CONVERSE_FROM_INTO_TO + "DEFRESP CTLCHAR(123) ERASE ALTERNATE MAXLENGTH(123) NOTRUNCATE";
    private static final String T3790_3270DISP_VALID_3 = CONVERSE_FROM_INTO_TO;

    private static final String MRO_VALID = CONVERSE + "SESSION(123) ATTACHID(123) " + FROM_INTO_TO + "MAXLENGTH(123) NOTRUNCATE DEFRESP STATE(123)";

    private static final String T2660_VALID = CONVERSE_FROM_INTO_TO + "MAXLENGTH(123) CTLCHAR(123) LINEADDR(123) LEAVEKB";

    private Map<String, Diagnostic> getErrorDiagnostic(String errorMessage) {
        return ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                errorMessage,
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
    }

    // Test Functions
    @Test
    void testDefaultValid() {
        CICSTestUtils.noErrorTest(DEFAULT_VALID_1);
        CICSTestUtils.noErrorTest(DEFAULT_VALID_2);
    }

    @Test
    void testDefaultInvalid_1() {
        CICSTestUtils.errorTest(DEFAULT_INVAL_1, getErrorDiagnostic("Excessive options provided for: NOTRUNCATE"));
    }

    @Test
    void testDefaultInvalid_2() {
        CICSTestUtils.errorTest(DEFAULT_INVAL_2, getErrorDiagnostic("Missing required option: FROM"));
    }

    @Test
    void testDefaultInvalid_3() {
        CICSTestUtils.errorTest(DEFAULT_INVAL_3, getErrorDiagnostic("Options \"FROMLENGTH or FROMFLENGTH\" cannot be used more than once in a given command."));
    }

    @Test
    void testAPPCValid() {
        CICSTestUtils.noErrorTest(APPC_VALID);
    }

    @Test
    void testAPPCInvalid() {
        CICSTestUtils.errorTest(APPC_INVAL, getErrorDiagnostic("Extraneous input CTLCHAR"));
    }

    @Test
    void testLU23Valid() {
        CICSTestUtils.noErrorTest(LU23_3270_VALID_1);
        CICSTestUtils.noErrorTest(LU23_3270_VALID_2);
        CICSTestUtils.noErrorTest(LU23_3270_VALID_3);
        CICSTestUtils.noErrorTest(LU23_3270_VALID_4);
        CICSTestUtils.noErrorTest(LU23_3270_VALID_5);
        CICSTestUtils.noErrorTest(LU23_3270_VALID_6);
    }

    @Test
    void testLU4Valid() {
        CICSTestUtils.noErrorTest(LU4_VALID);
    }

    @Test
    void testLU61Valid() {
        CICSTestUtils.noErrorTest(LU61_VALID);
    }

    @Test
    void testSCSValid() {
        CICSTestUtils.noErrorTest(SCS_VALID);
    }

    @Test
    void test3601Valid() {
        CICSTestUtils.noErrorTest(T3601_VALID);
    }

    @Test
    void test3614_3653_3767Valid() {
        CICSTestUtils.noErrorTest(T3614_3653_3767_VALID);
    }

    @Test
    void test3650int_3770Valid() {
        CICSTestUtils.noErrorTest(T3650INT_3770_VALID);
    }

    @Test
    void test3650_3270Valid() {
        CICSTestUtils.noErrorTest(T3650_3270_VALID);
    }

    @Test
    void test3650_3680_3790Valid() {
        CICSTestUtils.noErrorTest(T3650_3680_3790_VALID);
    }

    @Test
    void test3790_3270DISPValid() {
        CICSTestUtils.noErrorTest(T3790_3270DISP_VALID_1);
        CICSTestUtils.noErrorTest(T3790_3270DISP_VALID_2);
        CICSTestUtils.noErrorTest(T3790_3270DISP_VALID_3);
    }

    @Test
    void testMROValid() {
        CICSTestUtils.noErrorTest(MRO_VALID);
    }

    @Test
    void testT2660Valid() {
        CICSTestUtils.noErrorTest(T2660_VALID);
    }
}
