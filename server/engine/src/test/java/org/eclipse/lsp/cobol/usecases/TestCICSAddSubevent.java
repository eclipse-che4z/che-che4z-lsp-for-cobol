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
        import org.eclipse.lsp4j.Position;
        import org.eclipse.lsp4j.Range;
        import org.junit.jupiter.api.Test;

        import java.util.Map;

/**
 * Test CICS ADD SUBEVENT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-add-subevent">ADD SUBEVENT Command</a>
 *
 * <p>This class tests all variations of the ADD SUBEVENT command found in the link above.
 */
public class TestCICSAddSubevent {
    private static final String ADD_SUBEVENT_EVENT =
            "ADD SUBEVENT({$varFour}) EVENT({$varFour})";
    private static final String ADD_EVENT_SUBEVENT =
            "ADD EVENT({$varFour}) SUBEVENT({$varFour})";
    private static final String ADD_INVALID =
            "{ADD | error} ";
    private static final String ADD_EVENT_INVALID =
            "ADD {EVENT(100) | errorMissingSubevent} ";
    private static final String ADD_SUBEVENT_INVALID =
            "ADD {SUBEVENT(100) | errorMissingEvent} ";
    @Test
    void testAddSubEventValid() {
        CICSTestUtils.noErrorTest(ADD_SUBEVENT_EVENT);
    }
    @Test
    void testAddSubEventValidOne() {
        CICSTestUtils.noErrorTest(ADD_EVENT_SUBEVENT);
    }
    @Test
    void testAddInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(new Position(13, 12), new Position(13, 20)),
                                "Syntax error on 'END-EXEC'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ADD_INVALID, expectedDiagnostic);
    }
    @Test
    void testAddSubEventInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingSubevent",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: SUBEVENT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ADD_EVENT_INVALID, expectedDiagnostic);
    }
    @Test
    void testAddEventInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingEvent",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: EVENT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ADD_SUBEVENT_INVALID, expectedDiagnostic);
    }
}
