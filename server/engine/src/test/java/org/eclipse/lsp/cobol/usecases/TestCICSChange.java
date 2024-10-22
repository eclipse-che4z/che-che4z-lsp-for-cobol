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

        import java.util.Map;

/**
 * Test CICS CHANGE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-change-phrase">CHANGE PHRASE Command</a>
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-change-password">CHANGE PASSWORD Command</a>
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-change-task">CHANGE TASK Command</a>
 * <p>This class tests all variations of the CHANGE commands found in the link above.
 */
public class TestCICSChange {
    private static final String CHANGE_PHRASE_VALID =
            "CHANGE PHRASE({$varFour}) PHRASELEN({$varFour}) NEWPHRASE({$varFour})"
                    + "NEWPHRASELEN({$varFour})  USERID({$varFour})";
    private static final String CHANGE_PHRASE_VALID_ALL =
            "CHANGE PHRASE({$varFour}) CHANGETIME({$varFour}) DAYSLEFT({$varFour})"
                    + "ESMREASON({$varFour}) ESMRESP({$varFour})"
                    + "EXPIRYTIME({$varFour}) INVALIDCOUNT({$varFour}) LASTUSETIME({$varFour})"
                    + "NEWPHRASE({$varFour}) NEWPHRASELEN({$varFour}) PHRASELEN({$varFour}) USERID({$varFour})";
    private static final String CHANGE_PHRASE_INVALID =
            "CHANGE  {PHRASE(100) | errorMissingPhrase | errorMissingPhrase2 |errorMissingPhrase3 | errorMissingPhrase4}";

    private static final String CHANGE_PASSWORD_VALID =
            "CHANGE PASSWORD({$varFour}) NEWPASSWORD({$varFour}) USERID({$varFour})";

    private static final String CHANGE_PASSWORD_VALID_ALL =
            "CHANGE PASSWORD({$varFour}) NEWPASSWORD({$varFour}) USERID({$varFour})"
                    + "CHANGETIME({$varFour}) DAYSLEFT({$varFour})"
                    + "ESMREASON({$varFour}) ESMRESP({$varFour})"
                    + "EXPIRYTIME({$varFour}) INVALIDCOUNT({$varFour}) LASTUSETIME({$varFour})";

    private static final String CHANGE_PASSWORD_INVALID =
            "CHANGE  {PASSWORD(100) | errorMissingPassword | errorMissingPassword2}";

    private static final String CHANGE_TASK_VALID =
            "CHANGE TASK";
    private static final String CHANGE_TASK_PRIORTY_VALID =
            "CHANGE TASK PRIORITY({$varFour})";

    @Test
    void testChangePhraseValid() {
        CICSTestUtils.noErrorTest(CHANGE_PHRASE_VALID);
    }
    @Test
    void testChangePhraseAllValid() {
        CICSTestUtils.noErrorTest(CHANGE_PHRASE_VALID_ALL);
    }
    @Test
    void testChangePhraseInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingPhrase",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: NEWPHRASE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorMissingPhrase2",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: NEWPHRASELEN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorMissingPhrase3",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: PHRASELEN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorMissingPhrase4",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: USERID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CHANGE_PHRASE_INVALID, expectedDiagnostic);
    }

    @Test
    void testChangePasswordValid() {
        CICSTestUtils.noErrorTest(CHANGE_PASSWORD_VALID);
    }
    @Test
    void testChangePasswordAllValid() {
        CICSTestUtils.noErrorTest(CHANGE_PASSWORD_VALID_ALL);
    }
    @Test
    void testChangePasswordInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingPassword",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: NEWPASSWORD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorMissingPassword2",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: USERID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CHANGE_PASSWORD_INVALID, expectedDiagnostic);
    }

    @Test
    void testChangeTaskValid() {
        CICSTestUtils.noErrorTest(CHANGE_TASK_VALID);
    }
    @Test
    void testChangePriorityValid() {
        CICSTestUtils.noErrorTest(CHANGE_TASK_PRIORTY_VALID);
    }
}


