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
 * Test CICS DUMP TRANSACTION command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-dump-transaction">DUMP TRANSACTION Command</a>
 *
 * <p>This class tests all variations of the DUMP TRANSACTION command found in the link above.
 */
public class TestCICSDumpTransactionStatement {
    private static final String DUMP_TRANSACTION_VALID_ALL =
            "DUMP TRANSACTION \n "
                   + "DUMPCODE({$varFour}) \n"
                   + "FROM({$varFour}) LENGTH({$varFour}) \n"
                   + "COMPLETE TRT SEGMENTLIST({$varFour}) \n"
                   + "LENGTHLIST({$varFour}) \n"
                   + "NUMSEGMENTS({$varFour}) TASK STORAGE  \n"
                   + "PROGRAM TERMINAL TABLES \n"
                   + "FCT PCT PPT SIT TCT \n"
                   + "DUMPID({$varFour}) NOHANDLE";
    private static final String DUMP_TRANSACTION_SEGMENTLIST_VALID =
            "DUMP TRANSACTION DUMPCODE({$varFour}) \n"
            + "LENGTHLIST({$varFour}) \n"
            + "NUMSEGMENTS({$varFour}) \n"
            + "SEGMENTLIST({$varFour})";
    private static final String DUMP_TRANSACTION_DUMPCODE_VALID =
            "DUMP TRANSACTION \n"
            + "FROM({$varFour}) FLENGTH({$varFour}) COMPLETE \n"
            + "DUMPCODE({$varFour})";

    private static final String DUMP_TRANSACTION_FROM_INVALID =
            "DUMP TRANSACTION DUMPCODE({$varFour}) \n"
                    + "{FLENGTH(100) | errorMissingFrom} \n";
    private static final String DUMP_TRANSACTION_FROM_INVALID2 =
            "DUMP TRANSACTION DUMPCODE({$varFour}) \n"
                    + "{FROM(100) | errorMissingLength} \n";

    private static final String DUMP_TRANSACTION_SEGMENTLIST_INVALID =
            "DUMP TRANSACTION DUMPCODE({$varFour}) \n"
                    + "{ NUMSEGMENTS(100) LENGTHLIST(100) | errorMissingSegmentList}";

    @Test
    void testDumpTransactionAllValid() {
        CICSTestUtils.noErrorTest(DUMP_TRANSACTION_VALID_ALL);
    }
    @Test
    void testDumpTransactionDumpcodeValid() {
        CICSTestUtils.noErrorTest(DUMP_TRANSACTION_DUMPCODE_VALID);
    }
    @Test
    void testDumpTransactionSegmentListValid() {
        CICSTestUtils.noErrorTest(DUMP_TRANSACTION_SEGMENTLIST_VALID);
    }
    @Test
    void testDumpTransactionFromInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingFrom",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: FROM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(DUMP_TRANSACTION_FROM_INVALID, expectedDiagnostic);
    }
    @Test
    void testDumpTransactionFrom2Invalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingLength",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, none provided: LENGTH or FLENGTH",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(DUMP_TRANSACTION_FROM_INVALID2, expectedDiagnostic);
    }
    @Test
    void testDumpTransactionSegmentListInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingSegmentList",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: SEGMENTLIST",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(DUMP_TRANSACTION_SEGMENTLIST_INVALID, expectedDiagnostic);
    }
}
