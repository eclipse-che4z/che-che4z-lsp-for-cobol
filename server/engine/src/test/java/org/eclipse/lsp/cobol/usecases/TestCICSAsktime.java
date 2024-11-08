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
 * Test CICS ADD ASKTIME command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-asktime"> ASKTIME Command</a>
 *
 * <p>This class tests all variations of the ASKTIME command found in the link above.
 */
public class TestCICSAsktime {
    private static final String ASKTIME_VALID =
            "ASKTIME";
    private static final String ASKTIME_ABSTIME_VALID =
            "ASKTIME ABSTIME({$varFour})";
    private static final String ASKTIME_INVALID =
            "ASKTIME {ABSTIME | error} ";
    @Test
    void testAsktimeValid() {
        CICSTestUtils.noErrorTest(ASKTIME_VALID);
    }
    @Test
    void testAsktimeAbstimeValid() {
        CICSTestUtils.noErrorTest(ASKTIME_ABSTIME_VALID);
    }
    @Test
    void testAsktimeInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(new Position(14, 12), new Position(14, 20)),
                                "Syntax error on 'END-EXEC'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ASKTIME_INVALID, expectedDiagnostic);
    }
}
