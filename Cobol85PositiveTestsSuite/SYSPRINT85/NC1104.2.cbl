1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:38   Page     1
0Options in effect:
  NOADATA
    ADV
    AFP(NOVOLATILE)
    QUOTE
    ARCH(8)
    ARITH(COMPAT)
  NOAWO
  NOBLOCK0
    BUFSIZE(4096)
  NOCICS
    CODEPAGE(1140)
  NOCOMPILE(S)
  NOCOPYLOC
  NOCOPYRIGHT
  NOCURRENCY
    DATA(31)
    DBCS
  NODECK
  NODEFINE
  NODIAGTRUNC
    DISPSIGN(COMPAT)
  NODLL
  NODUMP
  NODYNAM
  NOEXIT
  NOEXPORTALL
  NOFASTSRT
    FLAG(I,I)
  NOFLAGSTD
    HGPR(PRESERVE)
  NOINITCHECK
  NOINITIAL
    INLINE
    INTDATE(ANSI)
  NOINVDATA
    LANGUAGE(EN)
    LINECOUNT(60)
  NOLIST
    LP(32)
  NOMAP
    MAXPCF(100000)
  NOMDECK
  NONAME
    NSYMBOL(NATIONAL)
  NONUMBER
  NONUMCHECK
    NUMPROC(NOPFD)
    OBJECT
  NOOFFSET
    OPTIMIZE(0)
    OUTDD(SYSOUT)
  NOPARMCHECK
    PGMNAME(COMPAT)
    QUALIFY(COMPAT)
    RENT
    RMODE(AUTO)
  NORULES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:38   Page     2
