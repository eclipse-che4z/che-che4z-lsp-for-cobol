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
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    // Test Strings
    private static final String DEFAULT_VALID = "CONVERSE FROM({$fromVar}) FROMLENGTH({$fromLen}) INTO({$intoVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen})";
    private static final String DEFAULT_VALID_NT = "CONVERSE FROM({$fromVar}) FROMLENGTH({$fromLen}) INTO({$intoVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) NOTRUNCATE";


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
}
