/*
 * Copyright (c) 2021 Broadcom.
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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test that typing the Declaratives section doesn't produce an Exception.
 */
class TestDeclarativesSection {
    private static final String TEXT_1 =
            "       Identification Division.\n"
                    + "       Program-id. HELLO-WORLD.\n"
                    + "       Procedure Division.\n"
                    + "       DECLARATIVES{|1}";

    private static final String TEXT_2 =
            "       Identification Division.\n"
                    + "       Program-id. HELLO-WORLD.\n"
                    + "       DATA Division.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       01 {$*VAR1} PIC 9.\n\n"
                    + "       Procedure Division.\n"
                    + "       DECLARATIVES.\n"
                    + "       {@*USE-IX103-TEST} SECTION.\n"
                    + "           USE AFTER STANDARD EXCEPTION PROCEDURE {$VAR1}.\n"
                    + "       {#*PAR-001}.\n"
                    + "           ADD 1 TO {$VAR1}.\n"
                    + "       {#*PAR-EXIT}.\n"
                    + "           EXIT.\n"
                    + "       END DECLARATIVES."
                    + "       {@*CCVS1} SECTION.\n";

    @Test
    void test1() {
        UseCaseEngine.runTest(TEXT_1,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Unexpected end of file",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())));
    }

    @Test
    void test2() {
        UseCaseEngine.runTest(TEXT_2, ImmutableList.of(),
                ImmutableMap.of("1",
                        new Diagnostic(new Range(),
                                "\"VAR1\" was defined as a type that was invalid in this context. The statement was discarded",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())));
    }
}
