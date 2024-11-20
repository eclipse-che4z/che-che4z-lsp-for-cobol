package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

public class TestCicsRun {
    private static final String DEFAULT_ALL_VALID_ONE = "RUN ACQACTIVITY ASYNCHRONOUS INPUTEVENT(12) FACILITYTOKN(123)";
    private static final String DEFAULT_ALL_VALID_TWO = "RUN ACQPROCESS INPUTEVENT(2) SYNCHRONOUS";
    private static final String DEFAULT_ALL_VALID_THREE = "RUN SYNCHRONOUS ACTIVITY(12) INPUTEVENT(12)";
    private static final String DEFAULT_ALL_VALID_FOUR = "RUN INPUTEVENT(12) ASYNCHRONOUS FACILITYTOKN(123) ACTIVITY(12)";
    private static final String DEFAULT_ALL_VALID_FIVE = "RUN FACILITYTOKN(123) ACQACTIVITY INPUTEVENT(12) ASYNCHRONOUS";

    private static final String DEFAULT_SOME_VALID_ONE = "RUN ASYNCHRONOUS ACTIVITY(12) INPUTEVENT(12)";
    private static final String DEFAULT_SOME_VALID_TWO = "RUN ASYNCHRONOUS FACILITYTOKN(123) ACQACTIVITY";
    private static final String DEFAULT_SOME_VALID_THREE = "RUN ACQPROCESS ASYNCHRONOUS INPUTEVENT(12)";

    private static final String DEFAULT_BARE_VALID_ONE = "RUN SYNCHRONOUS ACQPROCESS";
    private static final String DEFAULT_BARE_VALID_TWO = "RUN ACQACTIVITY ASYNCHRONOUS";
    private static final String DEFAULT_BARE_VALID_THREE = "RUN SYNCHRONOUS ACQACTIVITY";

    private static final String DEFAULT_INVALID_ONE = "RUN SYNCHRONOUS ACTIVITY(12) {FACILITYTOKN|error1}(123)";
    private static final String DEFAULT_INVALID_TWO = "RUN ASYNCHRONOUS {ACQPROCESS|error1}  {ACQACTIVITY|error1} INPUTEVENT(12)";
    private static final String DEFAULT_INVALID_THREE = "RUN ACTIVITY(12) {SYNCHRONOUS|error1} INPUTEVENT(12) {ASYNCHRONOUS|error1}";

    private static final String TRANSID_ALL = "RUN TRANSID(12) CHANNEL(123) CHILD(1)";
    private static final String TRANSID_BARE = "RUN CHILD(1) TRANSID(12)";

    @Test
    void testDefaultAllValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_ONE);
    }

    @Test
    void testDefaultAllValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_TWO);
    }

    @Test
    void testDefaultAllValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_THREE);
    }

    @Test
    void testDefaultAllValidFour() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_FOUR);
    }

    @Test
    void testDefaultAllValidFive() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_FIVE);
    }

    @Test
    void testDefaultSomeValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_ONE);
    }

    @Test
    void testDefaultSomeValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_TWO);
    }

    @Test
    void testDefaultSomeValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_THREE);
    }

    @Test
    void testDefaultBareValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_ONE);
    }

    @Test
    void testDefaultBareValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_TWO);
    }

    @Test
    void testDefaultBareValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_THREE);
    }

    @Test
    void testDefaultInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: FACILITYTOKN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_ONE, expectedDiagnostic);
    }

    @Test
    void testDefaultInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_TWO, expectedDiagnostic);
    }

    @Test
    void testDefaultInvalidThree() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: SYNCHRONOUS or ASYNCHRONOUS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_THREE, expectedDiagnostic);
    }

    @Test
    void testTransidAll() {
        CICSTestUtils.noErrorTest(TRANSID_ALL);
    }

    @Test
    void testTransidBare() {
        CICSTestUtils.noErrorTest(TRANSID_BARE);
    }
}
