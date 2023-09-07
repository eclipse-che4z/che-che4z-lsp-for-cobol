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

/** Typing the variable definition "01 EXEC" should not produce NPE */
class TestExecVarDoesNotProduceNPE {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {01|1} {EXEC|2}\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item FILLER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'EXEC' expected {CBLCARD, COBOL2, COBOL3, CPSM, DLI, EDF, EPILOG, EXCI, FEPI,"
                    + " NATLANG, NOCBLCARD, NOCMPR2, NOCPSM, NODEBUG, NOEDF, NOFEPI, NOLENGTH, NOLINKAGE, NOOPTIONS,"
                    + " NOSPIE, NOTRIG, OPTIONS, SP, SPIE, SYSEIB, BINARY, BLANK, COMP, COMPUTATIONAL, "
                    + "COMPUTATIONAL-1, COMPUTATIONAL-2, COMPUTATIONAL-3, COMPUTATIONAL-4, COMPUTATIONAL-5, "
                    + "COMP-1, COMP-2, COMP-3, COMP-4, COMP-5, CPP, DATEPROC, DISPLAY, DISPLAY-1, DP, DYNAMIC, "
                    + "EOC, EODS, EXTERNAL, FILLER, FUNCTION-POINTER, GDS, GLOBAL, GRAPHIC, GROUP-USAGE, INDEX, "
                    + "INVMPSZ, INVPARTN, INVREQ, IS, JUST, JUSTIFIED, KA, LEADING, LEASM, LIB, LIN, MAPFAIL, "
                    + "MARGINS, NODE, NODATEPROC, NODP, NOEPILOG, NOFLAGMIG, NOGRAPHIC, NOLIB, NOOPSEQUENCE, NOOPT, "
                    + "NOOPTIMIZE, NOP, NOPROLOG, NOSTDTRUNC, NSEQ, OCCURS, OP, OPMARGINS, OPSEQUENCE, "
                    + "PACKED-DECIMAL, PARTNFAIL, PIC, PICTURE, POINTER, POINTER-32, PROCEDURE-POINTER, PROLOG, "
                    + "RDATT, REDEFINES, RES, SIGN, SYMBOL, SYNC, SYNCHRONIZED, SZ, TRAILING, TRIG, UNEXPIN, USAGE, UTF-8,"
                    + " VALUE, VALUES, YEARWINDOW, YW, '.', IDENTIFIER}",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
