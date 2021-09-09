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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** This test checks that the compiler directives that contain typos processed as usual lines */
class TestTyposOnCompilerDirectives {
  private static final String PROCESS_WITHOUT_NUMBER_TYPO =
      "PROESS {DATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITH_NUMBER_TYPO =
      "012345 {PROESS|1} DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITHOUT_NUMBER_DATA_TYPO =
      "PROCESS {DDATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITH_NUMBER_DATA_TYPO =
      "012345 PROCESS {DDATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String FOLLOWING_TEXT =
      "000000 Identification DIVISION.                                         23323232\r\n"
          + "002800 Program-ID.                                                      23323232\r\n"
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2\r\n";

  private static final String DATA_ERROR_MESSAGE =
      "Syntax error on 'DDATA' expected {ADATA, ADV, APOST, AR, ARITH, AWO, BLOCK0, BUF, BUFSIZE, CBLCARD, "
          + "CICS, COBOL2, COBOL3, CODEPAGE, COMPILE, CP, CPP, CPSM, CURR, CURRENCY, C, DATA, DATEPROC, "
          + "DBCS, DEBUG, DECK, DIAGTRUNC, DLL, DP, DTR, DU, DUMP, DYN, DYNAM, D, EDF, EPILOG, EXIT, EXP, "
          + "EXPORTALL, FASTSRT, FEPI, FLAG, FLAGSTD, FSRT, F, GDS, GRAPHIC, INTDATE, LANG, LANGUAGE, LC,"
          + " LEASM, LENGTH, LIB, LIN, LINECOUNT, LINKAGE, LIST, MAP, MARGINS, MD, MDECK, NAME, NATLANG, "
          + "NOADATA, NOADV, NOAWO, NOBLOCK0, NOC, NOCBLCARD, NOCICS, NOCMPR2, NOCOMPILE, NOCPSM, NOCURR, "
          + "NOCURRENCY, NOD, NODATEPROC, NODBCS, NODE, NODEBUG, NODECK, NODIAGTRUNC, NODLL, NODP, NODTR, "
          + "NODU, NODUMP, NODYN, NODYNAM, NOEDF, NOEPILOG, NOEXIT, NOEXP, NOEXPORTALL, NOF, NOFASTSRT, "
          + "NOFEPI, NOFLAG, NOFLAGMIG, NOFLAGSTD, NOFSRT, NOGRAPHIC, NOLENGTH, NOLIB, NOLINKAGE, NOLIST, "
          + "NOMAP, NOMD, NOMDECK, NONAME, NONUM, NONUMBER, NOOBJ, NOOBJECT, NOOFF, NOOFFSET, NOOPSEQUENCE, "
          + "NOOPT, NOOPTIMIZE, NOOPTIONS, NOP, NOPROLOG, NORENT, NOS, NOSEQ, NOSEQUENCE, NOSOURCE, NOSPIE, "
          + "NOSQL, NOSQLC, NOSQLCCSID, NOSSR, NOSSRANGE, NOSTDTRUNC, NOTERM, NOTERMINAL, NOTEST, NOTHREAD, "
          + "NOVBREF, NOWD, NOWORD, NOX, NOXREF, NOZWB, NS, NSEQ, NSYMBOL, NUM, NUMBER, NUMPROC, OBJ, OBJECT, "
          + "OFF, OFFSET, OP, OPMARGINS, OPSEQUENCE, OPT, OPTFILE, OPTIMIZE, OPTIONS, OUT, OUTDD, PGMN, "
          + "PGMNAME, PROLOG, QUOTE, Q, RENT, RES, RMODE, SEQ, SEQUENCE, SIZE, SOURCE, SP, SPACE, SPIE, SQL, "
          + "SQLC, SQLCCSID, SSR, SSRANGE, SYSEIB, SZ, S, TERM, TERMINAL, TEST, THREAD, TRUNC, VBREF, WD, WORD, "
          + "XMLPARSE, XOPTS, XP, XREF, X, YEARWINDOW, YW, ZWB, ','}";

  @Test
  void testProcessWithoutNumbersWithTypo() {
    UseCaseEngine.runTest(
        PROCESS_WITHOUT_NUMBER_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'DATA' expected {CBL, ID, IDENTIFICATION, PROCESS}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testProcessWithNumbersWithTypo() {
    UseCaseEngine.runTest(
        PROCESS_WITH_NUMBER_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'PROESS' expected {CBL, ID, IDENTIFICATION, PROCESS}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testProcessWithTypoOnData() {
    UseCaseEngine.runTest(
        PROCESS_WITH_NUMBER_DATA_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                DATA_ERROR_MESSAGE,
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testProcessWithoutNumberWithTypoOnData() {
    UseCaseEngine.runTest(
        PROCESS_WITHOUT_NUMBER_DATA_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                DATA_ERROR_MESSAGE,
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
