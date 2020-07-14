/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.toURI;
import static java.util.Arrays.asList;
import static java.util.Collections.singletonMap;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * This test checks the insertion of IDENTIFICATION DIVISION statement that contains a syntax error
 * in a copybook found and underlined correctly
 */
public class TestIdentificationDivisionInCopybookWithError {
  private static final String TEXT =
      "0      COPY {~IDDIV}.\n"
          + "1      PROGRAM-ID. BKP92S1.        \n"
          + "2      DATA DIVISION.              \n"
          + "3      WORKING-STORAGE SECTION.    \n"
          + "4      01  {$*PARENT}.  COPY {~STRUCT1}.  \n"
          + "5      PROCEDURE DIVISION.\n"
          + "6      {#*MAINLINE}.\n"
          + "7        MOVE 1 TO {$CHILD1}.\n"
          + "8      GOBACK. ";

  private static final String STRUCT1 = "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n";
  private static final String IDDIV = "       IDENTIFICATION {DIVISIONs|1}.";

  private static final String IDDIV_NAME = "IDDIV";
  private static final String STRUCT1_NAME = "STRUCT1";

  private static final String MESSAGE = "Syntax error on 'DIVISIONs' expected DIVISION";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        asList(new CobolText(IDDIV_NAME, IDDIV), new CobolText(STRUCT1_NAME, STRUCT1)),
        singletonMap("1", new Diagnostic(null, MESSAGE, Error, ERROR.getText())));
  }
}
