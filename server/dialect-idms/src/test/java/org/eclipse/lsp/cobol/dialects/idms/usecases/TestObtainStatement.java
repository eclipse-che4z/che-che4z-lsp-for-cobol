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
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test to check if IDMS OBTAIN statement generates proper COBOL statements */
class TestObtainStatement {
    private static final String TEXT =
        "       IDENTIFICATION DIVISION.\n"
                + "       PROGRAM-ID.  IDDWRK.\n"
                + "       ENVIRONMENT DIVISION.\n"
                + "       IDMS-CONTROL SECTION.\n"
                + "       PROTOCOL. MODE IS BATCH-AUTOSTATUS\n"
                + "            IDMS-RECORDS MANUAL.\n"
                + "       DATA DIVISION.\n"
                + "       FILE SECTION.\n"
                + "       SCHEMA SECTION.\n"
                + "       DB EMPSS01  WITHIN EMPSCHM VERSION 100.\n"
                + "       WORKING-STORAGE SECTION.\n"
                + "       01 WK-FIRST-NAME PIC X(10) VALUE 'CARLA'.\n"
                + "       01 EOF-PHARM-SW PIC X(1) VALUE 'N'.\n"
                + "       01 ERROR-STATUS PIC X(4) VALUE '1400'.\n"
                + "           88 DB-REC-NOT-FOUND VALUE '0326'.\n"
                + "       01 EMPLOYEE.\n"
                + "           05 EMP-ID-0415 PIC X(1) VALUE '5'.\n"
                + "           05 EMP-FIRST-NAME-0415 PIC X(1) VALUE 'NAME'.\n"
                + "       PROCEDURE DIVISION.\n"
                + "       100-START.\n"
                + "       READY.\n"
                + "           IF (EMP-ID-0415 IS NUMERIC) AND\n"
                + "               (EMP-ID-0415 IS NOT EQUAL 0023)\n"
                + "               CONTINUE\n"
                + "           ELSE\n"
                + "               MOVE WK-FIRST-NAME TO EMP-FIRST-NAME-0415\n"
                + "               OBTAIN CALC EMPLOYEE\n"
                + "                   ON DB-REC-NOT-FOUND\n"
                + "                   MOVE 'Y' TO EOF-PHARM-SW\n"
                + "               END-IF\n"
                + "           END-IF\n"
                + "         FINISH.\n"
                + "            GOBACK.\n"
                + "       IDMS-STATUS.\n"
                + "           DISPLAY \"STATUS\".\n"
                + "       IDMS-ABORT SECTION.\n"
                + "       IDMS-ABORT-EXIT.\n"
                + "            EXIT.\n";

    @Test
    void test() {
        UseCaseEngine.runTestForDiagnostics(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(),
                ImmutableList.of(),
                DialectConfigs.getIDMSAnalysisConfig());
    }
}
