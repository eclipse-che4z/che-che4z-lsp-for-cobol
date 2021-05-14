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
      "Syntax error on 'DDATA' expected {ADATA, ADV, APOST, ARITH, AWO, BLOCK0, BUF, BUFSIZE, CBLCARD, COBOL2, "
          + "COBOL3, COMPILE, CPP, CPSM, CURR, DATEPROC, DECK, DIAGTRUNC, DLL, DTR, DYN, DYNAM, EDF, EPILOG, EXP, "
          + "EXPORTALL, FASTSRT, FEPI, FLAG, FLAGSTD, FSRT, INTDATE, LANG, LEASM, LIB, LIN, LINECOUNT, MARGINS, "
          + "MDECK, NOADATA, NOADV, NOAWO, NOBLOCK0, NOC, NOCBLCARD, NOCICS, NOCMPR2, NOCOMPILE, NOCPSM, NOCURR, "
          + "NOCURRENCY, NOD, NODATEPROC, NODBCS, NODEBUG, NODECK, NODIAGTRUNC, NODLL, NODP, NODTR, NODU, NODYN, "
          + "NODYNAM, NOEDF, NOEPILOG, NOEXIT, NOEXP, NOEXPORTALL, NOF, NOFASTSRT, NOFEPI, NOFLAG, NOFLAGMIG, "
          + "NOFLAGSTD, NOFSRT, NOGRAPHIC, NOLENGTH, NOLIB, NOLINKAGE, NOLIST, NOMAP, NOMD, NOMDECK, NONAME, "
          + "NONUM, NONUMBER, NOOBJ, NOOBJECT, NOOFF, NOOFFSET, NOOPSEQUENCE, NOOPT, NOOPTIMIZE, NOOPTIONS, NOP, "
          + "NOPROLOG, NORENT, NOS, NOSEQ, NOSOURCE, NOSPIE, NOSQL, NOSQLC, NOSQLCCSID, NOSSR, NOSSRANGE, "
          + "NOSTDTRUNC, NOSEQUENCE, NOTERM, NOTERMINAL, NOTEST, NOTHREAD, NOVBREF, NOWD, NOWORD, NOX, NOXREF, "
          + "NOZWB, NSEQ, NSYMBOL, NUM, NUMPROC, OBJ, OFF, OFFSET, OPMARGINS, OPSEQUENCE, OPT, OPTFILE, OUTDD, "
          + "PGMN, PGMNAME, PROLOG, RENT, RES, RMODE, SEQ, SEQUENCE, SPIE, SQLC, SQLCCSID, SSR, SSRANGE, SYSEIB, "
          + "TERM, TRUNC, VBREF, WORD, XOPTS, XMLPARSE, XREF, YEARWINDOW, ZWB, CODEPAGE, C, D, F, Q, S, X, AR, CP, "
          + "DP, DU, LC, MD, NS, OP, SP, SZ, WD, XP, YW, CICS, CURRENCY, DATA, DBCS, DEBUG, DUMP, EXIT, GDS, GRAPHIC, "
          + "LANGUAGE, LENGTH, LINKAGE, LIST, MAP, NAME, NATLANG, NODE, NODUMP, NUMBER, OBJECT, OPTIMIZE, OPTIONS, "
          + "OUT, QUOTE, SIZE, SOURCE, SPACE, SQL, TERMINAL, TEST, THREAD, ','}";

  @Test
  void testProcessWithoutNumbersWithTypo() {
    UseCaseEngine.runTest(
        PROCESS_WITHOUT_NUMBER_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'DATA' expected {CBL, IDENTIFICATION, ID, PROCESS}",
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
                "Syntax error on 'PROESS' expected {CBL, IDENTIFICATION, ID, PROCESS}",
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
