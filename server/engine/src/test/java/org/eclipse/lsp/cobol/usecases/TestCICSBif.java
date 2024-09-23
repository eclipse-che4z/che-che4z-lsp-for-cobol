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
 * Test CICS BIF commands. Documentation link:
 *<a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-bif-deedit">BIF DEEDIT Command</a>
 *<a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-bif-digest">BIF DIGEST Command</a>
 * <p>This class tests all variations of the BIF commands found in the links above.
 */
public class TestCICSBif {
    private static final String BIF_DEEDIT_FIELD_VALID =
            "BIF DEEDIT FIELD({$varFour})";

    private static final String BIF_DEEDIT_FIELD_LENGTH_VALID =
            "BIF DEEDIT FIELD({$varFour}) LENGTH(100)";

    private static final String BIF_DEEDIT_DIGEST_INVALID =
            "BIF DEEDIT {DIGEST | error}";
    private static final String BIF_DIGEST_RECORD_RECORDLEN_RESULT_VALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) RESULT({$varFour})";
    private static final String BIF_DIGEST_RECORD_RECORDLEN_HEX_RESULT_VALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) HEX RESULT({$varFour})";
    private static final String BIF_DIGEST_RECORD_RECORDLEN_BINARY_RESULT_VALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) BINARY RESULT({$varFour})";
    private static final String BIF_DIGEST_RECORD_RECORDLEN_BASE64_RESULT_VALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) BASE64 RESULT({$varFour})";
    private static final String BIF_DIGEST_RECORD_RECORDLEN_DIGESTTYPE_RESULT_VALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) DIGESTTYPE({$varFour}) RESULT({$varFour})";
    private static final String BIF_DIGEST_RECORDLEN_INVALID =
            "BIF DIGEST {RECORDLEN | errorRecordLen }";
    private static final String BIF_DIGEST_DIGESTTYPE_INVALID =
            "BIF DIGEST RECORD(100) RECORDLEN(100) HEX {DIGESTTYPE|errorDigestType }";
    private static final String BIF_DIGEST_RESULT_MISSING_INVALID =
            "BIF DIGEST RECORD(100) {RECORDLEN(100) | errorResultMissing}";

    @Test
    void testBifDeeditField() {
        CICSTestUtils.noErrorTest(BIF_DEEDIT_FIELD_VALID);
    }

    @Test
    void testBifDeeditFieldLengthValid() {
        CICSTestUtils.noErrorTest(BIF_DEEDIT_FIELD_LENGTH_VALID);
    }

    @Test
    void testBifDeeditDigestInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Syntax error on 'DIGEST'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BIF_DEEDIT_DIGEST_INVALID, expectedDiagnostic);
    }
    @Test
    void testBifDigestRecordRecordlenResultValid() {
        CICSTestUtils.noErrorTest(BIF_DIGEST_RECORD_RECORDLEN_RESULT_VALID);
    }
    @Test
    void testBifDigestRecordRecordlenHexResultValid() {
        CICSTestUtils.noErrorTest(BIF_DIGEST_RECORD_RECORDLEN_HEX_RESULT_VALID);
    }
    @Test
    void testBifDigestRecordRecordlenBinaryResultValid() {
        CICSTestUtils.noErrorTest(BIF_DIGEST_RECORD_RECORDLEN_BINARY_RESULT_VALID);
    }
    @Test
    void testBifDigestRecordRecordlenBase64ResultValid() {
        CICSTestUtils.noErrorTest(BIF_DIGEST_RECORD_RECORDLEN_BASE64_RESULT_VALID);
    }
    @Test
    void testBifDigestRecordRecordlenDigesttypeResultValid() {
        CICSTestUtils.noErrorTest(BIF_DIGEST_RECORD_RECORDLEN_DIGESTTYPE_RESULT_VALID);
    }
    @Test
    void testBifDigestRecordlenInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorRecordLen",
                        new Diagnostic(
                                new Range(),
                                "Syntax error on 'RECORDLEN'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BIF_DIGEST_RECORDLEN_INVALID, expectedDiagnostic);
    }
    @Test
    void testBifDigestDigesttypeInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorDigestType",
                        new Diagnostic(
                                new Range(),
                                "Syntax error on 'DIGESTTYPE'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BIF_DIGEST_DIGESTTYPE_INVALID, expectedDiagnostic);
    }
    @Test
    void testBifDigestResultMissingInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorResultMissing",
                        new Diagnostic(
                                new Range(new Position(16, 12), new Position(16, 20)),
                                "Syntax error on 'END-EXEC'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BIF_DIGEST_RESULT_MISSING_INVALID, expectedDiagnostic);
    }
}
