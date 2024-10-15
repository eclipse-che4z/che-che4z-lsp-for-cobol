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
 * Test CICS Build commands. Documentation link:
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-build-attach-lutype61">BUILD ATTACH(LUTYPE6.1) Command</a>
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-build-attach-mro">BUILD ATTACH(MRO) Command</a>
 * <p>This class tests all variations of the DEFINE command found in the link above.
 */
public class TestCICSBuild {
    private static final String BUILD_ATTACH_ATTACHID_ALL_VALID =
            "BUILD ATTACH ATTACHID({$varFour}) PROCESS({$varFour}) RESOURCE({$varFour}) RPROCESS({$varFour}) "
                    + "RRESOURCE({$varFour}) QUEUE({$varFour}) IUTYPE({$varFour}) DATASTR({$varFour}) RECFM({$varFour})";
    private static final String BUILD_ATTACH_ATTACHID_VALID =
            "BUILD ATTACH ATTACHID({$varFour})";
    private static final String BUILD_ATTACH_ATTACHID_INVALID =
            "BUILD {ATTACH | errorMissingAttachId}";
    private static final String BUILD_ATTACHID_INVALID =
            "BUILD {ATTACHID(100) | errorMissingAttach }";
    @Test
    void testDefineActivityAllOptionsValid() {
        CICSTestUtils.noErrorTest(BUILD_ATTACH_ATTACHID_ALL_VALID);
    }
    @Test
    void testBuildAttachAttachidValid() {
        CICSTestUtils.noErrorTest(BUILD_ATTACH_ATTACHID_VALID);
    }
    @Test
    void testBuildAttachAttachidInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorMissingAttachId",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: ATTACHID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BUILD_ATTACH_ATTACHID_INVALID, expectedDiagnostics);
    }
    @Test
    void testBuildAttachInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorMissingAttach",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: ATTACH",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BUILD_ATTACHID_INVALID, expectedDiagnostics);
    }
}
