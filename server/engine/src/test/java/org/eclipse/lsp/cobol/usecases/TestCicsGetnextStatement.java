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
 * Test GETNEXT WEB command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-getnext-zos-communications-server-default">GETNEXT
 * Command</a>
 *
 * <p>This class tests all variations of the GETNEXT command found in the link above.
 */
public class TestCicsGetnextStatement {

    // Main Building Blocks
    private static final String BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. ABCDEF.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    private static final String GETNEXT_ACTIVITY_VALID = "GETNEXT ACTIVITY(123) BROWSETOKEN(123) ACTIVITYID(123) LEVEL(123)";
    private static final String GETNEXT_CONTAINER_VALID = "GETNEXT CONTAINER(123) BROWSETOKEN(123)";
    private static final String GETNEXT_EVENT_VALID = "GETNEXT EVENT(123) BROWSETOKEN(123) COMPOSITE(123) EVENTTYPE(123) FIRESTATUS(123) PREDICATE(123) TIMER(123)";
    private static final String GETNEXT_PROCESS_VALID = "GETNEXT PROCESS(123) BROWSETOKEN(123) ACTIVITYID(123)";
    private static final String GETNEXT_TIMER_VALID = "GETNEXT TIMER(123) BROWSETOKEN(123) ACTIVITYID(123) EVENT(123) STATUS(123) ABSTIME(123)";

    // Utility Functions
    private static void noErrorTest(String newCommand) {
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
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
    void testGetnextActivity() {
        noErrorTest(GETNEXT_ACTIVITY_VALID);
    }

    @Test
    void testGetnextContainer() {
        noErrorTest(GETNEXT_CONTAINER_VALID);
    }

    @Test
    void testGetnextEvent() {
        noErrorTest(GETNEXT_EVENT_VALID);
    }

    @Test
    void testGetnextProcess() {
        noErrorTest(GETNEXT_PROCESS_VALID);
    }

    @Test
    void testGetnextTimer() {
        noErrorTest(GETNEXT_TIMER_VALID);
    }
}
