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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    private static final String CONVERSE = "CONVERSE ";
    private static final String FROM = "FROM({$fromVar}) FROMLENGTH({$fromLen}) ";
    private static final String FROM_INTO = FROM + "INTO({$intoVar}) ";
    private static final String FROM_INTO_TO = FROM_INTO + "TOLENGTH({$toLen}) ";

    // Test Strings
    private static final String DEFAULT_VALID = CONVERSE + FROM_INTO_TO + "MAXLENGTH({$maxLen})";
    private static final String DEFAULT_VALID_NT = CONVERSE + FROM_INTO_TO + "MAXLENGTH({$maxLen}) NOTRUNCATE";

    private static final String APPC_VALID = CONVERSE + "CONVID({$convidVar}) " + FROM_INTO_TO + "MAXLENGTH({$maxLen}) STATE({$stateVar})";

    private static final String LU23_3270_VALID1 = CONVERSE + FROM_INTO + "ERASE DEFAULT TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID2 = CONVERSE + FROM_INTO + "ERASE DEFAULT CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) DEFRESP NOTRUNCATE ASIS";
    private static final String LU23_3270_VALID3 = CONVERSE + FROM_INTO + "ERASE ALTERNATE CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID4 = CONVERSE + FROM_INTO + "ERASE TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID5 = CONVERSE + FROM_INTO + "CTLCHAR({$ctlCharVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String LU23_3270_VALID6 = CONVERSE + FROM_INTO + "STRFIELD TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    
    private static final String LU61_VALID = CONVERSE + FROM + "SESSION({$convidVar}) ATTACHID({$attachVar}) INTO({$intoVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) NOTRUNCATE DEFRESP";

    // Utility Functions
    private static void noErrorTest(String newCommand) {
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
    }

    private static String getTestString(String newCommand) {
        List<String> instances = Arrays.asList(newCommand.split(" "));
        instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(BASE_TEXT.split("\n")));
        base.addAll(base.size() - 1, instances);
        return String.join("\n", base);
    }

    // Test Functions
    @Test
    void testDefaultValid() {
        noErrorTest(DEFAULT_VALID);
    }

    @Test
    void testDefaultValidNT() {
        noErrorTest(DEFAULT_VALID_NT);
    }

    @Test
    void testAPPCValid() {
        noErrorTest(APPC_VALID);
    }

    @Test
    void testLU61Valid() {
        noErrorTest(LU61_VALID);
    }

    @Test
    void testLU23Valid() {
        noErrorTest(LU23_3270_VALID1);
        noErrorTest(LU23_3270_VALID2);
        noErrorTest(LU23_3270_VALID3);
        noErrorTest(LU23_3270_VALID4);
        noErrorTest(LU23_3270_VALID5);
        noErrorTest(LU23_3270_VALID6);
    }
}
