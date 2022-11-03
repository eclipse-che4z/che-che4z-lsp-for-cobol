1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:56   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:56   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC303M    Date 06/04/2022  Time 11:56:56   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC3034.2
   000002         000200 PROGRAM-ID.                                                      NC3034.2
   000003         000300     NC303M.                                                      NC3034.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF                      NC3034.2
   000005         000500*OBSOLETE HIGH SUBSET NUCLEUS FEATURES.                           NC3034.2
   000006         000600 DATE-COMPILED. 06/04/22.                                         NC3034.2
   000007         000700*Message expected for above statement: OBSOLETE                   NC3034.2
   000008         000800 ENVIRONMENT DIVISION.                                            NC3034.2
   000009         000900 CONFIGURATION SECTION.                                           NC3034.2
   000010         001000 SOURCE-COMPUTER.                                                 NC3034.2
   000011         001100     XXXXX082.                                                    NC3034.2
   000012         001200 OBJECT-COMPUTER.                                                 NC3034.2
   000013         001300     XXXXX083.                                                    NC3034.2
   000014         001400                                                                  NC3034.2
   000015         001500                                                                  NC3034.2
   000016         001600 PROCEDURE DIVISION.                                              NC3034.2
   000017         001700                                                                  NC3034.2
   000018         001800 NC303M-CONTROL.                                                  NC3034.2
   000019         001900     ALTER NC303M-GOTO TO PROCEED TO NC303M-GOTO-2,               NC3034.2 24 28
   000020         002000         NC303M-GOTO-2 TO PROCEED TO NC303M-CONTROL.              NC3034.2 28 18
   000021         002100*Message expected for above statement: OBSOLETE                   NC3034.2
   000022         002200     STOP RUN.                                                    NC3034.2
   000023         002300                                                                  NC3034.2
   000024         002400 NC303M-GOTO.                                                     NC3034.2
   000025         002500     GO TO.                                                       NC3034.2
   000026         002600*Message expected for above statement: OBSOLETE                   NC3034.2
   000027         002700                                                                  NC3034.2
   000028         002800 NC303M-GOTO-2.                                                   NC3034.2
   000029         002900     GO TO.                                                       NC3034.2
   000030         003000*Message expected for above statement: OBSOLETE                   NC3034.2
   000031         003100                                                                  NC3034.2
   000032         003200*TOTAL NUMBER OF FLAGS EXPECTED = 4.                              NC3034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC303M    Date 06/04/2022  Time 11:56:56   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC303M    Date 06/04/2022  Time 11:56:56   Page     5
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

       18   NC303M-CONTROL . . . . . . . .  T20
       24   NC303M-GOTO. . . . . . . . . .  A19
       28   NC303M-GOTO-2. . . . . . . . .  T19 A20
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC303M    Date 06/04/2022  Time 11:56:56   Page     6
0 Defined   Cross-reference of programs     References

        3   NC303M
-* Statistics for COBOL program NC303M:
 *    Source records = 32
 *    Data Division statements = 0
 *    Procedure Division statements = 4
 *    Generated COBOL statements = 0
 *    Program complexity factor = 4
0End of compilation 1,  program NC303M,  no statements flagged.
0Return code 0
