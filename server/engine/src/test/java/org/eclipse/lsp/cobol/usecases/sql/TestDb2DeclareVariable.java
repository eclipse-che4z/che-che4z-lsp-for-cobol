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
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test class for verifying the declaration of a DB2 variable in COBOL code.
 */
class TestDb2DeclareVariable {
    public static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       01 {$*A} PIC X."
                    + "       EXEC SQL\n"
                    + "           DECLARE :{$A} VARIABLE FOR BIT DATA\n"
                    + "       END-EXEC.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           DISPLAY 'HELLO'.\n";

    @Test
    void test() {
        UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
    }
}
