package org.eclipse.lsp.cobol.usecases;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *  Test CICS RECEIVE command.
 *  Documentation link: <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">RECEIVE Command</a>
 *
 *  This class tests all variations of the RECEIVE command found in the link above.
 */
public class TestCicsReceive {
    private static final String DEFAULT_BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID. ABCDEF.\n"
            + "       DATA DIVISION.\n"
            + "       WORKING-STORAGE SECTION.\n"
            + "       PROCEDURE DIVISION.\n"
            + "            EXEC CICS \n"
            + "                RECEIVE\n"
            + "            END-EXEC.";

    private static final String[] defaultZOSAllOptionsOne = {"INTO(100)", "MAXLENGTH(1000)", "LENGTH(10)", "MAXLENGTH(1000)", "NOTRUNCATE"};

    private static String getTestString(String[] components) {
        for(int i = 0; i < components.length; i++) {
            components[i] = "                " + components[i];
        }
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(DEFAULT_BASE_TEXT.split("\n")));
        base.addAll(base.indexOf("                RECEIVE" ) + 1, Arrays.asList(components));
        return String.join("\n", base);
    }

    @Test
    void testDefaultAllOptionsOne() {
        UseCaseEngine.runTest(getTestString(defaultZOSAllOptionsOne), ImmutableList.of(), ImmutableMap.of());}
}
