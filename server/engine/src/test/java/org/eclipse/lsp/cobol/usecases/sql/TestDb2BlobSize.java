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
 * Check for 1. decimal case
 */
class TestDb2BlobSize {
    public static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TEST1.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           EXEC SQL DECLARE TEST123 TABLE\n"
                    + "             (JSON_DATA BLOB(256K) NOT NULL)\n"
                    + "           END-EXEC.\n";

    @Test
    void test() {
        UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
    }
}
