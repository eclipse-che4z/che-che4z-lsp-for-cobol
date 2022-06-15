/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that all the predefined variables recognized without any errors. Here: the
 * variables starting with "EIB" belong to Exec Interface Block and are implicitly defined.
 */
class TestWorkingStoragePredefinedVariables {
  @Test
  void testDuplicateDefinition() {
    final String text =
        "       Identification Division. \n"
            + "       Program-id.    ProgramId.\n"
            + "       Data Division.\n"
            + "       WORKING-STORAGE SECTION.\n"
            + "       01 {$*XML-TEXT} PIC 99.\n"
            + "       01 {$*LDAY} PIC 99.\n"
            + "       LINKAGE SECTION.\n"
            + "       01  {$*DFHCOMMAREA}.\n"
            + "          05  {$*LAST-MAP}                     PIC x.\n"
            + "       Procedure Division.\n"
            + "       {#*000-Main-Logic}.\n"
            + "           MOVE {$EIBRESP}        TO {$XML-TEXT|1}.\n"
            + "           MOVE {$EIBDATE} TO {$LDAY}.\n"
            + "           EXEC CICS RETURN\n"
            + "                TRANSID({$EIBTRNID})\n"
            + "                COMMAREA({$DFHCOMMAREA})\n"
            + "                END-EXEC.\n"
            + "       End program ProgramId.";

    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Duplicated definition for XML-TEXT",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testVariableisRecognied() {
    final String text =
        "       Identification Division. \n"
            + "       Program-id.    ProgramId.\n"
            + "       Data Division.\n"
            + "       WORKING-STORAGE SECTION.\n"
            + "       01 {$*LDAY} PIC 99.\n"
            + "       LINKAGE SECTION.\n"
            + "       01  {$*DFHCOMMAREA}.\n"
            + "          05  {$*LAST-MAP}                     PIC x.\n"
            + "       Procedure Division.\n"
            + "       {#*000-Main-Logic}.\n"
            + "           MOVE {$EIBRESP}        TO {$XML-TEXT}.\n"
            + "           MOVE {$EIBDATE} TO {$LDAY}.\n"
            + "           EXEC CICS RETURN\n"
            + "                TRANSID({$EIBTRNID})\n"
            + "                COMMAREA({$DFHCOMMAREA})\n"
            + "                END-EXEC.\n"
            + "       End program ProgramId.";

    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
