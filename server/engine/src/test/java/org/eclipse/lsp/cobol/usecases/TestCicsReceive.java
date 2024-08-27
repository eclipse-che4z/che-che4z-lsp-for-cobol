package org.eclipse.lsp.cobol.usecases;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

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
            + "            EXEC CICS RECEIVE\n"
            + "            END-EXEC.";

    private static final String[] defaultZOSAllOptionsOne = {"INTO(100)", "MAXLENGTH(100)", "LENGTH(10)", "MAXLENGTH(100)", "NOTRUNCATE"};

    private static String getTestString(String[] components) {
        for(int i = 0; i < components.length; i++) {
            components[i] = "                " + components[i];
        }
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(DEFAULT_BASE_TEXT.split("\n")));
        base.addAll(base.indexOf("            EXEC CICS RECEIVE" ) + 1, Arrays.asList(components));
        return String.join("\n", base);
    }

    @Test
    void testDefaultReceiveCICSCommand_withAllOptionsOne() {
//        UseCaseEngine.runTest(getTestString(defaultZOSAllOptionsOne), ImmutableList.of(), ImmutableMap.of("one", new Diagnostic(
//                new Range(),
//                "Any error please",
//                Error,
//                ErrorSource.PREPROCESSING.getText())));

            UseCaseEngine.runTest(getTestString(defaultZOSAllOptionsOne), ImmutableList.of(), ImmutableMap.of());

//        AnalysisResult analysisResult =
//                UseCaseEngine.runTest(
//                        getTestString(defaultZOSAllOptionsOne),
//                        ImmutableList.of(),
//                        ImmutableMap.of(),
//                        ImmutableList.of(),
//                        AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
//        List<Node> sections =
//                analysisResult
//                        .getRootNode()
//                        .getDepthFirstStream()
//                        .filter(it -> it.getNodeType().equals(NodeType.PROCEDURE_SECTION))
//                        .collect(Collectors.toList());
//        assertThat(sections.size(), equalTo(1));
    }
}