0 NOSERVICE
    SEQUENCE
    SOURCE(DEC)
    SPACE(1)
  NOSQL
    SQLCCSID
  NOSQLIMS
  NOSSRANGE
  NOSTGOPT
    SUPPRESS
  NOTERM
  NOTEST(NODWARF,NOSOURCE,NOSEPARATE)
  NOTHREAD
    TRUNC(STD)
    TUNE(8)
  NOVBREF
    VLR(STANDARD)
    VSAMOPENFS(COMPAT)
  NOWORD
    XMLPARSE(XMLSS)
    XREF(FULL)
    ZWB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC110M    Date 06/04/2022  Time 11:56:38   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1104.2
   000002         000200 PROGRAM-ID.                                                      NC1104.2
   000003         000300     NC110M.                                                      NC1104.2
   000004         000500*                                                              *  NC1104.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1104.2
   000006         000700*                                                              *  NC1104.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1104.2
   000008         000900*                                                              *  NC1104.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1104.2
   000010         001100*                                                              *  NC1104.2
   000011         001300*                                                              *  NC1104.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1104.2
   000013         001500*                                                              *  NC1104.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1104.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1104.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1104.2
   000017         001900*                                                              *  NC1104.2
   000018         002100*                                                                 NC1104.2
   000019         002200*    THE PROCEDURE DIVISION OF NC110M CONSISTS ENTIRELY OF        NC1104.2
   000020         002300*    PARAGRAPH NAMES AND "DISPLAY" LITERAL STATEMENTS.            NC1104.2
   000021         002400*                                                                 NC1104.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC1104.2
   000023         002600 CONFIGURATION SECTION.                                           NC1104.2
   000024         002700 SOURCE-COMPUTER.                                                 NC1104.2
   000025         002800     XXXXX082.                                                    NC1104.2
   000026         002900 OBJECT-COMPUTER.                                                 NC1104.2
   000027         003000     XXXXX083.                                                    NC1104.2
   000028         003100 DATA DIVISION.                                                   NC1104.2
   000029         003200 PROCEDURE    DIVISION.                                           NC1104.2
   000030         003300 HEADER-PRINT.                                                    NC1104.2
   000031         003400     DISPLAY " ".                                                 NC1104.2
   000032         003500     DISPLAY                                                      NC1104.2
   000033         003600     " FOR OFFICIAL USE ONLY                                    ".NC1104.2
   000034         003700     DISPLAY                                                      NC1104.2
   000035         003800     "     OFFICIAL COBOL COMPILER TEST SYSTEM.     ".            NC1104.2
   000036         003900     DISPLAY                                                      NC1104.2
   000037         004000     "                TEST RESULTS SET- NC110M                  ".NC1104.2
   000038         004100     DISPLAY                                                      NC1104.2
   000039         004200     "                                                          ".NC1104.2
   000040         004300     DISPLAY                                                      NC1104.2
   000041         004400     " FOR OFFICIAL USE ONLY "                                    NC1104.2
   000042         004500     "                                                         ". NC1104.2
   000043         004600     DISPLAY                                                      NC1104.2
   000044         004700     "COPYRIGHT  1985".                                           NC1104.2
   000045         004800     DISPLAY                                                      NC1104.2
   000046         004900     "                                                          ".NC1104.2
   000047         005000     DISPLAY                                                      NC1104.2
   000048         005100     " FEATURE     RESULTS AND                                  ".NC1104.2
   000049         005200     DISPLAY                                                      NC1104.2
   000050         005300     " TESTED      REMARKS                                      ".NC1104.2
   000051         005400     DISPLAY                                                      NC1104.2
   000052         005500     "                                                          ".NC1104.2
   000053         005600     DISPLAY                                                      NC1104.2
   000054         005700     " ---------------------------------------------------------".NC1104.2
   000055         005800 GO-TEST.                                                         NC1104.2
   000056         005900     DISPLAY                                                      NC1104.2
   000057         006000     " GO TO       THIS TEST PASSES UNLESS FAIL APPEARS BELOW.  ".NC1104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC110M    Date 06/04/2022  Time 11:56:38   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     GO       TO PERFORM-TEST.                                    NC1104.2 62
   000059         006200 GO-FAIL.                                                         NC1104.2
   000060         006300     DISPLAY                                                      NC1104.2
   000061         006400     "             FAIL".                                         NC1104.2
   000062         006500 PERFORM-TEST.                                                    NC1104.2
   000063         006600     DISPLAY                                                      NC1104.2
   000064         006700     " PERFORM     THIS TEST FAILS UNLESS PASS APPEARS BELOW.   ".NC1104.2
   000065         006800     PERFORM  PASS.                                               NC1104.2 84
   000066         006900 ENDER-PRINT.                                                     NC1104.2
   000067         007000     DISPLAY                                                      NC1104.2
   000068         007100     " ---------------------------------------------------------".NC1104.2
   000069         007200     DISPLAY                                                      NC1104.2
   000070         007300     SPACE.                                                       NC1104.2 IMP
   000071         007400     DISPLAY                                                      NC1104.2
   000072         007500     "                  END OF TEST - NC110M                    ".NC1104.2
   000073         007600     DISPLAY                                                      NC1104.2
   000074         007700     "                  CHECK FOR ERRORS                        ".NC1104.2
   000075         007800     DISPLAY                                                      NC1104.2
   000076         007900     "                                                          ".NC1104.2
   000077         008000     DISPLAY                                                      NC1104.2
   000078         008100     " FOR OFFICIAL USE ONLY "                                    NC1104.2
   000079         008200     DISPLAY                                                      NC1104.2
   000080         008300     "COPYRIGHT  1985".                                           NC1104.2
   000081         008400     DISPLAY                                                      NC1104.2
   000082         008500     "       NTIS DISTRIBUTION COBOL 1985               ".        NC1104.2
   000083         008600     STOP RUN.                                                    NC1104.2
   000084         008700 PASS.                                                            NC1104.2
   000085         008800     DISPLAY                                                      NC1104.2
   000086         008900     "             PASS".                                         NC1104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC110M    Date 06/04/2022  Time 11:56:38   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC110M    Date 06/04/2022  Time 11:56:38   Page     6
0Context usage is indicated by the letter preceding a procedure-name reference.
 These letters and their meanings are:
     A = ALTER (procedure-name)
     D = GO TO (procedure-name) DEPENDING ON
     E = End of range of (PERFORM) through (procedure-name)
     G = GO TO (procedure-name)
     P = PERFORM (procedure-name)
     T = (ALTER) TO PROCEED TO (procedure-name)
     U = USE FOR DEBUGGING (procedure-name)

  Defined   Cross-reference of procedures   References

       66   ENDER-PRINT
       59   GO-FAIL
       55   GO-TEST
       30   HEADER-PRINT
       84   PASS . . . . . . . . . . . . .  P65
       62   PERFORM-TEST . . . . . . . . .  G58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC110M    Date 06/04/2022  Time 11:56:38   Page     7
0 Defined   Cross-reference of programs     References

        3   NC110M
-* Statistics for COBOL program NC110M:
 *    Source records = 86
 *    Data Division statements = 0
 *    Procedure Division statements = 27
 *    Generated COBOL statements = 0
 *    Program complexity factor = 27
0End of compilation 1,  program NC110M,  no statements flagged.
0Return code 0
