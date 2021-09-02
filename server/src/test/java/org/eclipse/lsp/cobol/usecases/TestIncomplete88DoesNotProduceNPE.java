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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** Typing the variable definition of 88 level should not produce NPE */
class TestIncomplete88DoesNotProduceNPE {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*A1} PIC 9.\n"
          + "           88{|1}\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on '<EOF>' expected {ABEND, ADATA, ADDRESS, ADV, ALIAS, ANSI, ANY, APOST, AR, "
                    + "ARITH, ATTRIBUTE, AUTO, AUTODISPLAY, AWO, BACKPAGE, BACKSCAN, BIN, BLINK, BLOCK0, BLUE, "
                    + "BOTTOM, BRIGHT, BROWSE, BUF, BUFFER, BUFSIZE, BUT, CALC, CBLCARD, CHECK, CICS, CO, COBOL2, "
                    + "COBOL3, CODEPAGE, COMPAT, COMPILE, CONTENTS, COPIES, CORRECT, COUNT, CP, CPP, CPSM, CR, CS, "
                    + "CURR, CURRENCY, C, DARK, DATASTREAM, DATEPROC, DBCS, DBNAME, DBNODE, DB-KEY, DC, DD, DEBUG, "
                    + "DECK, DEQUEUE, DEST, DETECT, DFLD, DIAGTRUNC, DICTNAME, DICTNODE, DIFFERENT, DLL, DP, DTR, "
                    + "DU, DUMP, DUPLICATE, DYN, DYNAM, D, EAU, ECHO, EDF, EDIT, 80CR, EJPD, EN, ENDPAGE, ENDRPT, "
                    + "ENGLISH, ENQUEUE, EPILOG, EXIT, EXITS, EXP, EXPORTALL, EXTEND, EXTRANEOUS, E, FASTSRT, FEPI, "
                    + "FIELD, FIELDS, FILLER, FIND, FIRST, FLAG, FLAGSTD, 40CR, FSRT, FULL, F, GDS, GRAPHIC, GREEN, "
                    + "HEADER, HOOK, H, IDENTICAL, IDMS, INTDATE, INTERNAL, I, JA, JOURNAL, JP, KA, LANG, LANGUAGE, "
                    + "LC, LEASM, LILIAN, LIN, LINECOUNT, LINK, LIST, LM, LOADLIB, LOCATION, LOG, LONGMIXED, "
                    + "LONGTERM, LONGUPPER, LU, MAP, MAPS, MARGINS, MAX, MD, MDECK, MDT, MEMBERS, MIG, MIXED, "
                    + "MMDDYYYY, MODIFIED, MODIFY, M, NAME, NAT, NATLANG, NEWPAGE, NN, NOADATA, NOADV, NOALARM, "
                    + "NOALIAS, NOAUTODISPLAY, NOAWO, NOBACKPAGE, NOBACKSCAN, NOBLINK, NOBLOCK0, NOC, NOCBLCARD, "
                    + "NOCICS, NOCMPR2, NOCOLOR, NOCOMPILE, NOCPSM, NOCURR, NOCURRENCY, NOD, NODATEPROC, NODBCS, "
                    + "NODE, NODEADLOCK, NODEBUG, NODECK, NODENAME, NODIAGTRUNC, NODLL, NODP, NODTR, NODU, NODUMP, "
                    + "NODYN, NODYNAM, NOEDF, NOEJPD, NOEPILOG, NOEXIT, NOEXP, NOEXPORTALL, NOF, NOFASTSRT, NOFEPI, "
                    + "NOFLAG, NOFLAGMIG, NOFLAGSTD, NOFSRT, NOGRAPHIC, NOHOOK, NOIO, NOKBD, NOLENGTH, NOLIB, "
                    + "NOLINKAGE, NOLIST, NOLOCK, NOMAP, NOMD, NOMDECK, NOMDT, NONAME, NONUM, NONUMBER, NOOBJ, "
                    + "NOOBJECT, NOOFF, NOOFFSET, NOOPSEQUENCE, NOOPT, NOOPTIMIZE, NOOPTIONS, NOP, NOPFD, NOPROLOG, "
                    + "NOPRT, NORENT, NORETURN, NORMAL, NORMAL-VIDEO, NOS, NOSEQ, NOSEQUENCE, NOSOURCE, NOSPAN, "
                    + "NOSPIE, NOSQL, NOSQLC, NOSQLCCSID, NOSSR, NOSSRANGE, NOSTDTRUNC, NOTERM, NOTERMINAL, NOTEST, "
                    + "NOTHREAD, NOTIFICATION, NOTIFY, NOTRIG, NOUNDERSCORE, NOVBREF, NOWD, NOWORD, NOX, NOXREF, "
                    + "NOZWB, NS, NSEQ, NSYMBOL, NUM, NUMBER, NUMPROC, N, OBJ, OBJECT, OBTAIN, OFF, OFFSET, OP, "
                    + "OPMARGINS, OPSEQUENCE, OPT, OPTFILE, OPTIMIZE, OPTIONS, OUT, OUTDD, OUTIN, OWNER, PAGE-INFO, "
                    + "PARMS, PERMANENT, PFD, PGMN, PGMNAME, PINK, PRINTER, PROLOG, PROTECTED, QUOTE, Q, RED, "
                    + "REDISPATCH, REMARKS, RENT, REPLY, RES, RESETKBD, RESETMDT, RESUME, RETENTION, RETRIEVAL, "
                    + "RETURNKEY, REVERSE-VIDEO, RMODE, RUN-UNIT, SCHEMA, SCRATCH, SCREEN, SELECTIVE, SEP, SEPARATE, "
                    + "SEQ, SEQUENCE, SHORT, 64CR, SIZE, SOURCE, SP, SPAN, SPIE, SQLC, SQLCCSID, SS, SSR, SSRANGE, "
                    + "STARTPAGE, STARTPRT, STD, STGID, STORE, SYSEIB, SZ, S, TERM, TERMINAL, TEST, THREAD, TIMER, "
                    + "TODAYS-DATE, TODAYS-NAME, TOP, TRIG, TRUNC, TURQUOISE, UE, UNDERSCORE, UNFORMATTED, "
                    + "UNPROTECTED, UPDATE, UPGRADE, UPPER, USAGE-MODE, U, VALUE, VALUES, VBREF, WCC, WD, WHITE, "
                    + "WITHIN, WORD, W, XMLPARSE, XMLSS, XP, XREF, X, YEAR, YEARWINDOW, YELLOW, YW, YYYYDDD, "
                    + "YYYYMMDD, ZWB, IDENTIFIER}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
