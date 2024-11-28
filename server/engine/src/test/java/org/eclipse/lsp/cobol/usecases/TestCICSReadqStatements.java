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
 * Test CICS Readq td & Readq ts command. Documentation link:
 *<a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-readq-td">READQ TD Command</a>
 *<a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-readq-ts">READQ TS Command</a>
 * <p>This class tests all variations of the READQ command found in the link above.
 */
public class TestCICSReadqStatements {

    private static final String READQ_TD_VALID =
            "READQ TD QUEUE({$varFour}) NOHANDLE INTO({$varFour})\n "
                   + "LENGTH({$varFour}) SYSID({$varFour})\n "
                   + "NOSUSPEND ";
    private static final String READQ_TD_SET_VALID =
            "READQ TD QUEUE({$varFour}) NOHANDLE SET({$varFour})\n "
                    + "LENGTH({$varFour}) SYSID({$varFour})\n "
                    + "NOSUSPEND ";
    private static final String READQ_TS_VALID =
            "READQ TS QUEUE({$varFour}) NOHANDLE SET({$varFour})\n "
                    + "LENGTH({$varFour}) NUMITEMS({$varFour})\n "
                    + "NEXT SYSID({$varFour})";
    private static final String READQ_TS_INTO_VALID =
            "READQ TS QUEUE({$varFour}) NOHANDLE INTO({$varFour})\n "
                    + "LENGTH({$varFour}) NUMITEMS({$varFour})\n "
                    + "NEXT SYSID({$varFour})";
    private static final String READQ_VALID =
            "READQ  QNAME({$varFour}) NOHANDLE INTO({$varFour})\n "
                    + "LENGTH({$varFour}) NUMITEMS({$varFour})\n "
                    + "NEXT SYSID({$varFour})";
    private static final String READQ_QUEUE_INVALID =
            "READQ {QUEUE(100)|errorMissingTd}";
    private static final String READQ_QUEUE_INTO_SET_INVALID =
            "READQ TD QUEUE({$varFour}) {INTO|errorExclusiveInto}(100) \n "
                    + "{SET|errorExclusiveInto2}(100)";
    private static final String READQ_QUEUE_QNAME_INVALID =
            "READQ TS INTO({$varFour}) {QNAME|errorExclusiveQueue}(100) \n "
                    + "{QUEUE|errorExclusiveQueue2}(100)";
    private static final String READQ_NEXT_ITEM_INVALID =
            "READQ SET({$varFour}) LENGTH({$varFour}) {NEXT|errorExclusiveNext} \n "
                    + "{ITEM|errorExclusiveNext2}(100) QNAME({$varFour})";
    private static final String READQ_SET_LENGTH_INVALID =
            "READQ QNAME({$varFour}) {SET(100)|errorMissingLength}";

    @Test
    void testReadqTdValid() {
        CICSTestUtils.noErrorTest(READQ_TD_VALID);
    }
    @Test
    void testReadqTdSetValid() {
        CICSTestUtils.noErrorTest(READQ_TD_SET_VALID);
    }
    @Test
    void testReadqTsValid() {
        CICSTestUtils.noErrorTest(READQ_TS_VALID);
    }
    @Test
    void testReadqTsIntoValid() {
        CICSTestUtils.noErrorTest(READQ_TS_INTO_VALID);
    }
    @Test
    void testReadqValid() {
        CICSTestUtils.noErrorTest(READQ_VALID);
    }
    @Test
    void testReadqQueueInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingTd",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, none provided: INTO or SET",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(READQ_QUEUE_INVALID, expectedDiagnostic);
    }
    @Test
    void testReadqQueueIntoSetInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorExclusiveInto",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: INTO or SET",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorExclusiveInto2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: INTO or SET",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(READQ_QUEUE_INTO_SET_INVALID, expectedDiagnostic);
    }
    @Test
    void testReadqQueueQnameInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorExclusiveQueue",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorExclusiveQueue2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(READQ_QUEUE_QNAME_INVALID, expectedDiagnostic);
    }
    @Test
    void testReadqNextItemInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorExclusiveNext",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: NEXT or ITEM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorExclusiveNext2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: NEXT or ITEM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(READQ_NEXT_ITEM_INVALID, expectedDiagnostic);
    }
    @Test
    void testReadqSetMissingLengthInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingLength",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: LENGTH",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(READQ_SET_LENGTH_INVALID, expectedDiagnostic);
    }
}
