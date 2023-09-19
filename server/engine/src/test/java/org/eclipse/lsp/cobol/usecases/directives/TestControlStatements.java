/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.directives;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/**
 * Test compiler directives parsing
 */
class TestControlStatements {
  private static final String TEXT = "       CBL %s\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. A.";

  @ParameterizedTest
  @MethodSource("listDirectives")
  void test(String directive) {
    UseCaseEngine.runTest(String.format(TEXT, directive), ImmutableList.of(), ImmutableMap.of());
  }

  private static Stream<Arguments> listDirectives() {
    return Stream.of(

            Arguments.of("APOST"), Arguments.of("QUOTE"), Arguments.of("Q"),

            Arguments.of("ARITH(COMPAT)"), Arguments.of("ARITH(EXTEND)"),
            Arguments.of("AR(C)"), Arguments.of("AR(E)"),

            Arguments.of("CICS"), Arguments.of("NOCICS"), Arguments.of("CICS(\"string3\")"),

            Arguments.of("CODEPAGE(1140)"), Arguments.of("CP(1140)"),

            Arguments.of("CURRENCY($)"), Arguments.of("NOCURRENCY"),
            Arguments.of("CURR($)"), Arguments.of("NOCURR"),

            Arguments.of("DBCS"), Arguments.of("NODBCS"),

            Arguments.of("NSYMBOL(NATIONAL)"), Arguments.of("NSYMBOL(DBCS)"),
            Arguments.of("NS(NAT)"), Arguments.of("NS(DBCS)"),

            Arguments.of("NUMBER"), Arguments.of("NONUMBER"),
            Arguments.of("NUM"), Arguments.of("NONUM"),

            Arguments.of("QUALIFY(COMPAT)"), Arguments.of("QUALIFY(EXTEND)"),
            Arguments.of("QUA(C)"), Arguments.of("QUA(E)"),

            Arguments.of("SEQUENCE"), Arguments.of("NOSEQUENCE"),
            Arguments.of("SEQ"), Arguments.of("NOSEQ"),

            Arguments.of("NOSQL"), Arguments.of("SQL"), Arguments.of("SQL(\"string1\")"),

            Arguments.of("SQLCCSID"), Arguments.of("NOSQLCCSID"),
            Arguments.of("SQLC"), Arguments.of("NOSQLC"),

            Arguments.of("NOSQLIMS"), Arguments.of("SQLIMS"), Arguments.of("SQLIMS(\"string1\")"),

            Arguments.of("SUPPRESS"), Arguments.of("NOSUPPRESS"),
            Arguments.of("SUPP"), Arguments.of("NOSUPP"),

            Arguments.of("NOWORD"), Arguments.of("WORD(CICS)"),
            Arguments.of("NOWD"), Arguments.of("WD(CICS)"),

            Arguments.of("XMLPARSE(XMLSS)"), Arguments.of("XMLPARSE(COMPAT)"),
            Arguments.of("XP(X)"), Arguments.of("XP(C)"),

            Arguments.of("INTDATE(ANSI)"), Arguments.of("INTDATE(LILIAN)"),

            Arguments.of("LANGUAGE(ENGLISH)"),
            Arguments.of("LANGUAGE(JAPANESE)"),
            Arguments.of("LANGUAGE(UENGLISH)"),

            Arguments.of("LANG(EN)"), Arguments.of("LANG(UE)"),
            Arguments.of("LANG(JA)"), Arguments.of("LANG(JP)"),

            Arguments.of("LINECOUNT(60)"), Arguments.of("LC(60)"),

            Arguments.of("LIST"), Arguments.of("NOLIST"),

            Arguments.of("NOMAP"), Arguments.of("MAP"),
            Arguments.of("MAP(HEX)"), Arguments.of("MAP(DEC)"),

            Arguments.of("NOOFFSET"), Arguments.of("OFFSET"),
            Arguments.of("NOOFF"), Arguments.of("OFF"),

            Arguments.of("SOURCE"), Arguments.of("NOSOURCE"),
            Arguments.of("S"), Arguments.of("NOS"),

            Arguments.of("SPACE(1)"),
            Arguments.of("SPACE(2)"),
            Arguments.of("SPACE(3)"),

            Arguments.of("TERMINAL"), Arguments.of("NOTERMINAL"),
            Arguments.of("TERM"), Arguments.of("NOTERM"),

            Arguments.of("VBREF"), Arguments.of("NOVBREF"),

            Arguments.of("NOXREF"), Arguments.of("XREF"),
            Arguments.of("XREF(FULL)"), Arguments.of("XREF(SHORT)"),
            Arguments.of("NOX"), Arguments.of("X"),
            Arguments.of("X(FULL)"), Arguments.of("X(SHORT)"),

            Arguments.of("COMPILE"), Arguments.of("NOCOMPILE"),
            Arguments.of("NOCOMPILE(S)"),
            Arguments.of("NOCOMPILE(E)"),
            Arguments.of("NOCOMPILE(W)"),

            Arguments.of("C"), Arguments.of("NOC"),
            Arguments.of("NOC(S)"),
            Arguments.of("NOC(E)"),
            Arguments.of("NOC(W)"),

            Arguments.of("NOCOPYRIGHT"), Arguments.of("COPYRIGHT('copyright string')"),
            Arguments.of("NOCPYR"), Arguments.of("CPYR('copyright string')"),

            Arguments.of("DECK"), Arguments.of("NODECK"),
            Arguments.of("D"), Arguments.of("NOD"),

            Arguments.of("NAME"),
            Arguments.of("NAME(ALIAS)"),
            Arguments.of("NAME(NOALIAS)"),
            Arguments.of("NONAME"),

            Arguments.of("OBJECT"), Arguments.of("NOOBJECT"),
            Arguments.of("OBJ"), Arguments.of("NOOBJ"),

            Arguments.of("PGMNAME(COMPAT)"),
            Arguments.of("PGMNAME(LONGMIXED)"),
            Arguments.of("PGMNAME(LONGUPPER)"),
            Arguments.of("PGMN(CO)"), Arguments.of("PGMN(LM)"), Arguments.of("PGMN(LU)"),

            Arguments.of("NOSERVICE"), Arguments.of("SERVICE('service string')"),
            Arguments.of("NOSERV"), Arguments.of("SERV('copyright string')"),

            Arguments.of("ADV"), Arguments.of("NOADV"),

            Arguments.of("AFP(VOLATILE)"), Arguments.of("AFP(NOVOLATILE)"),

            Arguments.of("ARCH(7)"),
            Arguments.of("ARCH(8)"),
            Arguments.of("ARCH(9)"),
            Arguments.of("ARCH(10)"),
            Arguments.of("ARCH(11)"),

            Arguments.of("AWO"), Arguments.of("NOAWO"),

            Arguments.of("BLOCK0"), Arguments.of("NOBLOCK0"),

            Arguments.of("DISPSIGN(COMPAT)"), Arguments.of("DISPSIGN(SEP)"),
            Arguments.of("DS(C)"), Arguments.of("DS(S)"),

            Arguments.of("DLL"), Arguments.of("NODLL"),

            Arguments.of("EXPORTALL"), Arguments.of("NOEXPORTALL"),
            Arguments.of("EXP"), Arguments.of("NOEXP"),

            Arguments.of("FASTSRT"), Arguments.of("NOFASTSRT"),
            Arguments.of("FSRT"), Arguments.of("NOFSRT"),

            Arguments.of("HGPR(PRESERVE)"), Arguments.of("HGPR(NOPRESERVE)"),

            Arguments.of("INLINE"), Arguments.of("NOINLINE"),
            Arguments.of("INL"), Arguments.of("NOINL"),

            Arguments.of("MAXPCF(60000)"),

            Arguments.of("NUMCHECK"), Arguments.of("NONUMCHECK"),
            Arguments.of("NUMCHECK(ABD)"), Arguments.of("NUMCHECK(MSG)"),
            Arguments.of("NUMCHECK(NOBIN)"), Arguments.of("NUMCHECK(BIN)"),
            Arguments.of("NUMCHECK(NOPAC)"), Arguments.of("NUMCHECK(PAC)"),
            Arguments.of("NUMCHECK(NOZON)"), Arguments.of("NUMCHECK(ZON)"),
            Arguments.of("NUMCHECK(ZON(ALPHNUM))"), Arguments.of("NUMCHECK(ZON(NOALPHNUM))"),
            Arguments.of("NUMCHECK(ZON(NOALPHNUM),NOBIN,PAC)"),

            Arguments.of("NC"), Arguments.of("NONC"),
            Arguments.of("NC(ABD)"), Arguments.of("NC(MSG)"),
            Arguments.of("NC(NOBIN)"), Arguments.of("NC(BIN)"),
            Arguments.of("NC(NOPAC)"), Arguments.of("NC(PAC)"),
            Arguments.of("NC(NOZON)"), Arguments.of("NC(ZON)"),
            Arguments.of("NC(ZON(ALPHNUM))"), Arguments.of("NC(ZON(NOALPHNUM))"),
            Arguments.of("NC(ZON(NOALPHNUM),NOBIN,PAC)"),

            Arguments.of("NUMPROC(NOPFD)"), Arguments.of("NUMPROC(PFD)"),

            Arguments.of("OPTIMIZE(0)"),
            Arguments.of("OPTIMIZE(1)"),
            Arguments.of("OPTIMIZE(2)"),
            Arguments.of("OPT(0)"),
            Arguments.of("OPT(1)"),
            Arguments.of("OPT(2)"),

            Arguments.of("OUTDD(SYSOUT)"),
            Arguments.of("OUT(SYSOUT)"),

            Arguments.of("PARMCHECK"),
            Arguments.of("NOPARMCHECK"),
            Arguments.of("PARMCHECK(MSG)"),
            Arguments.of("PARMCHECK(ABD)"),
            // FIXME: Arguments.of("PARMCHECK(MSG,100)"),
            // FIXME: Arguments.of("PARMCHECK(ABD,100)"),
            Arguments.of("PC"),
            Arguments.of("NOPC"),
            Arguments.of("PC(MSG)"),
            Arguments.of("PC(ABD)"),
            // FIXME: Arguments.of("PC(MSG,100)"),
            // FIXME: Arguments.of("PC(ABD,100)"),

            Arguments.of("TRUNC(STD)"),
            Arguments.of("TRUNC(OPT)"),
            Arguments.of("TRUNC(BIN)"),

            Arguments.of("VLR(STANDARD)"),
            Arguments.of("VLR(COMPAT)"),
            Arguments.of("VLR(S)"),
            Arguments.of("VLR(C)"),

            Arguments.of("NOZONECHECK"),
            Arguments.of("ZONECHECK(ABD)"), Arguments.of("ZONECHECK(MSG)"),
            Arguments.of("NOZC"),
            Arguments.of("ZC(ABD)"), Arguments.of("ZC(MSG)"),

            Arguments.of("ZONEDATA(PFD)"),
            Arguments.of("ZONEDATA(MIG)"),
            Arguments.of("ZONEDATA(NOPFD)"),
            Arguments.of("ZD(PFD)"),
            Arguments.of("ZD(MIG)"),
            Arguments.of("ZD(NOPFD)"),

            Arguments.of("ZWB"), Arguments.of("NOZWB"),

            Arguments.of("BUFSIZE(4096)"), Arguments.of("BUFSIZE(4K)"),
            Arguments.of("BUF(4096)"), Arguments.of("BUF(4K)"),

            Arguments.of("DATA(31)"), Arguments.of("DATA(24)"),

            Arguments.of("DYNAM"), Arguments.of("NODYNAM"),
            Arguments.of("DYN"), Arguments.of("NODYN"),

            Arguments.of("RENT"), Arguments.of("NORENT"),

            Arguments.of("RMODE(AUTO)"),
            Arguments.of("RMODE(24)"),
            Arguments.of("RMODE(ANY)"),

            Arguments.of("STGOPT"), Arguments.of("NOSTGOPT"),
            Arguments.of("SO"), Arguments.of("NOSO"),

            Arguments.of("DIAGTRUNC"), Arguments.of("NODIAGTRUNC"),
            Arguments.of("DTR"), Arguments.of("NODTR"),

            Arguments.of("DUMP"), Arguments.of("NODUMP"),
            Arguments.of("DU"), Arguments.of("NODU"),

            Arguments.of("FLAG(I)"),
            Arguments.of("FLAG(I,W)"),
            Arguments.of("NOFLAG"),
            Arguments.of("F(I)"),
            Arguments.of("F(I,W)"),
            Arguments.of("NOF"),

            Arguments.of("NOFLAGSTD"),
            Arguments.of("FLAGSTD(M)"),
            Arguments.of("FLAGSTD(M,O)"),

            Arguments.of("INITCHECK"),
            Arguments.of("INITCHECK(LAX)"),
            Arguments.of("INITCHECK(STRICT)"),
            Arguments.of("NOINITCHECK"),
            Arguments.of("IC"),
            Arguments.of("IC(LAX)"),
            Arguments.of("IC(STRICT)"),
            Arguments.of("NOIC"),

            Arguments.of("NORULES"),
            Arguments.of("RULES(ENDPERIOD)"),
            Arguments.of("RULES(ENDP)"),
            Arguments.of("RULES(NOENDPERIOD)"),
            Arguments.of("RULES(EVENPACK)"),
            Arguments.of("RULES(EVENP)"),
            Arguments.of("RULES(NOEVENPACK)"),
            Arguments.of("RULES(LAXPERF)"),
            Arguments.of("RULES(LXPRF)"),
            Arguments.of("RULES(NOLAXPERF)"),
            Arguments.of("RULES(SLACKBYTES)"),
            Arguments.of("RULES(SLCKB)"),
            Arguments.of("RULES(NOSLACKBYTES)"),
            Arguments.of("RULES(ENDPERIOD,EVENPACK,LAXPERF,SLACKBYTES)"),

            Arguments.of("NOSSRANGE"),
            Arguments.of("SSRANGE(NOZLEN)"),
            Arguments.of("SSRANGE(ZLEN)"),
            Arguments.of("SSRANGE(ABD)"),
            Arguments.of("SSRANGE(MSG)"),
            Arguments.of("SSRANGE(NOZLEN,ABD)"),
            Arguments.of("NOSSR"),
            Arguments.of("SSR(NOZLEN)"),
            Arguments.of("SSR(ZLEN)"),
            Arguments.of("SSR(ABD)"),
            Arguments.of("SSR(MSG)"),
            Arguments.of("SSR(NOZLEN,ABD)"),

            Arguments.of("TEST"),
            Arguments.of("NOTEST"),
            Arguments.of("TEST(DWARF)"),
            Arguments.of("TEST(NODWARF)"),
            Arguments.of("TEST(EJPD)"),
            Arguments.of("TEST(NOEJPD)"),
            Arguments.of("TEST(EJPD)"),
            Arguments.of("TEST(NOEJPD)"),
            Arguments.of("TEST(SEPARATE)"),
            Arguments.of("TEST(SEPARATE(DSNAME))"),
            Arguments.of("TEST(SEPARATE(NODSNAME))"),
            Arguments.of("TEST(NOSEPARATE)"),
            Arguments.of("TEST(SOURCE)"),
            Arguments.of("TEST(NOSOURCE)"),
            Arguments.of("TEST(NODWARF,SEPARATE(DSNAME))"),
            Arguments.of("NOTEST(DWARF)"),
            Arguments.of("NOTEST(NODWARF)"),
            Arguments.of("NOTEST(EJPD)"),
            Arguments.of("NOTEST(NOEJPD)"),
            Arguments.of("NOTEST(EJPD)"),
            Arguments.of("NOTEST(NOEJPD)"),
            Arguments.of("NOTEST(SEPARATE)"),
            Arguments.of("NOTEST(SEPARATE(DSNAME))"),
            Arguments.of("NOTEST(SEPARATE(NODSNAME))"),
            Arguments.of("NOTEST(NOSEPARATE)"),
            Arguments.of("NOTEST(SOURCE)"),
            Arguments.of("NOTEST(NOSOURCE)"),
            Arguments.of("NOTEST(NODWARF,SEPARATE(DSNAME))"),

            Arguments.of("ADATA"),
            Arguments.of("NOADATA"),

            Arguments.of("NOCOPYLOC"),
            Arguments.of("COPYLOC(DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("COPYLOC(MYLIB,DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("COPYLOC(SYSLIB,DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("COPYLOC(SYSLIB,PATH('/home/userid/copylib1'))"),
            Arguments.of("NOCPLC"),
            Arguments.of("CPLC(DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("CPLC(MYLIB,DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("CPLC(SYSLIB,DSN(USERID.COBOL.COPYLIB1))"),
            Arguments.of("CPLC(SYSLIB,PATH('/home/userid/copylib1'))"),

            Arguments.of("NOEXIT"),
            Arguments.of("EXIT(INEXIT(mod1))"),
            Arguments.of("EXIT(INEXIT('str1',mod1))"),
            Arguments.of("EXIT(NOINEXIT)"),
            Arguments.of("EXIT(LIBEXIT(mod2))"),
            Arguments.of("EXIT(LIBEXIT('str2',mod2))"),
            Arguments.of("EXIT(NOLIBEXIT)"),
            Arguments.of("EXIT(PRTEXIT(mod3))"),
            Arguments.of("EXIT(PRTEXIT('str3',mod3))"),
            Arguments.of("EXIT(NOPRTEXIT)"),
            Arguments.of("EXIT(ADEXIT(mod4))"),
            Arguments.of("EXIT(ADEXIT('str4',mod4))"),
            Arguments.of("EXIT(NOADEXIT)"),
            Arguments.of("EXIT(MSGEXIT(mod5))"),
            Arguments.of("EXIT(MSGEXIT('str5',mod5))"),
            Arguments.of("EXIT(NOMSGEXIT)"),
            Arguments.of("NOEX"),
            Arguments.of("EX(INX(mod1))"),
            Arguments.of("EX(INX('str1',mod1))"),
            Arguments.of("EX(NOINX)"),
            Arguments.of("EX(LIBX(mod2))"),
            Arguments.of("EX(LIBX('str2',mod2))"),
            Arguments.of("EX(NOLIBX)"),
            Arguments.of("EX(PRTX(mod3))"),
            Arguments.of("EX(PRTX('str3',mod3))"),
            Arguments.of("EX(NOPRTX)"),
            Arguments.of("EX(ADX(mod4))"),
            Arguments.of("EX(ADX('str4',mod4))"),
            Arguments.of("EX(NOADX)"),
            Arguments.of("EX(MSGX(mod5))"),
            Arguments.of("EX(MSGX('str5',mod5))"),
            Arguments.of("EX(NOMSGX)"),

            Arguments.of("MDECK"),
            Arguments.of("NOMDECK"),
            Arguments.of("MDECK(COMPILE)"),
            Arguments.of("MDECK(NOCOMPILE)"),
            Arguments.of("MD"),
            Arguments.of("NOMD"),
            Arguments.of("MD(C)"),
            Arguments.of("MD(NOC)"),

            Arguments.of("OPTFILE"),

            Arguments.of("THREAD"),
            Arguments.of("NOTHREAD"),

            Arguments.of("VSAMOPENFS(COMPAT)"),
            Arguments.of("VSAMOPENFS(SUCC)"),
            Arguments.of("VS(C)"),
            Arguments.of("VS(S)")
    );
  }
}
