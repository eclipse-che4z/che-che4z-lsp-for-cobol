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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Check EXEC CICS not in Procedure Division error message
 */
class TestExecCicsInProcedureDivision {

    private static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. CICSERR.\n"
                    + "       DATA DIVISION.\n"
                    + "           {_EXEC CICS END-EXEC|1_}.\n";

    @Test
    void test() {
        UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(
                "1", new Diagnostic(new Range(), "Invalid CICS EXEC block", DiagnosticSeverity.Error, ErrorSource.PARSING.getText())
        ));
    }
}
